package com.tang.taste.manage.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.util.FastdfsUitls;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.manage.service.DishesService;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * FileName: DishesController
 * @Author:   16
 * Date:     2018/4/22 16:18
 * Description:菜品控制层
 */
@Controller
@RequestMapping("dishes")
public class DishesController {

    @Autowired
    private DishesService dishesService;

    @RequestMapping("/getDishesByCategory")
    @ResponseBody
    public String getDishesByCategory(int categoryId) throws  Exception{
        List<Dishes> lists = dishesService.selectDishes(categoryId);
        List<Map> list = Lists.newArrayList();
        for (Dishes dishes : lists){
            Map map = Maps.newHashMap();
            map.put("id", dishes.getId());
            map.put("name", dishes.getDishesName());
            map.put("desc", dishes.getDishesName()+"---"+dishes.getDishesPrice());
            list.add(map);
        }
        return JSON.toJSONString(list);
    }

    /**
     * 添加菜品
     * @param dishes
     * @return
     * @throws Exception
     */
    @RequestMapping("addDishes")
    @ResponseBody
    public String addDishes(Dishes dishes,HttpServletRequest request) throws Exception{
        String url = (String) SessionUtils.getAttr(request, "url");
        SessionUtils.removeAttr(request,"url");
        dishes.setPicture(url);
        return dishesService.addDishes(dishes);
    }

    /**
     * 上传菜名图片
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("uploadFile")
    @ResponseBody
    public String upload(HttpServletRequest request) throws Exception{
        ShiroHttpServletRequest shiroRequest = (ShiroHttpServletRequest) request;
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        MultipartHttpServletRequest multipartRequest = commonsMultipartResolver.resolveMultipart((HttpServletRequest) shiroRequest.getRequest());
        MultiValueMap<String,MultipartFile> multipartFile = multipartRequest.getMultiFileMap();
        MultipartFile multi = multipartFile.getFirst("file");
        String fileName = multi.getOriginalFilename();
        String fileExtName = fileName.split("\\.")[1];
        if("jpg,png,jpeg".contains(fileExtName)){
            String [] fileMsg = FastdfsUitls.uploadFile(multi.getBytes(),fileExtName);
            String url = "http://119.23.252.58/"+fileMsg[0]+"/"+fileMsg[1];
            SessionUtils.setAttr(request,"url",url);
            return "200";
        }
        return "500";
    }

    /**
     * 删除菜品
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("delDishes")
    @ResponseBody
    public String delDishes(String ids) throws Exception{
        return dishesService.delDishes(ids);
    }
}
