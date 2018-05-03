package com.tang.taste.filter;


import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

/**
 * FileName: XSSCheckFilter
 * @Author:   16
 * Date:     2018/5/3 13:27
 * Description:XSS 检查过滤器 js脚本攻击
 */
public class XSSCheckFilter implements HandlerInterceptor {

    /**
     * 需要拦截的JS字符关键字
      */
    private String errorPath;
    /**
      *非法xss 字符
      */
    private static String[] SAFE_LESS = { "set-cookie", "<", "%3c", "%3e", ">", "\\" };

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        JsRequest jsRequest = new JsRequest(request);
        Enumeration<?> params = jsRequest.getParameterNames();
        String requestUrl = jsRequest.getRequestURI();
        if (isSafeStr(requestUrl)) {
            while (params.hasMoreElements()) {
                String paramKey = (String) params.nextElement();
                String paramValue = jsRequest.getParameter(paramKey);
                jsRequest.setAttribute(paramKey,paramValue);
            }
        }
        jsRequest.setAttribute("flag","11111");
        request = jsRequest;
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    /**
     * 判断URL是否存在非法字符
     * */
    private boolean isSafeStr(String str) {
        if (StringUtils.isNotBlank(str)) {
            for (String s : SAFE_LESS) {
                if (str.toLowerCase().contains(s)) {
                    return false;
                }
            }
        }
        return true;
    }

    public String getErrorPath() {
        return errorPath;
    }

    public void setErrorPath(String errorPath) {
        this.errorPath = errorPath;
    }


}
