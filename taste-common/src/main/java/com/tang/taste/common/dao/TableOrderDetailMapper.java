package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.TableOrderDetail;
import com.tang.taste.common.entity.pojo.TableOrderDetailExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TableOrderDetailMapper {
    long countByExample(TableOrderDetailExample example);

    int deleteByExample(TableOrderDetailExample example);

    int deleteByPrimaryKey(Integer tableId);

    int insert(TableOrderDetail record);

    int insertSelective(TableOrderDetail record);

    List<TableOrderDetail> selectByExample(TableOrderDetailExample example);

    TableOrderDetail selectByPrimaryKey(Integer tableId);

    int updateByExampleSelective(@Param("record") TableOrderDetail record, @Param("example") TableOrderDetailExample example);

    int updateByExample(@Param("record") TableOrderDetail record, @Param("example") TableOrderDetailExample example);

    int updateByPrimaryKeySelective(TableOrderDetail record);

    int updateByPrimaryKey(TableOrderDetail record);
}