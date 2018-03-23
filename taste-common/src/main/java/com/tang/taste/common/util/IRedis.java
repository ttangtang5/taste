package com.tang.taste.common.util;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * FileName: IRedis
 * Author:   16
 * Date:     2018/2/4 13:57
 * Description: redis接口 主用实现项目中常用的redis操作
 */
public interface IRedis {

    public String getValue(String key);

    public void  setKeyValue(String key, String value);

    public void  setexKeyValue(String key, int time,String value);

    public void hSetValue(String mKey, String sKey, String value);

    public String hGetValue(String mKey, String sKey);

    public Map hGetAll(String mKey);

    public Set<String> hGetKeys(String mKey);

    public List<String> hGetVals(String mKey);

    public void hMSet(String mKey, Map map);

    public List<String> hMGet(String mKey, String... sKey);

    public void hdel(String mKey, String... sKey);
}
