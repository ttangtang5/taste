package com.tang.taste.manage.dao;

import com.tang.taste.common.dao.EmployeeMapper;
import com.tang.taste.common.dao.UserMapper;
import com.tang.taste.common.entity.pojo.Employee;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

/**
 * FileName: EmpDao
 * @Author:   16
 * Date:     2018/4/21 17:28
 * Description:员工扩展类。
 */
public interface EmpDao extends EmployeeMapper{

    List<Employee> selectEmployeeList(@Param("findContent") String findContent);

    Set<String> selectAllpermission(@Param("empName") String empName);

    List<Employee> selectDistribution();
}
