package com.tang.taste.filter;

import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.util.SessionUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * FileName: LoginHandlerIntercepter
 * @Author:   16
 * Date:     2018/4/20 13:45
 * Description:
 */
public class LoginHandlerIntercepter implements HandlerInterceptor {

    @Value("${IGNORE_URI}")
    private String IGNORE_URI;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //对请求路径进行判断
        String servletPath = request.getServletPath();
        boolean flag = false;   //用于存储判断登录的结果
        String[] urls = IGNORE_URI.split(",");
        //判断请求是否需要拦截
        for(String s: urls){
            if(servletPath.contains(s)){
                flag = true;    //如果是不拦截的网站，flag为true,跳出循环，转向下个方法
                break;
            }
        }
        //拦截请求
        if(!flag){   //如果是非公开的页面↓
            User user = SessionUtils.getUser(request);
            if(user == null){
                //System.out.println("AuthorizationInterceptor拦截请求");
                //request.setAttribute("message", "请先登录管理员后再访问网站");
                response.sendRedirect("/toLogin");
            }else{
                //用户登陆过，验证通过，放行
                //System.out.println("AuthorizationInterceptor放行请求");
                flag = true;
            }
        }
        return flag;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
