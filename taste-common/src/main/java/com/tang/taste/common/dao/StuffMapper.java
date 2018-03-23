package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.Stuff;
import com.tang.taste.common.entity.pojo.StuffExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StuffMapper {
    long countByExample(StuffExample example);

    int deleteByExample(StuffExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Stuff record);

    int insertSelective(Stuff record);

    List<Stuff> selectByExample(StuffExample example);

    Stuff selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Stuff record, @Param("example") StuffExample example);

    int updateByExample(@Param("record") Stuff record, @Param("example") StuffExample example);

    int updateByPrimaryKeySelective(Stuff record);

    int updateByPrimaryKey(Stuff record);
}