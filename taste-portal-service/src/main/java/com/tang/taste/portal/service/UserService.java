package com.tang.taste.portal.service;

import com.tang.taste.portal.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
 * FileName: UserService
 * @Author:   16
 * Date:     2018/3/19 15:48
 * Description:用户业务逻辑层
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 添加用户
     * @param regPhoneNum
     * @param regPassword
     * @param captcha 验证码
     */
    public void addUser(String regPhoneNum,String regPassword,String captcha){

    }
}
