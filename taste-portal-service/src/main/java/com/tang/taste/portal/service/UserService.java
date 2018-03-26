package com.tang.taste.portal.service;

import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.entity.pojo.UserExample;
import com.tang.taste.common.util.ClusterRedis;
import com.tang.taste.common.util.CookieUtils;
import com.tang.taste.common.util.MD5Utils;
import com.tang.taste.common.util.SerializeUtils;
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
                clusterRedis.setexKeyValue(id,60*60,value);
                //将用户id存放至session
                request.getSession(true).setAttribute("id",String.valueOf(list.get(0).getId()));
                //自动登录
                if("1".equals(remember)){
                    CookieUtils.setCookie(request,response,"id",String.valueOf(list.get(0).getId()),60*60*24*7);
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
}
