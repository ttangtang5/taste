package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.Tables;
import com.tang.taste.common.entity.pojo.TablesExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TablesMapper {
    long countByExample(TablesExample example);

    int deleteByExample(TablesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Tables record);

    int insertSelective(Tables record);

    List<Tables> selectByExample(TablesExample example);

    Tables selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Tables record, @Param("example") TablesExample example);

    int updateByExample(@Param("record") Tables record, @Param("example") TablesExample example);

    int updateByPrimaryKeySelective(Tables record);

    int updateByPrimaryKey(Tables record);
}