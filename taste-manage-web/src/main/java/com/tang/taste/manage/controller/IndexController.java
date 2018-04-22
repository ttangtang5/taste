package com.tang.taste.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * FileName: IndexController
 * @Author:   16
 * Date:     2018/4/21 15:58
 * Description:跳转控制层
 */
@RequestMapping("manage")
@Controller
public class IndexController {

    /**
     * 跳转首页
     * @return
     * @throws Exception
     */
    @RequestMapping("/toIndex")
    public String toIndex() throws Exception{
        return "manage/index";
    }

    /**
     * 跳转登录
     * @return
     * @throws Exception
     */
    @RequestMapping("/toLogin")
    public String toLogin() throws Exception{
        return "login/login";
    }

}
