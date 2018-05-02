package com.tang.taste.global.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * FileName: GlobalExceptionResolver
 * @Author:   16
 * Date:     2018/2/8 14:54
 * Description:全局异常处理类
 */
public class GlobalExceptionResolver implements HandlerExceptionResolver {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionResolver.class);

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) {
        //控制台打印
        e.printStackTrace();
        //向日志写文件写入异常
        //logger.error("系统异常：",e);
        //发邮件通过jmail实现
        //发短信
        //展示错误页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message","系统繁忙，请稍后重试。");
        modelAndView.setViewName("portal/page_exception");
        return modelAndView;
    }
}
