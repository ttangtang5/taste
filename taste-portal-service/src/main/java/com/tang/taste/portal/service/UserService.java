package com.tang.taste.portal.service;

import com.google.common.collect.Lists;
import com.tang.taste.common.entity.pojo.*;
import com.tang.taste.common.util.*;
import com.tang.taste.portal.dao.UserAddressDao;
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
    @Autowired
    private UserAddressDao userAddressDao;
    @Autowired
    private ShoppingCartService shoppingCartService;

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
        if(list != null && list.size() == 1){
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
                SessionUtils.setAttr(request,"id",list.get(0).getId());
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

                //将数据库购物车的数加入cookie
                //User userCart = SessionUtils.getUser(request);
                User userCart = list.get(0);
                ShoppingCart shoppingCart = shoppingCartService.getShoppingCartByUserId(userCart.getId());
                //是不是新用户
                if(shoppingCart != null && shoppingCart.getCartId() != null){
                    List<ShoppingCartDetail> lists = shoppingCartService.getShoppingCartDetailByCartId(shoppingCart.getCartId());
                    shoppingCartService.deleteShoppingDetail(shoppingCart.getCartId());
                    Cookie[] cookies = request.getCookies();
                    for (int i = 0; i < cookies.length; i++){
                        String[] c = cookies[i].getValue().split(":");
                        if(c.length > 1 && c[1] != null){
                            for (ShoppingCartDetail s : lists) {
                                String str = null;
                                if(cookies[i].getName().equals(s.getDishesId())){
                                    int goodsNum = Integer.valueOf(c[0]) + s.getNum();
                                    str = String.valueOf(goodsNum) + ":" + c[1];
                                    CookieUtils.setCookie(request,response,cookies[i].getName(),str);
                                }else{
                                    str = s.getNum().toString() + ":" + s.getDishesPrice();
                                    CookieUtils.setCookie(request,response,s.getDishesId().toString(),str);
                                }
                            }
                        }
                    }
                    List<ShoppingCartDetail> details = Lists.newArrayList();
                    for (int i = 0; i < cookies.length; i++){
                        String[] c = cookies[i].getValue().split(":");
                        if(c.length > 1 && c[1] != null){
                            ShoppingCartDetail shoppingCartDetail = new ShoppingCartDetail();
                            shoppingCartDetail.setCartId(shoppingCart.getCartId());
                            shoppingCartDetail.setDishesId(Integer.valueOf(cookies[i].getName()));
                            shoppingCartDetail.setNum(Integer.valueOf(c[0]));
                            shoppingCartDetail.setStatus(0);
                            details.add(shoppingCartDetail);
                        }
                    }
                    if(details != null && details.size() > 0){
                        shoppingCartService.addShoppingDetailList(details);
                    }
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

    /**
     * 查询用户地址列表
     * @param userId
     * @return
     */
    public List<UserAddress> selectUserAddressByUserId(int userId){
        UserAddressExample userAddressExample = new UserAddressExample();
        userAddressExample.createCriteria().andUserIdEqualTo(userId);
        userAddressExample.createCriteria().andDelFlagEqualTo(0);
        List<UserAddress> list = userAddressDao.selectByExample(userAddressExample);
        return list;
    }

    /**
     * 添加收货地址
     * @param userAddress
     * @return
     */
    public int addAddress(UserAddress userAddress){
        return userAddressDao.insertSelective(userAddress);
    }

    /**
     * 更新收货地址
     * @param userAddress
     * @return
     */
    public int updateAddress(UserAddress userAddress){
        return userAddressDao.updateByPrimaryKeySelective(userAddress);
    }

    /**
     * 删除收货地址
     * @param id
     * @return
     */
    public int deleteAddress(int id){
        return userAddressDao.deleteByPrimaryKey(id);
    }

    /**
     * 获取地址信息
     * @param id
     * @return
     */
    public UserAddress getAddressById(int id){
        return userAddressDao.selectByPrimaryKey(id);
    }
}
