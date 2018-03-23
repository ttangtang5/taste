package com.tang.taste.portal.controller;

import com.tang.taste.common.util.SessionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * FileName: IndexController
 * @Author:   16
 * Date:     2018/3/22 11:18
 * Description:前台辅助跳转
 */
@Controller
@RequestMapping
public class IndexController {

    /**
     * 跳转登录
     * @return
     * @throws Exception
     */
    @RequestMapping("toLogin")
    public String toLogin(HttpServletRequest request) throws Exception{
        Cookie[] cookies = request.getCookies();
        for(int i = 0 ;i < cookies.length; i++){
            String name = cookies[i].getName();
            if("id".equals(name)){
                SessionUtils.setAttr(request,"id",cookies[i].getValue());
                return "portal/shop_index";
            }
        }
        return "login/login";
    }

    /**
     * 跳转首页
     * @return
     * @throws Exception
     */
    @RequestMapping("toIndex")
    public String toIndex() throws Exception{
        return "portal/shop_index";
    }

}
