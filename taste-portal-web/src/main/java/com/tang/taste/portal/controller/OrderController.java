package com.tang.taste.portal.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.tang.taste.common.entity.pojo.*;
import com.tang.taste.common.util.CookieUtils;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.portal.service.DishesService;
import com.tang.taste.portal.service.OrderService;
import com.tang.taste.portal.service.ShoppingCartService;
import com.tang.taste.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return JSON.toJSONString(list);
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
    public String createOrder(HttpServletRequest request,int addressee,int num,String remarks) throws Exception{
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
        String pay_id = request.getParameter("pay_id"); //支付人的唯一标识
        String param = request.getParameter("param"); //自定义一些参数 支付后返回

        CookieUtils.setCookie(request,response,"pay_id",pay_id,60*60);

        String notify_url = notifyUrl;//通知地址
        String return_url = "http://c6d8bcd5.ngrok.io/order/paySuccess?order="+pay_id;//支付后同步跳转地址

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
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("paySuccess")
    public String paySuccess(HttpServletRequest request) throws  Exception{
        String pay_id =  CookieUtils.getCookieValue(request, "pay_id");
        orderService.updateOrderPayStatus(Integer.valueOf(pay_id));
        return "redirect:/toShopOrderList";
    }
}
