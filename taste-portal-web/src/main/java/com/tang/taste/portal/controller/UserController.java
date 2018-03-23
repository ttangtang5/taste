package com.tang.taste.portal.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.util.RandomNumberUtils;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.common.util.SmsUtils;
import com.tang.taste.common.util.VerifyCodeUtils;
import com.tang.taste.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Map;
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
     * 用户注册
     * @param regPhoneNum 手机号码
     * @param regPassword 密码
     * @param captcha  验证码
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("register")
    @ResponseBody
    public String registerUser(String regPhoneNum,String regPassword,String captcha,HttpServletRequest request) throws Exception{
        String captchaServer = SessionUtils.getValidateCode(request);
        if(captcha == null || captcha == "" || !captcha.equals(captchaServer)){
            return "1";
        }
        User user = new User();
        user.setUserName(regPhoneNum);
        user.setPhone(regPhoneNum);
        user.setPassword(regPassword);
        return userService.addUser(user);
    }

    /**
     * 登录
     * @param logPhoneNum 手机号码
     * @param logPassword 密码
     * @param gifCaptcha  验证码
     * @param remember   是否自动登录 1为自动登录
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("login")
    @ResponseBody
    public String loginUser(String logPhoneNum,String logPassword,String gifCaptcha,String remember,HttpServletRequest request,HttpServletResponse response) throws Exception{
        System.out.println(SessionUtils.getAttr(request, "_code"));
        String code = (String) SessionUtils.getAttr(request, "_code");
        if(code != null && code != "" && code.equals(gifCaptcha)){
            User user = new User();
            user.setPhone(logPhoneNum);
            user.setPassword(logPassword);
            user.setFailureTimes(Calendar.getInstance().getTime());
            return userService.login(user,remember,request,response);
        }
        return "1";
    }

    /**
     * 页头获取用户信息
     * @return
     * @throws Exception
     */
    @RequestMapping("getLoginMsg")
    @ResponseBody
    public String getLoginMsg() throws Exception{
        return "";
    }

    /**
     * 获取登录验证码   将验证码传至前端
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("getGIFCodeServer")
    @ResponseBody
    public String getGIFCodeServer(HttpServletRequest request) throws Exception{
        Map map = Maps.newHashMap();
        map.put("serverCode",(String) SessionUtils.getAttr(request,"_code"));
        return JSON.toJSONString(map);
    }

    /**
     * 获取GIF形式的验证码
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("getGIFCode")
    @ResponseBody
    public void getGIFCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        VerifyCodeUtils.getGifCode(response,request);
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
        HttpSession session = request.getSession(true);
        try {
            boolean flag = SmsUtils.sendCaptcha(phoneNum,String.valueOf(numCode));
            //TimerTask实现5分钟后从session中删除checkCode
            final Timer timer=new Timer();
            timer.schedule(new TimerTask() {
                @Override
                public void run() {
                    session.removeAttribute(SessionUtils.getSessionValidatecode());
                    System.out.println("captcha删除成功");
                    timer.cancel();
                }
            },5*60*1000);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return String.valueOf(numCode);
    }

}
