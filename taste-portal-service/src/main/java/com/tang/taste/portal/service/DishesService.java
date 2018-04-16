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
    public List<Dishes> getDishesByGoodsNames(List<String> goods){
        DishesExample dishesExample = new DishesExample();
        dishesExample.createCriteria().andDishesNameIn(goods);
        dishesExample.createCriteria().andDelFlagEqualTo(0);
        List<Dishes> list = dishesDao.selectByExample(dishesExample);
        return list;
    }

}