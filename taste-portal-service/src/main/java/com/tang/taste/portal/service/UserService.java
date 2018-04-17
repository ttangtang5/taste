package com.tang.taste.portal.service;

import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.entity.pojo.UserExample;
import com.tang.taste.common.util.*;
import com.tang.taste.portal.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;

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
    @Autowired
    private ClusterRedis clusterRedis;


    /**
     * 添加用户
     * @param user
     * @return
     */
    public String addUser(User user) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        //判断手机是否已经绑定
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneEqualTo(user.getPhone());
        List<User> lists = userDao.selectByExample(userExample);
        if(lists != null && lists.size() > 0){
            return "2";
        }
        byte[] salt = MD5Utils.getSalt();
        String MD5Pwd = MD5Utils.getEncryptedPwd(user.getPassword(), salt);
        user.setPassword(MD5Pwd);
        user.setSalt(Base64.getEncoder().encodeToString(salt));
        int num = userDao.insertSelective(user);
        if(num == 1){
            return "200";
        }
            return "1";
    }

    /**
     * 用户登录方法
     * @param user
     * @return
     */
    public String login(User user, String remember, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneEqualTo(user.getPhone());
        userExample.createCriteria().andStatusEqualTo(1);
        List<User> list = userDao.selectByExample(userExample);
        String salt = null;
        String dbPwd = null;
        if(list !=null && list.size()==1){
            salt = list.get(0).getSalt();
            dbPwd = list.get(0).getPassword();
            //校验输入的密码加密后是否匹配数据库密码
            if(dbPwd != null && dbPwd.equals(MD5Utils.getEncryptedPwd(user.getPassword(),Base64.getDecoder().decode(salt)))){
                //登录成功更新失败时间
                //将信息放入redis缓存
                String value = Base64.getEncoder().encodeToString(SerializeUtils.serialize(list.get(0)));
                String id = "user:"+list.get(0).getId();
                //clusterRedis.setexKeyValue(id,60*60,value);
                //将用户id存放至session
                request.getSession(true).setAttribute("id",String.valueOf(list.get(0).getId()));
                SessionUtils.setUser(request,list.get(0));
                //自动登录
                if("1".equals(remember)){
                    StringBuilder str = new StringBuilder();
                    str.append(list.get(0).getId()+",");
                    str.append(list.get(0).getPhone()+",");
                    str.append(list.get(0).getPassword());
                    CookieUtils.setCookie(request,response,"id",str.toString(),60*60*24*7);
                    /*cookie.setPath(request.getContextPath()+"/");*/
                }
                return "200";
            }else{
                //失败
            }
        }
        return "2";
    }

    /**
     * 通过编号获取用户信息
     * @param id
     * @return
     */
    public User getUserById(String id){
        return userDao.selectByPrimaryKey(Integer.valueOf(id));
    }

    /**
     * 更新用户密码
     * @param phone 手机号码
     * @param newPwd 新密码
     * @return
     */
    public String updateUserPwdByphone(String phone,String newPwd) throws Exception {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneEqualTo(phone);
        List<User> lists = userDao.selectByExample(userExample);
        //判断是否存在
        if(lists == null || lists.size() !=1 ){
            return "1";
        }
        User user = new User();
        String md5Pwd = MD5Utils.getEncryptedPwd(newPwd, Base64.getDecoder().decode(lists.get(0).getSalt()));
        user.setPassword(md5Pwd);
        int num = userDao.updateByExampleSelective(user,userExample);
        if(num == 1){
            return "200";
        }
        return "1";
    }

    /**
     * 更新用户信息
     * @param username 用户名
     * @param firstname 真实姓名
     * @param phone 手机号码
     * @return
     * @throws Exception
     */
    public String updateUserMsgById(String username,String firstname,String phone,HttpServletRequest request){
        Integer id =Integer.valueOf((String) SessionUtils.getAttr(request, "id"));
        User user = new User();
        UserExample userExample = new UserExample();
        //判断手机号是否已绑定
        userExample.createCriteria().andPhoneEqualTo(phone);
        List<User> users = userDao.selectByExample(userExample);
        if(users == null && users.size()>0){
            return "1";
        }
        userExample.createCriteria().andIdEqualTo(id);
        user.setUserName(username);
        user.setPhone(phone);
        user.setRealName(firstname);
        int num = userDao.updateByExampleSelective(user, userExample);
        if(num == 1){
            request.setAttribute("user",user);
            return "200";
        }
        return "1";
    }
}
