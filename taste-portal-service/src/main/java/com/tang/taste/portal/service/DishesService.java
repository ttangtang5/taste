package com.tang.taste.portal.service;

import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.entity.pojo.DishesExample;
import com.tang.taste.manage.dao.DishesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName: DishesService
 * @Author:   16
 * Date:     2018/4/16 13:35
 * Description:菜品业务逻辑
 */
@Service
public class DishesService {

    @Autowired
    private DishesDao dishesDao;

    /**
     * 获取list中的商品信息
     * @param goods
     * @return
     */
    public List<Dishes> getDishesByGoodsNames(List<Integer> goods){
        DishesExample dishesExample = new DishesExample();
        dishesExample.createCriteria().andIdIn(goods);
        dishesExample.createCriteria().andDelFlagEqualTo(0);
        List<Dishes> list = dishesDao.selectByExample(dishesExample);
        return list;
    }

    /**
     * 通过商品名称获取信息
     * @param goodsName
     * @return
     */
    public Dishes getDishesByGoodsName(String goodsName){
        DishesExample dishesExample = new DishesExample();
        dishesExample.createCriteria().andDishesNameEqualTo(goodsName);
        dishesExample.createCriteria().andDelFlagEqualTo(0);
        List<Dishes> dishes = dishesDao.selectByExample(dishesExample);
        if(dishes != null && dishes.size() > 0){
            return dishes.get(0);
        }
        return null;
    }

}
