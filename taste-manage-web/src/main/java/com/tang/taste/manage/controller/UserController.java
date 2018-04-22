package com.tang.taste.manage.controller;

import com.tang.taste.manage.service.EmpService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * FileName: UserController
 * @Author:   16
 * Date:     2018/4/21 16:18
 * Description:用户控制层
 */
@RequestMapping("/")
@Controller
public class UserController {

    @Autowired
    private EmpService empService;

    @RequestMapping("login")
    public String login(String username, String password, Model model) throws Exception{
        //获取Subject --SecurityUtils.getSubject()
        Subject subject= SecurityUtils.getSubject();
        //将信息封装进usernamepasswordToken
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        //是否记住token.setRememberMe(true);
        System.out.println("1、"+token.hashCode());
        try {
            //调用subject.login();
            subject.login(token);
        } catch (AuthenticationException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/manage/toIndex";
    }


}
