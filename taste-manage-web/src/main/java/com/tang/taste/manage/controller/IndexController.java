package com.tang.taste.manage.controller;

import com.tang.taste.common.entity.pojo.Tables;
import com.tang.taste.manage.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * FileName: IndexController
 * @Author:   16
 * Date:     2018/4/21 15:58
 * Description:跳转控制层
 */
@RequestMapping("manage")
@Controller
public class IndexController {

    @Autowired
    private TableService tableService;
    /**
     * 跳转首页
     * @return
     * @throws Exception
     */
    @RequestMapping("/toIndex")
    public String toIndex(HttpServletRequest request) throws Exception{
        //初始化餐桌信息
        List<Tables> lists = tableService.selectTableBystatus();
        request.setAttribute("tables",lists);
        return "manage/index";
    }

    /**
     * 跳转登录
     * @return
     * @throws Exception
     */
    @RequestMapping("/toLogin")
    public String toLogin() throws Exception{
        return "login/login";
    }

    /**
     * 点餐
     * @return
     * @throws Exception
     */
    @RequestMapping("orderDishes")
    public String toOrderDishes() throws Exception{
        return "manage/orderDishes";
    }

}
