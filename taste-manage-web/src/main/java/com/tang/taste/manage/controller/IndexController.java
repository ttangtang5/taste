package com.tang.taste.manage.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.tang.taste.common.entity.pojo.*;
import com.tang.taste.manage.service.DishesService;
import com.tang.taste.manage.service.EmpService;
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
    @Autowired
    private EmpService empService;
    @Autowired
    private DishesService dishesService;
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
    public String toOrderDishes(int tableId,HttpServletRequest request) throws Exception{
        request.setAttribute("tableId",tableId);
        return "manage/orderDishes";
    }

    /**
     * 前往外面接单
     * @return
     * @throws Exception
     */
    @RequestMapping("toOrderCheck")
    public String toOrderCheck() throws  Exception{
        return "manage/orderCheck";
    }

    /**
     * 前往用户管理
     * @param findContent
     * @return
     * @throws Exception
     */
    @RequestMapping("toUserMange")
    public String toUserManage(String findContent,HttpServletRequest request) throws Exception{
        List<Employee> lists =  empService.selectEmployee(findContent);
        request.setAttribute("employeeList",lists);
        return "manage/userList";
    }

    /**
     * 角色列表
     * @param findContent
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("toRoleList")
    public String toRoleList(String findContent,HttpServletRequest request) throws Exception{
        List<Role> lists =  empService.selectRoleList(findContent);
        request.setAttribute("RoleList",lists);
        return "manage/userRoleList";
    }

    /**
     * 前往用户角色分配
     * @param findContent
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("toAllocationRole")
    public String toAllocationRole(String findContent,HttpServletRequest request) throws Exception{
        List<Employee> lists =  empService.getEmpAllRole(findContent);
        request.setAttribute("employeeList",lists);
        return "manage/allocationRole";
    }

    /**
     * 前往权限列表
     * @param findContent
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("toMenuList")
    public String toMenuList(String findContent,HttpServletRequest request) throws Exception{
        List<Menu> menus = empService.selectMenu(findContent);
        request.setAttribute("menuList",menus);
        return "manage/menuList";
    }

    /**
     * 前往权限分配
     * @param findContent
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("toAllocationMenu")
    public String toAllocationMenu(String findContent,HttpServletRequest request) throws Exception{
        List<Role> lists = empService.getRolePermission(findContent);
        request.setAttribute("lists",lists);
        return "manage/allocationMenu";
    }

    /**
     * 去菜品列表
     * @param findContent
     * @param categoryId
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("toDishesManage")
    public String toDishesManage(String findContent,Integer categoryId,HttpServletRequest request) throws Exception{
        List<Dishes> lists = dishesService.selectDishesMange(findContent,1);
        request.setAttribute("dishesList",lists);
        return "manage/dishesList";
    }

    /**
     * 前往桌子列表
     * @param findContent
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("toTableManage")
    public String toTableManage(String findContent,HttpServletRequest request) throws Exception{
        List<Tables> lists = tableService.selectTable(findContent);
        request.setAttribute("tablesList",lists);
        return "manage/tableList";
    }

    /**
     * 前往预订处理
     * @return
     * @throws Exception
     */
    @RequestMapping("toBooking")
    public String toBooking() throws Exception{
        return "manage/bookingOrder";
    }

}
