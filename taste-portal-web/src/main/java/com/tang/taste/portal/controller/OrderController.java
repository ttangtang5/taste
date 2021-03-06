package com.tang.taste.portal.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.tang.taste.common.entity.pojo.*;
import com.tang.taste.common.util.CookieUtils;
import com.tang.taste.common.util.DateUtil;
import com.tang.taste.common.util.FastdfsUitls;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.portal.service.DishesService;
import com.tang.taste.portal.service.OrderService;
import com.tang.taste.portal.service.ShoppingCartService;
import com.tang.taste.portal.service.UserService;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * FileName: OrderController
 * @Author:   16
 * Date:     2018/4/19 14:38
 * Description:订单控制层
 */
@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private DishesService dishesService;
    @Autowired
    private ShoppingCartService shoppingCartService;
    @Value("${NOTIFY_URL}")
    private String notifyUrl;
    @Value("${RETURN_URL}")
    private String returnUrl;

    /**
     * 显示订单列表
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("orderList")
    @ResponseBody
    public String getOrderList(HttpServletRequest request) throws Exception{
        User user = SessionUtils.getUser(request);
        List<Order> list = orderService.selectOrderList(user.getId());
        List<Order> lists = Lists.newArrayList();
        for (Order order : list) {
            order.setCreateTimeStr(DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss",order.getCreateTime()));
            lists.add(order);
        }
        return JSON.toJSONString(lists);
    }

    /**
     * 获取订单信息通过订单编号
     * @param orderId
     * @return
     * @throws Exception
     */
    @RequestMapping("getOrder")
    @ResponseBody
    public String getOrder(int orderId)throws Exception{
        Order order = orderService.selectOrderById(orderId);
        order.setCreateTimeStr(DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss",order.getCreateTime()));
        return JSON.toJSONString(order);
    }

    /**
     * 通过订单编号获取详情
     * @param orderId
     * @return
     * @throws Exception
     */
    @RequestMapping("orderDetaileList")
    @ResponseBody
    public String getOrderDetailList(int orderId) throws Exception{
        List<OrderDetail> list = orderService.selectOrderDetailList(orderId);
        return JSON.toJSONString(list);
    }

    /**
     * 删除订单 以及订单详情
     * @param orderId
     * @return
     * @throws Exception
     */
    @RequestMapping("delOrder")
    @ResponseBody
    public String delOrder(int orderId) throws Exception{
        String str = orderService.delOrder(orderId);
        return JSON.toJSONString(str);
    }

    /**
     * 创建订单
     * @param request
     * @param addressee
     * @param num
     * @param remarks
     * @return
     * @throws Exception
     */
    @RequestMapping("saveOrder")
    public String createOrder(int addressee,int num,String remarks,HttpServletRequest request,HttpServletResponse response) throws Exception{
        //保存订单
        User user = SessionUtils.getUser(request);
        List<OrderDetail> rows = Lists.newArrayList();
        //获取地址
        UserAddress userAddress = userService.getAddressById(addressee);
        Order order = new Order();
        order.setUserId(user.getId());
        order.setReceiver(userAddress.getAddressee());
        order.setAddress(userAddress.getAddress());
        order.setPhone(userAddress.getPhone());
        order.setNum(num);
        order.setBuyerMessage(remarks);
        order.setCreateTime(new Date());
        order.setStatus(1);
        //订单详情
        List list = Lists.newArrayList();
        List nums = Lists.newArrayList();
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++){
            String[] c = cookies[i].getValue().split(":");
            if(c.length > 1 && c[1] != null){
                list.add(cookies[i].getName());
                nums.add(c[0]);
            }
        }
        List<Dishes> dishes = dishesService.getDishesByGoodsNames(list);
        if(dishes != null){
            for (int i = 0; i < dishes.size(); i++){
                for (int j =0 ; j < list.size(); j++) {
                    if(String.valueOf(dishes.get(i).getId()) != null && String.valueOf(dishes.get(i).getId()) .equals(list.get(j).toString())){
                        OrderDetail orderDetail = new OrderDetail();
                        orderDetail.setDishesId(dishes.get(i).getId());
                        orderDetail.setPayPrice(0d);
                        orderDetail.setSpecialDiscount(0d);
                        orderDetail.setSumMoney(Double.valueOf(nums.get(i).toString())*dishes.get(i).getDishesPrice());
                        orderDetail.setSumNum(Integer.valueOf(nums.get(i).toString()));
                        rows.add(orderDetail);
                    }
                }
                CookieUtils.deleteCookie(request,response,String.valueOf(dishes.get(i).getId()));
            }
        }
        double total = 0;
        for (OrderDetail orderDetail : rows) {
            total = total + orderDetail.getSumMoney();
        }
        order.setSumNum(total);
        int orderId =  orderService.addOrder(order);
        for (OrderDetail orderDetail : rows) {
            orderDetail.setOrderId(orderId);
        }
        orderService.addOrderDetail(rows);
        //将购物车里面东西移除
        ShoppingCart shoppingCart = shoppingCartService.getShoppingCartByUserId(user.getId());
        shoppingCart.setSumMoney(0d);
        shoppingCartService.updateShoppingCart(shoppingCart,user.getId());
        shoppingCartService.deleteShoppingDetail(shoppingCart.getCartId());
        request.setAttribute("total",total);
        request.setAttribute("orderId",orderId);
        return "pay/payType";
    }

    /**
     *  付款信息
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("pay")
    public String toPay(HttpServletRequest request, HttpServletResponse response) throws Exception{
        /**
         * 接收参数 创建订单
         */
        String token = "XDca0b2mokapJFIEi3llt2IpIPIPaGw4"; //记得更改 http://codepay.fateqq.com 后台可设置
        String codepay_id ="46481" ;//记得更改 http://codepay.fateqq.com 后台可获得

        String price = request.getParameter("price"); //表单提交的价格
        String type = request.getParameter("type"); //支付类型  1：支付宝 2：QQ钱包 3：微信
        String pay_id = request.getParameter("payId"); //支付人的唯一标识
        String param = request.getParameter("param"); //自定义一些参数 支付后返回

        String notify_url = notifyUrl;//通知地址
        String return_url = returnUrl + pay_id;//支付后同步跳转地址

        System.out.println(return_url);
        if(price == null){
            price="1";
        }
        //参数有中文则需要URL编码
        String url="redirect:http://codepay.fateqq.com:52888/creat_order?id="+codepay_id+"&pay_id="+pay_id+"&price="+price+"&type="+type+"&token="+token+"&param="+param+"&notify_url="+notify_url+"&return_url="+return_url;
        return url;
    }

    /**
     * 通知
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("notify")
    public String notify(HttpServletRequest request) throws Exception{
        return "/pay/notify";
    }

    /**
     *支付成功
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("paySuccess")
    public String paySuccess(HttpServletRequest request) throws  Exception{
        String pay_id = (String) request.getAttribute("pay_id");
        orderService.updateOrderPayStatus(Integer.valueOf(pay_id));
        return "redirect:/toShopOrderList";
    }

    /**
     * 添加评价
     * @param orderId
     * @param rating
     * @param content
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("orderRate")
    public String orderRate(int orderId, Integer rating,String content, HttpServletRequest request) throws Exception{
        content = (String) request.getAttribute("content");
        String content2 = new String(content.getBytes("iso-8859-1"), "utf-8");
        List<String> url = (List) SessionUtils.getAttr(request, "url");
        StringBuffer sb = new StringBuffer();
        Order order = new Order();
        if(url != null ){
            for (String str : url) {
                sb.append(str);
                sb.append("==");
            }
            order.setRatePicture(sb.toString());
        }
        order.setOrderId(orderId);
        order.setRateContent(content2);
        order.setRateLevel(rating);
        order.setStatus(5);
        orderService.updateOrderRateStatus(order);
        return "portal/shop_order_list";
    }

    /**
     * 上传图片
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("uploadRate")
    @ResponseBody
    public String uploadRate(HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultiValueMap<String,MultipartFile> multipartFile = multipartRequest.getMultiFileMap();
        MultipartFile multi = multipartFile.getFirst("file");
        String fileName = multi.getOriginalFilename();
        String fileExtName = fileName.split("\\.")[1];
        if("jpg,png,jpeg".contains(fileExtName)){
            String [] fileMsg = FastdfsUitls.uploadFile(multi.getBytes(),fileExtName);
            List<String> url = (List) SessionUtils.getAttr(request, "url");
            if(url == null){
                url = Lists.newArrayList();
            }
            url.add("http://119.23.252.58/"+fileMsg[0]+"/"+fileMsg[1]);
            SessionUtils.setAttr(request,"url",url);
            return "200";
        }
        return "500";
    }

    /**
     * 提交预订
     * @param phone
     * @param num
     * @param time
     * @param time2
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("booking")
    public String bookingOrder(String phone,String captcha,int num,String time,String time2,HttpServletRequest request) throws Exception{
        Booking booking = new Booking();
        User user = SessionUtils.getUser(request);
        if(user == null){
            return "500";
        }
        String validateCode = SessionUtils.getValidateCode(request);
        if(validateCode != null && validateCode.equals(captcha)){
            booking.setUserId(user.getId());
            booking.setPhone(phone);
            booking.setNum(num);
            String timeStr = time + " " + time2;
            Date date = DateUtil.convertStringToDate("yyyy-MM-dd HH:mm:ss",timeStr);
            booking.setTime(date);
            return orderService.addBooking(booking);
        }
        return "/toBooking";
    }

    /**
     * 取消预定
     * @param id
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("bookingCancel")
    @ResponseBody
    public String bookingCancel(int id,HttpServletRequest request) throws Exception{
        return orderService.cancelBooking(id);
    }
}
