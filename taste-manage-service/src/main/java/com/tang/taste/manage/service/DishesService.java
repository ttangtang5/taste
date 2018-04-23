package com.tang.taste.manage.service;

import com.google.common.collect.Lists;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.entity.pojo.DishesExample;
import com.tang.taste.manage.dao.DishesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
