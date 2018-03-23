package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.ShoppingCartDetail;
import com.tang.taste.common.entity.pojo.ShoppingCartDetailExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoppingCartDetailMapper {
    long countByExample(ShoppingCartDetailExample example);

    int deleteByExample(ShoppingCartDetailExample example);

    int deleteByPrimaryKey(Integer cartId);

    int insert(ShoppingCartDetail record);

    int insertSelective(ShoppingCartDetail record);

    List<ShoppingCartDetail> selectByExample(ShoppingCartDetailExample example);

    ShoppingCartDetail selectByPrimaryKey(Integer cartId);

    int updateByExampleSelective(@Param("record") ShoppingCartDetail record, @Param("example") ShoppingCartDetailExample example);

    int updateByExample(@Param("record") ShoppingCartDetail record, @Param("example") ShoppingCartDetailExample example);

    int updateByPrimaryKeySelective(ShoppingCartDetail record);

    int updateByPrimaryKey(ShoppingCartDetail record);
}