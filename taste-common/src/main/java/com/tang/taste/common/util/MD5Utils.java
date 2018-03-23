package com.tang.taste.common.util;

import sun.reflect.generics.tree.BaseType;

import java.security.NoSuchAlgorithmException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Base64;

/**
 * FileName: MD5Utils
 * @Author:   16
 * Date:     2018/3/21 15:16
 * Description:
 * 这是一个非常好用的使用MD5+salt加密的工具类。使用这个工具类，非常简单，
 * 从前台拿到密码passwd，直接HexUtil.getEncryptedPwd(passwd)就可以返回一个长度为56的字符串，
 * 可以用来保存到数据库中，相反，登录的时候，因为MD5加密是不可逆的运算，只能拿用户输入的密码走一遍MD5+salt加密之后，
 * 跟数据库中的passwd比较，看是否一致，一致时密码相同，登录成功，通过调用HexUtil.validPasswd(String passwd,String dbPasswd)方法，
 * 就可以了，不用再做其他事。
 */
public class MD5Utils {

    private final static String HEX_NUMS_STR = "0123456789ABCDEF";
    private final static Integer SALT_LENGTH = 12;


    /**
     * 将数组转换成16进制字符串
     *
     * @return String
     *
     * */
    public static String byteToHexString(byte[] salt){
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < salt.length; i++) {
            String hex = Integer.toHexString(salt[i] & 0xFF);
            if(hex.length() == 1){
                hex = '0' + hex;
            }
            hexString.append(hex.toUpperCase());
        }
        return hexString.toString();
    }


    /**
     * 获得md5之后的16进制字符
     * @param passwd 用户输入密码字符
     * @return String md5加密后密码字符
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     */
    public static String getEncryptedPwd(String passwd,byte[] salt)
            throws NoSuchAlgorithmException, UnsupportedEncodingException{
        byte[] pwd = null;

        //声明摘要对象，并生成
        MessageDigest md = MessageDigest.getInstance("MD5");
        //计算MD5函数
        md.update(salt);
        //passwd.getBytes("UTF-8")将输入密码变成byte数组，即将某个数装换成一个16进制数
        md.update(passwd.getBytes("UTF-8"));
        //计算后获得字节数组,这就是那128位了即16个元素
        byte[] digest = md.digest();
        pwd = new byte[salt.length + digest.length];
        System.arraycopy(salt, 0, pwd, 0, SALT_LENGTH);
        System.arraycopy(digest, 0, pwd, SALT_LENGTH, digest.length);
        return byteToHexString(pwd);
    }

    /**
     * 随机产生12位的盐
     * @return
     */
    public static byte[] getSalt(){
        //随机产生12位的盐
        SecureRandom sc= new SecureRandom();
        byte[] salt = new byte[SALT_LENGTH];
        sc.nextBytes(salt);
        //byte[]转string
        return salt;
    }


    public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        byte[] btye = getSalt();
        System.out.println(Base64.getEncoder().encodeToString(btye));
        System.out.println(getEncryptedPwd("zhangsan",btye));
        byte[] btyes = Base64.getDecoder().decode("6tv/2oQA43X7EEiD");
        System.out.println(getEncryptedPwd("zhangsan",btye));

    }
}
