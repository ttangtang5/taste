package com.tang.taste.manage.service;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.entity.pojo.Content;
import com.tang.taste.portal.dao.ContentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * FileName: ContentService
 * @Author:   16
 * Date:     2018/5/2 12:35
 * Description:内容管理
 */
@Service
public class ContentService {

    @Autowired
    private ContentDao contentMapper;

    /**
     * 首页管理列表
     * @return
     */
    public List<Content> selectContent(){
        List<Content> lists = contentMapper.selectContent();
        List<Content> newList = Lists.newArrayList();
        for (Content content : lists) {
            switch (content.getCategoryId()){
                case 1:
                    content.setCategoryStr("首页宣传广告");
                    break;
                case 2:
                    content.setCategoryStr("首页新品广告");
                    break;
                case 3:
                    content.setCategoryStr("首页推荐广告");
                    break;
                default:
                    break;
            }
            newList.add(content);
        }
        return newList;
    }

    /**
     * 更新内容
     * @param content
     * @return
     */
    public String updateContent(Content content){
        Map map = Maps.newHashMap();
        int i = contentMapper.updateByPrimaryKeySelective(content);
        if(i == 1){
            map.put("status", "200");
            map.put("message", "修改成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "500");
        map.put("message", "修改失败！");
        return JSON.toJSONString(map);
    }
}
