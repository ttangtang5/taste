package com.tang.taste.manage.controller;

import com.alibaba.fastjson.JSON;
import com.tang.taste.common.entity.pojo.Content;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.manage.service.ContentService;
import com.tang.taste.manage.service.DishesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * FileName: ContentController
 * @Author:   16
 * Date:     2018/5/2 13:34
 * Description:内容管理
 */
@Controller
@RequestMapping("content")
public class ContentController {

    @Autowired
    private ContentService contentService;
    @Autowired
    private DishesService dishesService;

    /**
     * 获取菜品
     * @return
     * @throws Exception
     */
    @RequestMapping("getDishes")
    @ResponseBody
    public String selectDishes() throws Exception{
        List<Dishes> lists = dishesService.selectAllDishes();
        return JSON.toJSONString(lists);
    }

    /**
     * 修改首页内容
     * @param id
     * @param dishesId
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("saveContent")
    @ResponseBody
    public String saveContent(Integer id, Integer dishesId, HttpServletRequest request) throws Exception{
        String url = (String) SessionUtils.getAttr(request, "url");
        Dishes dishes = dishesService.selectDishesById(dishesId);
        Content content = new  Content();
        if(dishes == null){
            content.setPicture(url);
            content.setContent("0");
        }else{
            if(url == null || url == ""){
                content.setPicture(dishes.getPicture());
            }else{
                content.setPicture(url);
            }
            content.setContent(String.valueOf(dishes.getId()));
        }
        content.setId(id);
        return contentService.updateContent(content);
    }
}
