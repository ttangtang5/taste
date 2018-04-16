package com.tang.taste.portal.service;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.tang.taste.common.entity.pojo.Content;
import com.tang.taste.common.entity.pojo.ContentExample;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.util.ClusterRedis;
import com.tang.taste.portal.dao.ContentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName: ContentService
 * @Author:   16
 * Date:     2018/3/26 17:28
 * Description:页面内容业务逻辑
 */
@Service
public class ContentService {

    @Autowired
    private ContentDao contentDao;
    @Autowired
    private ClusterRedis clusterRedis;

    /**
     * 获取首页的图片
     * @param contentKey redis键名
     * @param categoryId 分类id
     * @return
     */
    public List<Content> getIndexContent(String contentKey,int categoryId){
        List<Content> lists = Lists.newArrayList();
        String urls = null;
        try {
            //urls = clusterRedis.getValue(contentKey);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(urls == null || urls == ""){
            //redis未命中 数据库查找 存入redis
            lists = contentDao.selectContentByCategory(String.valueOf(categoryId));
            //clusterRedis.setexKeyValue(contentKey,60*60*24, JSON.toJSONString(lists));
        }else{
            lists = JSON.parseArray(urls, Content.class);
        }
        return lists;
    }

}
