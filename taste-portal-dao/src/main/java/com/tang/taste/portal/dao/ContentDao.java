package com.tang.taste.portal.dao;

import com.tang.taste.common.dao.ContentMapper;
import com.tang.taste.common.entity.pojo.Content;
import com.tang.taste.common.entity.pojo.Dishes;

import java.util.List;

/**
 * FileName: ContentDao
 * @Author:   16
 * Date:     2018/3/26 17:29
 * Description:内容数据接口
 */
public interface ContentDao extends ContentMapper{

    /**
     * 查询内容列表并将关联内容查询出来
     * @param category
     * @return
     */
    public List<Content> selectContentByCategory(String category);

    /**
     * 查找关联商品信息
     * @param content
     * @return
     */
    public List<Dishes> selectDishesByContent(String[] content);
}
