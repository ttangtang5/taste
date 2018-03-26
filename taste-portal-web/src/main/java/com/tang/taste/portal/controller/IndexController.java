package com.tang.taste.portal.controller;

import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.util.ClusterRedis;
import com.tang.taste.common.util.CookieUtils;
import com.tang.taste.common.util.SerializeUtils;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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

    /**
     * 跳转登录
     * @return
     * @throws Exception
     */
    @RequestMapping("toLogin")
    public String toLogin(HttpServletRequest request) throws Exception{
        String value = CookieUtils.getCookieValue(request,"id");
        if(value != null && value !=""){
            SessionUtils.setAttr(request,"id",value);
            return "redirect:toIndex";
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

    @RequestMapping("toShopAccount")
    public String toShopAccount() throws Exception{
        return "/portal/shop_account";
    }

    @RequestMapping("toShopCheckout")
    public String toShopCheckout() throws Exception{
        return "/portal/shop_checkout";
    }

    @RequestMapping("toShopItem")
    public String toShopItem() throws Exception{
        return "/portal/shop_item";
    }

    @RequestMapping("toShopProductList")
    public String toShopProductList() throws Exception{
        return "/portal/shop_product_list";
    }

    @RequestMapping("toShopShoppingCart")
    public String toShopShoppingCart() throws Exception{
        return "/portal/shop_shopping_cart";
    }

    @RequestMapping("toShopStandartForms")
    public String toShopStandartForms() throws Exception{
        return "/portal/shop_standart_forms";
    }

    @RequestMapping("toShopWishList")
    public String toShopWishList() throws Exception{
        return "/portal/shop_wishlist";
    }

}
