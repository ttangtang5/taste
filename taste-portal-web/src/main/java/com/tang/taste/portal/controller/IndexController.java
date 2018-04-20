package com.tang.taste.portal.controller;

import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.util.ClusterRedis;
import com.tang.taste.common.util.CookieUtils;
import com.tang.taste.common.util.SerializeUtils;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Base64;

/**
 * FileName: IndexController
 * @Author:   16
 * Date:     2018/3/22 11:18
 * Description:前台辅助跳转
 */
@Controller
@RequestMapping
public class IndexController {

    @Autowired
    private UserService userService;
    @Autowired
    private ClusterRedis clusterRedis;
    @Value("${NOTIFY_URL}")
    private String notifyUrl;
    /**
     * 跳转登录
     * @return
     * @throws Exception
     */
    @RequestMapping("toLogin")
    public String toLogin(HttpServletRequest request) throws Exception{
        String value = CookieUtils.getCookieValue(request,"id");
        if(value != null && value !=""){
            String[] user = value.split(",");
            if(user !=null && user.length == 3){
                User user1 = new User();
                user1.setId(Integer.valueOf(user[0]));
                user1.setPhone(user[1]);
                user1.setPassword(user[2]);
                //校验密码信息
                String msg = userService.login(user1, "0", request, null);
                if("200".equals(msg)){
                    SessionUtils.setAttr(request,"id",user1.getId());
                    SessionUtils.setUser(request,user1);
                    return "redirect:toIndex";
                }
            }
        }
        return "login/login";
    }

    /**
     * 跳转首页
     * @return
     * @throws Exception
     */
    @RequestMapping("toIndex")
    public String toIndex(HttpServletRequest requeset) throws Exception{
        //判断是否登录
        String id = (String) SessionUtils.getAttr(requeset, "id");
        if(id != null && id != "" && id.contains("user:")){
         //从redis获取用户信息
            String userMsg = clusterRedis.getValue("user:" + id);
            //redis未命中 去数据库查找
            User user = null;
            if(userMsg == null || userMsg == ""){
                user =  userService.getUserById(id);
            }else{
                //命中内存反序列化
                user = (User)SerializeUtils.unSerialize(Base64.getDecoder().decode(clusterRedis.getValue("user:" + id)));
            }
            SessionUtils.setAttr(requeset,"username",user.getUserName());
        }
        return "portal/shop_index";
    }

    /**
     * 跳转个人中心
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopAccount")
    public String toShopAccount(HttpServletRequest request) throws Exception{
        User user = userService.getUserById("4");
        request.setAttribute("user",user);
        return "/portal/shop_account";
    }

    @RequestMapping("toShopCheckout")
    public String toShopCheckout() throws Exception{
        return "/portal/shop_checkout";
    }

    /**
     * 商品详情
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopItem")
    public String toShopItem() throws Exception{
        return "/portal/shop_item";
    }

    /**
     * 跳转搜索列表
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopProductList")
    public String toShopProductList() throws Exception{
        return "/portal/shop_product_list";
    }

    /**
     * 跳转购物车
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopShoppingCart")
    public String toShopShoppingCart() throws Exception{
        return "/portal/shop_shopping_cart";
    }

    /**
     * 跳转订单列表
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopOrderList")
    public String toShopWishList() throws Exception{
        return "/portal/shop_order_list";
    }

    /**
     * 跳转结算页面
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopOrder")
    public String toShopOrder() throws Exception{
        return "/portal/shop_order";
    }

    /**
     * 跳转地址管理
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopAddress")
    public String toShopAddress() throws Exception{
        return "/portal/shop_address";
    }

    /**
     * 跳转地图
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopMap")
    public String toShopMap() throws Exception{
        return "/portal/shop_map";
    }

    /**
     * 跳转订单详情
     * @return
     * @throws Exception
     */
    @RequestMapping("toShopOrderView")
    public String toShopOrderView() throws Exception{
        return "/portal/shop_order_view";
    }

    @RequestMapping("pay")
    public String toPay(HttpServletRequest request) throws Exception{
        /**
         * 接收参数 创建订单
         */
        String token = "XDca0b2mokapJFIEi3llt2IpIPIPaGw4"; //记得更改 http://codepay.fateqq.com 后台可设置
        String codepay_id ="46481" ;//记得更改 http://codepay.fateqq.com 后台可获得

        String price = request.getParameter("price"); //表单提交的价格
        String type = request.getParameter("type"); //支付类型  1：支付宝 2：QQ钱包 3：微信
        String pay_id = request.getParameter("pay_id"); //支付人的唯一标识
        String param = request.getParameter("param"); //自定义一些参数 支付后返回

        String notify_url = notifyUrl;//通知地址
        String return_url = "http://www.baidu.com";//支付后同步跳转地址

        if(price == null){
            price="1";
        }
        //参数有中文则需要URL编码
        String url="redirect:http://codepay.fateqq.com:52888/creat_order?id="+codepay_id+"&pay_id="+pay_id+"&price="+price+"&type="+type+"&token="+token+"&param="+param+"&notify_url="+notify_url+"&return_url="+return_url;
        return url;
    }

    @RequestMapping("notify")
    public String demo(HttpServletRequest request) throws Exception{
        return "/pay/notify";
    }

}
