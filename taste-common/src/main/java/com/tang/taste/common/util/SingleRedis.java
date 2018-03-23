package com.tang.taste.common.util;

import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * FileName: SingleRedis
 * @Author:   16
 * @Date:     2018/2/4 14:34
 * Description:单机版Redis,用连接池实现
 */
public class SingleRedis implements IRedis{

    @Autowired
    private JedisPool jedisPool;

    @Override
    public String getValue(String key) {
        Jedis jedis = jedisPool.getResource();
        String value = jedis.get(key);
        jedis.close();
        return value;
    }

    @Override
    public void setKeyValue(String key, String value) {
        Jedis jedis = jedisPool.getResource();
        jedis.set(key,value);
        jedis.close();
    }

    @Override
    public void setexKeyValue(String key, int time, String value) {
        Jedis jedis = jedisPool.getResource();
        jedis.setex(key,time,value);
        jedis.close();
    }

    @Override
    public void hSetValue(String mKey, String sKey, String value) {
        Jedis jedis = jedisPool.getResource();
        jedis.hset(mKey,sKey,value);
        jedis.close();
    }
    @Override
    public String hGetValue(String mKey, String sKey) {
        Jedis jedis = jedisPool.getResource();
        String value = jedis.hget(mKey, sKey);
        jedis.close();
        return value;
    }
    @Override
    public Map hGetAll(String mKey) {
        Jedis jedis = jedisPool.getResource();
        Map maps = jedis.hgetAll(mKey);
        jedis.close();
        return maps;
    }
    @Override
    public Set<String> hGetKeys(String mKey) {
        Jedis jedis = jedisPool.getResource();
        Set<String> vals =  jedis.hkeys(mKey);
        jedis.close();
        return  vals;
    }
    @Override
    public List<String> hGetVals(String mKey) {
        Jedis jedis = jedisPool.getResource();
        List<String> list = jedis.hvals(mKey);
        jedis.close();
        return list;
    }
    @Override
    public void hMSet(String mKey, Map map) {
        Jedis jedis = jedisPool.getResource();
        jedis.hmset(mKey, map);
        jedis.close();
    }

    @Override
    public List<String> hMGet(String mKey, String...sKey) {
        Jedis jedis = jedisPool.getResource();
        List<String> list = jedis.hmget(mKey, sKey);
        jedis.close();
        return list;
    }
    @Override
    public void hdel(String mKey, String...sKey) {
        Jedis jedis = jedisPool.getResource();
        jedis.hdel(mKey, sKey);
        jedis.close();
    }
}
