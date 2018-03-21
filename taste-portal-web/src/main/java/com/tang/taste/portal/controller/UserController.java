package com.tang.taste.portal.controller;

import com.tang.taste.common.util.RandomNumberUtils;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.common.util.SmsUtils;
import com.tang.taste.common.util.VerifyCodeUtils;
import com.tang.taste.portal.service.UserService;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Timer;
import java.util.TimerTask;

/**
 * FileName: UserController
 * @Author:   16
 * Date:     2018/3/19 16:18
 * Description:用户客户控制层
 */
@Controller
@RequestMapping("/taste")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 跳转登录
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("toLogin")
    public String toLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        return "login/login";
    }

    /**
     * 获取注册验证码
     * @param phoneNum
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("getCaptcha/{phoneNum}")
    @ResponseBody
    public String getCaptcha(@PathVariable("phoneNum") String phoneNum,HttpServletRequest request) throws Exception{
        //获取随机数
        int numCode = RandomNumberUtils.getRandomCode(6);
        SessionUtils.setValidateCode(request,String.valueOf(numCode));
        try {
            //boolean flag = SmsUtils.sendCaptcha(phoneNum,String.valueOf(numCode));
            //TimerTask实现5分钟后从session中删除checkCode
            final Timer timer=new Timer();
            timer.schedule(new TimerTask() {
                @Override
                public void run() {
                    SessionUtils.removeValidateCode(request);
                    System.out.println("captcha删除成功");
                    timer.cancel();
                }
            },5*60*1000);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "captcha";
    }

    /**
     * 获取jpg形式的验证码
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("getJPGCode")
    public void getJPGCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        VerifyCodeUtils.getJPGCode(response,request);
    }

    /**
     * 获取GIF形式的验证码
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("getGIFCode")
    public void getGIFCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        VerifyCodeUtils.getGifCode(response,request);
    }

    @RequestMapping("register")
    @ResponseBody
    public String registerUser(String regPhoneNum,String regPassword,String captcha) throws Exception{
        return "s";
    }



}
