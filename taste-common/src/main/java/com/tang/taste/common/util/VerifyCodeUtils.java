package com.tang.taste.common.util;

import com.tang.taste.common.captcha.Captcha;
import com.tang.taste.common.captcha.GifCaptcha;
import com.tang.taste.common.captcha.SpecCaptcha;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * FileName: VerifyCodeUtils
 * @Author:   16
 * Date:     2018/3/20 16:51
 * Description:验证码工具内：jpg、gif
 */
public class VerifyCodeUtils {

    /**
     * 获取验证码（Gif版本）
     * @param response
     */
    public static void getGifCode(HttpServletResponse response, HttpServletRequest request){
        try {
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/gif");
            /**
             * gif格式动画验证码
             * 宽，高，位数。
             */
            Captcha captcha = new GifCaptcha(130,33,4);
            //输出
            captcha.out(response.getOutputStream());
            HttpSession session = request.getSession(true);
            //存入Session
            session.setAttribute("_code",captcha.text().toLowerCase());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取验证码（jpg版本）
     * @param response
     */
    public static void getJPGCode(HttpServletResponse response,HttpServletRequest request){
        try {
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/jpg");
            /**
             * jgp格式验证码
             * 宽，高，位数。
             */
            Captcha captcha = new SpecCaptcha(130,33,4);
            //输出
            captcha.out(response.getOutputStream());
            HttpSession session = request.getSession(true);
            //存入Session
            session.setAttribute("_code",captcha.text().toLowerCase());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
