package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.entity.pojo.DishesExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DishesMapper {
    long countByExample(DishesExample example);

    int deleteByExample(DishesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Dishes record);

    int insertSelective(Dishes record);

    List<Dishes> selectByExample(DishesExample example);

    Dishes selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Dishes record, @Param("example") DishesExample example);

    int updateByExample(@Param("record") Dishes record, @Param("example") DishesExample example);

    int updateByPrimaryKeySelective(Dishes record);

    int updateByPrimaryKey(Dishes record);
}