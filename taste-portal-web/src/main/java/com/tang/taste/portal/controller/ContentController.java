package com.tang.taste.portal.controller;

import com.alibaba.fastjson.JSON;
import com.tang.taste.common.entity.pojo.Content;
import com.tang.taste.portal.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * FileName: ContentController
 * @Author:   16
 * Date:     2018/3/26 16:52
 * Description:页面内容显示
 */
@Controller
@RequestMapping("/content")
public class ContentController {

    @Value("${INDEX_SLIDESSHOW}")
    private String slidexShow;
    @Value("${INDEX_NEWPRODUCT}")
    private String newProduct;
    @Value("${INDEX_RECOMMEND}")
    private String Recommend;

    @Autowired
    private ContentService contentService;

    /**
     * 首页大轮播图内容
     * @return
     * @throws Exception
     */
    @RequestMapping("/IndexsLideshow")
    @ResponseBody
    public String getIndeSlideshow() throws Exception{
        List<Content> list = contentService.getIndexContent(slidexShow,1);
        return JSON.toJSONString(list);
    }

    /**
     * 获取新品内容
     * @return
     * @throws Exception
     */
    @RequestMapping("/NewProduct")
    @ResponseBody
    public String getNewProduct() throws Exception{
        List<Content> list = contentService.getIndexContent(newProduct,2);
        return JSON.toJSONString(list);
    }

    /**
     * 获取推荐内容
     * @return
     * @throws Exception
     */
    @RequestMapping("/Recommend")
    @ResponseBody
    public String getRecommend() throws Exception{
        List<Content> list = contentService.getIndexContent(Recommend,3);
        return JSON.toJSONString(list);
    }


}
