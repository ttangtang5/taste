package com.tang.taste.common.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.JedisCluster;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * FileName: ClusterRedis
 * @Author:   16
 * @Date:     2018/2/4 15:04
 * Description：redis集群的实现类@Component("clusterRedis")
 */

public class ClusterRedis implements IRedis{

    @Autowired
    private JedisCluster jedisCluster;

    @Override
    public String getValue(String key) {
        return jedisCluster.get(key);
    }

    @Override
    public void setKeyValue(String key, String value) {
        jedisCluster.set(key, value);
    }

    @Override
    public void setexKeyValue(String key, int time, String value) {
        jedisCluster.setex(key,time,value);
    }

    @Override
    public void hSetValue(String mKey, String sKey, String value) {
        jedisCluster.hset(mKey, sKey, value);
    }

    @Override
    public String hGetValue(String mKey, String sKey) {
        return jedisCluster.hget(mKey, sKey);
    }

    @Override
    public Map hGetAll(String mKey) {
        return jedisCluster.hgetAll(mKey);
    }

    @Override
    public Set<String> hGetKeys(String mKey) {
        return jedisCluster.hkeys(mKey);
    }

    @Override
    public List<String> hGetVals(String mKey) {
        return jedisCluster.hvals(mKey);
    }

    @Override
    public void hMSet(String mKey, Map map) {
        jedisCluster.hmset(mKey, map);
    }

    @Override
    public List<String> hMGet(String mKey, String... sKey) {
        return jedisCluster.hmget(mKey, sKey);
    }

    @Override
    public void hdel(String mKey, String... sKey) {
        jedisCluster.hdel(mKey, sKey);
    }

    public String ping(){
        return jedisCluster.ping();
    }
}
