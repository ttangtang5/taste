package com.tang.taste.portal.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.dao.DishesMapper;
import com.tang.taste.common.entity.extra.PageHelper;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.entity.pojo.ShoppingCart;
import com.tang.taste.common.entity.pojo.ShoppingCartDetail;
import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.util.CookieUtils;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.portal.service.ContentService;
import com.tang.taste.portal.service.DishesService;
import com.tang.taste.portal.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * FileName: ShoppingCartController
 * @Author:   16
 * Date:     2018/4/16 9:24
 * Description:购物车控制类
 */
@RequestMapping("shoppingCart")
@Controller
public class ShoppingCartController {

    @Autowired
    private DishesService dishesService;
    @Autowired
    private ShoppingCartService shoppingCartService;
    /**
     * 商品添加至购物车
     * @param goodsName  商品名称
     * @param goodsPrice 商品价格
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/add")
    @ResponseBody
    public String addGoods(String goodsName,String goodsPrice, HttpServletRequest request, HttpServletResponse response) throws Exception{
        StringBuffer stringBuffer = new StringBuffer();
        ShoppingCart shoppingCart = new ShoppingCart();
        ShoppingCartDetail shoppingCartDetail = new ShoppingCartDetail();
        Dishes dishes = dishesService.getDishesByGoodsName(goodsName);
        Map msg = Maps.newHashMap();
        String goodsValue = CookieUtils.getCookieValue(request, String.valueOf(dishes.getId()));
        //获取user
        User user = SessionUtils.getUser(request);
        //CookieUtils.deleteCookie(request,response,goodsName);
        //如果购物车没此商品则加入购物车。
        if(goodsValue == null || goodsValue == ""){
            //判断商品是否在供应期
            if(dishes != null) {
                if (true) {
                   /* stringBuffer.append(goodsName);
                    stringBuffer.append("=");*/
                    stringBuffer.append(1);
                    stringBuffer.append(":");
                    stringBuffer.append(goodsPrice);
                    CookieUtils.setCookie(request, response, String.valueOf(dishes.getId()), stringBuffer.toString(), 60 * 60 * 24 * 7);
                    if(user != null){
                        shoppingCart.setUserId(user.getId());
                        shoppingCart.setStatus(0);
                        shoppingCart.setSumMoney(Double.valueOf(goodsPrice));
                        ShoppingCart shoppingCart1 = shoppingCartService.getShoppingCartByUserId(user.getId());
                        int cartId = 0;
                        if(shoppingCart1 == null){
                            cartId = shoppingCartService.addShoppingCart(shoppingCart);
                        }else{
                            cartId = shoppingCart1.getCartId();
                            shoppingCart.setSumMoney(shoppingCart1.getSumMoney() + Double.valueOf(goodsPrice));
                            shoppingCartService.updateShoppingCart(shoppingCart, user.getId());
                        }
                        shoppingCartDetail.setCartId(cartId);
                        shoppingCartDetail.setDishesId(dishes.getId());
                        shoppingCartDetail.setNum(1);
                        shoppingCartDetail.setStatus(0);
                        shoppingCartService.addShoppingCartDetail(shoppingCartDetail);
                    }
                    msg.put("id", dishes.getId());
                    msg.put("status", 200);
                    //不存在该商品标志
                    msg.put("isflag", 0);
                }
            }
        }else{
            //存在该商品则
            String[] goods = goodsValue.split(":");
            if(goods.length == 2){
                String num = goods[0];
                Integer integer = Integer.valueOf(num)+1;
                stringBuffer.append(integer);
                stringBuffer.append(":");
                stringBuffer.append(goodsPrice);
                CookieUtils.setCookie(request,response,String.valueOf(dishes.getId()),stringBuffer.toString(),60*60*24*7);
                if(user != null) {
                    shoppingCart = shoppingCartService.getShoppingCartByUserId(user.getId());
                    shoppingCartDetail.setDishesId(dishes.getId());
                    shoppingCartDetail.setCartId(shoppingCart.getCartId());
                    shoppingCartService.updateShoppindCartDetail(shoppingCartDetail);
                    shoppingCart.setCartId(null);
                    if (shoppingCart != null) {
                        shoppingCart.setSumMoney(shoppingCart.getSumMoney() + Double.valueOf(goodsPrice));
                    }
                    shoppingCartService.updateShoppingCart(shoppingCart, user.getId());
                }
                msg.put("id", dishes.getId());
                msg.put("status", 200);
                //存在该商品标志
                msg.put("isflag", 1);
            }
        }
        return JSON.toJSONString(msg);
    }

    /**
     * 初始化购物车
     * @param goods cookie存在的名字
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/initCart")
    @ResponseBody
    public String initCart(Integer[] goods,HttpServletRequest request) throws  Exception {
        if(goods != null && goods.length > 0){
            List<Integer> list = Arrays.asList(goods);
            List<Dishes> dishes = dishesService.getDishesByGoodsNames(list);
            return JSON.toJSONString(dishes);
        }
        return null;
    }

    /**
     * 显示购物车内容
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/cartDetailShow")
    @ResponseBody
    public String cartDetailShow(HttpServletRequest request) throws  Exception{
        PageHelper page = new PageHelper();
        List<ShoppingCartDetail> rows = Lists.newArrayList();
        //获取用户
        User user = SessionUtils.getUser(request);
        if(user != null){
            ShoppingCart shoppingCart = shoppingCartService.getShoppingCartByUserId(user.getId());
            if(shoppingCart != null){
                rows = shoppingCartService.getShoppingCartDetailByCartId(shoppingCart.getCartId());
                long count = shoppingCartService.countShoppingCartDetailByCartId(shoppingCart.getCartId());
                page.setRows(rows);
                page.setTotal(count);
                double total = 0;
                for (ShoppingCartDetail shoppingCartDetail : rows) {
                    total = total + shoppingCartDetail.getDishesTotal();
                }
                SessionUtils.setAttr(request,"total",total);
                return JSON.toJSONString(rows);
            }else{
                return null;
            }
        }else {
            List list = Lists.newArrayList();
            List num = Lists.newArrayList();
            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++){
                String[] c = cookies[i].getValue().split(":");
                if(c.length > 1 && c[1] != null){
                    list.add(cookies[i].getName());
                    num.add(c[0]);
                }
            }
            List<Dishes> dishes = dishesService.getDishesByGoodsNames(list);
            if(dishes != null){
                long count = 0;
                for (int i = 0; i < dishes.size(); i++){
                    for (int j =0 ; j < list.size(); j++) {
                        if(String.valueOf(dishes.get(i).getId()) != null && String.valueOf(dishes.get(i).getId()) .equals(list.get(j).toString())){
                            ShoppingCartDetail shoppingCartDetail = new ShoppingCartDetail();
                            shoppingCartDetail.setDishesId(dishes.get(i).getId());
                            shoppingCartDetail.setDishesName(dishes.get(i).getDishesName());
                            shoppingCartDetail.setDishesPicture(dishes.get(i).getPicture());
                            shoppingCartDetail.setDishesPrice(dishes.get(i).getDishesPrice());
                            shoppingCartDetail.setNum(Integer.valueOf(num.get(i).toString()));
                            shoppingCartDetail.setDishesTotal(Double.valueOf(num.get(i).toString())*dishes.get(i).getDishesPrice());
                            rows.add(shoppingCartDetail);
                            count ++;
                        }
                    }
                }
                page.setRows(rows);
                page.setTotal(count);
                double total = 0;
                for (ShoppingCartDetail shoppingCartDetail : rows) {
                    total = total + shoppingCartDetail.getDishesTotal();
                }
                SessionUtils.setAttr(request,"total",total);
                return JSON.toJSONString(rows);
            }
        }
        return null;
    }

    /**
     * 将商品从购物车中移除
     * @param dishesName
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeCart")
    @ResponseBody
    public String removeCart(String dishesName,HttpServletRequest request,HttpServletResponse response) throws Exception{
        Dishes dishes = dishesService.getDishesByGoodsName(dishesName);
        String num = CookieUtils.getCookieValue(request,String.valueOf(dishes.getId()));
        CookieUtils.deleteCookie(request,response,String.valueOf(dishes.getId()));
        return num.split(":")[0];
    }

}
