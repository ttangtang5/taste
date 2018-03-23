package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.Salary;
import com.tang.taste.common.entity.pojo.SalaryExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SalaryMapper {
    long countByExample(SalaryExample example);

    int deleteByExample(SalaryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Salary record);

    int insertSelective(Salary record);

    List<Salary> selectByExample(SalaryExample example);

    Salary selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Salary record, @Param("example") SalaryExample example);

    int updateByExample(@Param("record") Salary record, @Param("example") SalaryExample example);

    int updateByPrimaryKeySelective(Salary record);

    int updateByPrimaryKey(Salary record);
}