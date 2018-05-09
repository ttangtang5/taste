package com.tang.taste.manage.controller;

import com.alibaba.fastjson.JSON;
import com.tang.taste.common.entity.pojo.Employee;
import com.tang.taste.common.entity.pojo.Menu;
import com.tang.taste.common.entity.pojo.Role;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.manage.service.EmpService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * FileName: UserController
 * @Author:   16
 * Date:     2018/4/21 16:18
 * Description:用户控制层
 */
@RequestMapping("/")
@Controller
public class UserController {
    @Autowired
    private EmpService empService;

    @RequestMapping("login")
    public String login(String username, String password, HttpServletRequest request) throws Exception{
        //获取Subject --SecurityUtils.getSubject()
        Subject subject= SecurityUtils.getSubject();
        //将信息封装进usernamepasswordToken
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        //是否记住token.setRememberMe(true);
        try {
            //调用subject.login();
            subject.login(token);
            SecurityUtils.getSubject().isPermitted();
            List<Employee> employees = empService.selectUserByUsername(username);
            SessionUtils.setAttr(request,"empName",employees.get(0).getEmpName());
        } catch (AuthenticationException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/manage/toIndex";
    }

    /**
     * 添加员工
     * @param employee
     * @return
     * @throws Exception
     */
    @RequestMapping("addEmp")
    @ResponseBody
    public String addEmp(Employee employee) throws Exception{
       return empService.addEmp(employee);
    }

    /**
     * 删除多个用户
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("delEmp")
    @ResponseBody
    public String delEmp(String ids) throws Exception{
        return empService.delEmp(ids);
    }

    /**
     * 添加角色
     * @param role
     * @return
     * @throws Exception
     */
    @RequestMapping("addRole")
    @ResponseBody
    public String addRole(Role role) throws  Exception{
        return empService.addRole(role);
    }

    /**
     * 删除角色
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("delRole")
    @ResponseBody
    public String addRole(String ids) throws  Exception{
        return empService.delRole(ids);
    }

    /**
     * 选择角色
     * @param empId
     * @return
     * @throws Exception
     */
    @RequestMapping("selectRoleByUserId")
    @ResponseBody
    public String selectRoleByUserId(Integer empId) throws Exception{
         List<Role> roleList = empService.selectRoleByUserId(empId);
        return JSON.toJSONString(roleList);
    }

    /**
     * 更新用户角色
     * @param ids
     * @param empId
     * @return
     * @throws Exception
     */
    @RequestMapping("updateRole")
    @ResponseBody
    public String updateRole(String ids,Integer empId) throws Exception{
        return empService.updateRole(ids,empId);
    }

    /**
     * 删除用户角色关系
     * @param empIds
     * @return
     * @throws Exception
     */
    @RequestMapping("delEmpRole")
    @ResponseBody
    public String delEmpRole(String empIds) throws Exception{
        return empService.delEmpRole(empIds);
    }

    /**
     * 添加菜单
     * @return
     * @throws Exception
     */
    @RequestMapping("addPermission")
    @ResponseBody
    public String addPermission(Menu menu) throws Exception{
        return empService.addMenu(menu);
    }

    /**
     * 删除权限
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("delPermission")
    @ResponseBody
    public String delPermission(String ids) throws Exception{
        return empService.delMenu(ids);
    }

    /**
     * 角色展示拥有的权限
     * @return
     * @throws Exception
     */
    @RequestMapping("showPermission")
    @ResponseBody
    public String showPermissionList(Integer roleId) throws Exception{
       List<Menu> list =  empService.selectPermission(roleId);
       return JSON.toJSONString(list);
    }

    /**
     * 更新角色权限
     * @param roleId
     * @param ids  新的权限字符串
     * @return
     * @throws Exception
     */
    @RequestMapping("updatePermissionByRole")
    @ResponseBody
    public String updatePermissionByRole(Integer roleId,String ids) throws Exception{
        return empService.updatePermission(roleId, ids);
    }

    /**
     * 获取配送员
     * @return
     * @throws Exception
     */
    @RequestMapping("distribution")
    @ResponseBody
    public String distribution() throws Exception{
        List<Employee> lists = empService.selectDistribution();
        return JSON.toJSONString(lists);
    }
}
