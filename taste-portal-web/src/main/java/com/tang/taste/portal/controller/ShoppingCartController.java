package com.tang.taste.portal.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.dao.DishesMapper;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.util.CookieUtils;
import com.tang.taste.portal.service.ContentService;
import com.tang.taste.portal.service.DishesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        Map msg = Maps.newHashMap();
        String goodsValue = CookieUtils.getCookieValue(request,goodsName);
        //CookieUtils.deleteCookie(request,response,goodsName);
        //如果购物车没此商品则加入购物车。
        if(goodsValue == null || goodsValue == ""){
            //判断商品是否在供应期
            if(true){
               /* stringBuffer.append(goodsName);
                stringBuffer.append("=");*/
                stringBuffer.append(1);
                stringBuffer.append(":");
                stringBuffer.append(goodsPrice);
                CookieUtils.setCookie(request,response,goodsName,stringBuffer.toString(),60*60*24*7);
                msg.put("status", 200);
                //不存在该商品标志
                msg.put("isflag", 0);
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
                CookieUtils.setCookie(request,response,goodsName,stringBuffer.toString(),60*60*24*7);
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
    public String initCart(String[] goods,HttpServletRequest request) throws  Exception {
        if(goods != null && goods.length > 0){
            List<String> list = Arrays.asList(goods);
            List<Dishes> dishes = dishesService.getDishesByGoodsNames(list);
            return JSON.toJSONString(dishes);
        }
        return null;
    }

}
