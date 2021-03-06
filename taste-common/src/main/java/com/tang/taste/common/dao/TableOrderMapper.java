package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.TableOrder;
import com.tang.taste.common.entity.pojo.TableOrderExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TableOrderMapper {
    long countByExample(TableOrderExample example);

    int deleteByExample(TableOrderExample example);

    int insert(TableOrder record);

    int insertSelective(TableOrder record);

    List<TableOrder> selectByExample(TableOrderExample example);

    int updateByExampleSelective(@Param("record") TableOrder record, @Param("example") TableOrderExample example);

    int updateByExample(@Param("record") TableOrder record, @Param("example") TableOrderExample example);
}