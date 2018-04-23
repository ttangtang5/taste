package com.tang.taste.manage.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.manage.service.DishesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * FileName: DishesController
 * @Author:   16
 * Date:     2018/4/22 16:18
 * Description:菜品控制层
 */
@Controller
@RequestMapping("dishes")
public class DishesController {

    @Autowired
    private DishesService dishesService;

    @RequestMapping("/getDishesByCategory")
    @ResponseBody
    public String getDishesByCategory(int categoryId) throws  Exception{
        List<Dishes> lists = dishesService.selectDishes(categoryId);
        List<Map> list = Lists.newArrayList();
        for (Dishes dishes : lists){
            Map map = Maps.newHashMap();
            map.put("id", dishes.getId());
            map.put("name", dishes.getDishesName());
            map.put("desc", dishes.getDishesName()+"---"+dishes.getDishesPrice());
            list.add(map);
        }
        return JSON.toJSONString(list);
    }
}
