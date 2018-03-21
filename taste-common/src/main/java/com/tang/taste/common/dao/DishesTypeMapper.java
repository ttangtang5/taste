package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.DishesType;
import com.tang.taste.common.entity.pojo.DishesTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DishesTypeMapper {
    long countByExample(DishesTypeExample example);

    int deleteByExample(DishesTypeExample example);

    int deleteByPrimaryKey(Integer typeId);

    int insert(DishesType record);

    int insertSelective(DishesType record);

    List<DishesType> selectByExample(DishesTypeExample example);

    DishesType selectByPrimaryKey(Integer typeId);

    int updateByExampleSelective(@Param("record") DishesType record, @Param("example") DishesTypeExample example);

    int updateByExample(@Param("record") DishesType record, @Param("example") DishesTypeExample example);

    int updateByPrimaryKeySelective(DishesType record);

    int updateByPrimaryKey(DishesType record);
}