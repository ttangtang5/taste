package com.tang.taste.manage.service;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.entity.pojo.DishesExample;
import com.tang.taste.manage.dao.DishesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * FileName: DishseService
 * @Author:   16
 * Date:     2018/4/22 16:11
 * Description:菜品业务逻辑
 */
@Service
public class DishesService {

    @Autowired
    private DishesDao dishesDao;

    /**
     * 通过分类id查询不分页
     * @param categoryId
     * @return
     */
    public List<Dishes> selectDishes(int categoryId){
       return dishesDao.selectDishes(categoryId);
    }

    /**
     * 后台菜品列表
     * @param findsContent
     * @param categoryId
     * @return
     */
    public List<Dishes> selectDishesMange(String findsContent,int categoryId){
        return dishesDao.selectDishesMange(findsContent, categoryId);
    }

    /**
     * 添加菜品
     * @param dishes
     * @return
     */
    public String addDishes(Dishes dishes){
        Map map = Maps.newHashMap();
        DishesExample dishesExample = new DishesExample();
        DishesExample.Criteria criteria = dishesExample.createCriteria();
        criteria.andDishesNameEqualTo(dishes.getDishesName());
        criteria.andDelFlagEqualTo(0);
        List<Dishes> exit = dishesDao.selectByExample(dishesExample);
        if(exit == null || exit.size() < 1 ){
            int num = dishesDao.insertSelective(dishes);
            if(num == 1){
                map.put("status", "success");
                map.put("message", "添加成功！");
                return JSON.toJSONString(map);
            }
        }
        map.put("status", "error");
        map.put("message", "添加失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 更新图片
     * @param dishesName
     * @param picture
     * @return
     */
    public int updatePicture(String dishesName,String picture){
        Dishes dishes = new Dishes();
        dishes.setPicture(picture);
        DishesExample dishesExample = new DishesExample();
        dishesExample.createCriteria().andDishesNameEqualTo(dishesName);
       return dishesDao.updateByExampleSelective(dishes, dishesExample);
    }

    public String delDishes(String ids){
        Map map =Maps.newHashMap();
        if(ids != null && ids != ""){
            DishesExample dishesExample = new DishesExample();
            DishesExample.Criteria criteria = dishesExample.createCriteria();
            String[] id = ids.split(",");
            List<Integer> list = Lists.newArrayList();
            for (String str : id) {
                list.add(Integer.valueOf(str));
            }
            criteria.andIdIn(list);
            Dishes dishes = new Dishes();
            dishes.setDelFlag(1);
            dishesDao.updateByExampleSelective(dishes, dishesExample);
            map.put("status", "success");
            map.put("message", "删除成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "error");
        map.put("message", "删除失败！");
        return JSON.toJSONString(map);
    }
}
