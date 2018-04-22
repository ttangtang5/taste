package com.tang.taste.manage.service;

import com.tang.taste.common.entity.pojo.Employee;
import com.tang.taste.common.entity.pojo.EmployeeExample;
import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.entity.pojo.UserExample;
import com.tang.taste.manage.dao.EmpDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName: UserService
 * @Author:   16
 * Date:     2018/4/21 17:27
 * Description:用户逻辑层
 */
@Service("empService")
public class EmpService {

    @Autowired
    private EmpDao empDao;

    /**
     * 查找用户信息
     * @param username
     * @return
     */
    public List<Employee> selectUserByUsername(String username){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andPhoneEqualTo(username);
        criteria.andDelFlagEqualTo(0);
        return empDao.selectByExample(employeeExample);
    }

}
