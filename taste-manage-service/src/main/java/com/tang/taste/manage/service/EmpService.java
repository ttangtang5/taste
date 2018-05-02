package com.tang.taste.manage.service;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.entity.pojo.*;
import com.tang.taste.common.util.DateUtil;
import com.tang.taste.manage.dao.EmpDao;
import com.tang.taste.manage.dao.MenuDao;
import com.tang.taste.manage.dao.RoleDao;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

/**
 * FileName: UserService
 * @Author:   16
 * Date:     2018/4/21 17:27
 * Description:用户逻辑层
 */
@Service("empService")
public class EmpService {

    @Autowired
    private EmpDao empDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private MenuDao menuDao;

    /**
     * 查找用户信息
     * @param username
     * @return
     */
    public List<Employee> selectUserByUsername(String username){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andPhoneEqualTo(username);
        criteria.andDelFlagEqualTo(0);
        return empDao.selectByExample(employeeExample);
    }

    /**
     * 添加用户
     * @param employee
     * @return
     */
    public String addEmp(Employee employee){
        Map map = Maps.newHashMap();
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andPhoneEqualTo(employee.getPhone());
        criteria.andDelFlagEqualTo(0);
        List<Employee> list = empDao.selectByExample(employeeExample);
        if(list == null || list.size() < 1){
            String md="MD5";
            Object credentials = employee.getPassword();
            ByteSource salt = ByteSource.Util.bytes(employee.getPhone());
            //获取加密否返回的字符串new SimpleHash("MD5",credentials,salt,10)
            SimpleHash simpleHash = new SimpleHash(md,credentials,salt,10);
            employee.setPassword(simpleHash.toString());
            employee.setEntryTime(new Date());
            int num =  empDao.insertSelective(employee);
            if(num == 1){
                map.put("status","success");
                map.put("message","添加成功！");
                return JSON.toJSONString(map);
            }
        }
        map.put("status","error");
        map.put("message","添加失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 删除用户
     * @param ids
     * @return
     */
    public String delEmp(String ids){
        Map map = Maps.newHashMap();
        if(ids != null){
            String[] id = ids.split(",");
            List list = Arrays.asList(id);
            EmployeeExample employeeExample = new EmployeeExample();
            employeeExample.createCriteria().andIdIn(list);
            Employee employee = new Employee();
            employee.setDelFlag(1);
            employee.setLeaveTime(new Date());
            empDao.updateByExampleSelective(employee, employeeExample);
            map.put("status","success");
            map.put("message","删除成功！");
            return JSON.toJSONString(map);
        }
        map.put("status","error");
        map.put("message","删除失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 查询用户列表
     * @param findContent
     * @return
     */
    public List<Employee> selectEmployee(String findContent){
        List<Employee> lists = empDao.selectEmployeeList(findContent);
        List<Employee> list = Lists.newArrayList();
        for (Employee employee : lists) {
            employee.setEntryTimeStr(DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss",employee.getEntryTime()));
            employee.setLeaveTimeStr(DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss",employee.getLeaveTime()));
            if("0".equals(employee.getSax())){
                employee.setSax("男");
            }else{
                employee.setSax("女");
            }
            list.add(employee);
        }
       return list;
    }

    /**
     * 获取角色列表
     * @param findContent
     * @return
     */
    public  List<Role> selectRoleList(String findContent){
        return roleDao.selectRoleList(findContent);
    }

    /**
     * 添加角色
     * @param role
     * @return
     */
    public String addRole(Role role){
        Map map = Maps.newHashMap();
        RoleExample roleExample = new RoleExample();
        RoleExample.Criteria criteria = roleExample.createCriteria();
        criteria.andDelFlagEqualTo(0);
        criteria.andRoleNameEqualTo(role.getRoleName());
        List<Role> list = roleDao.selectByExample(roleExample);
        if(list == null || list.size() < 1){
            roleDao.insertSelective(role);
            map.put("status","success");
            map.put("message","添加成功！");
            return JSON.toJSONString(map);
        }
        map.put("status","error");
        map.put("message","添加失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 删除角色
     * @param ids
     * @return
     */
    public String delRole(String ids){
        Map map = Maps.newHashMap();
        if(ids != null){
            String[] id = ids.split(",");
            List list = Arrays.asList(id);
            RoleExample roleExample = new RoleExample();
            roleExample.createCriteria().andIdIn(list);
            Role role = new Role();
            role.setDelFlag(1);
            roleDao.updateByExampleSelective(role, roleExample);
            map.put("status","success");
            map.put("message","删除成功！");
            return JSON.toJSONString(map);
        }
        map.put("status","error");
        map.put("message","删除失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 获取员工拥有的权限
     * @param findContent
     * @return
     */
    public List<Employee> getEmpAllRole(String findContent){
       List<Employee> listId = empDao.selectEmployeeList(findContent);
       List<Integer> ids = Lists.newArrayList();
        for (Employee employee : listId) {
            ids.add(employee.getId());
        }
        List<Role> roles = roleDao.selectEmpAllRole(ids);
        List<Employee> lists = Lists.newArrayList();
        if(lists == null){
            return null;
        }
        for (Employee employee : listId) {
            StringBuffer str = new StringBuffer();
            StringBuffer id = new StringBuffer();
            for (Role role : roles){
                if(String.valueOf(employee.getId()).equals(role.getEmpId())){
                    if("".equals(str.toString())){
                        str.append(role.getRoleName());
                        id.append(role.getId());
                    }else{
                        str.append(",");
                        str.append(role.getRoleName());
                        id.append(",");
                        id.append(role.getId());
                    }
                }
            }
            employee.setRoleStr(str.toString());
            employee.setRoleId(id.toString());
            lists.add(employee);
        }
        return lists;
    }

    /**
     * 通过员工查询
     * @param empId
     * @return
     */
    public List<Role> selectRoleByUserId(Integer empId){
        List<Integer> list = Lists.newArrayList();
        list.add(empId);
        List<Role> lists = roleDao.selectEmpAllRole(list);
        List<Role> listNew = Lists.newArrayList();
        List<Integer> ids = Lists.newArrayList();
        for(Role role : lists){
             role.setCheck("true");
             listNew.add(role);
             ids.add(role.getId());
        }
        List<Role> listsNo = roleDao.selectEmpNoRole(ids);
        listNew.addAll(listsNo);
        return listNew;
    }

    /**
     * 更新用户角色关系
     * @param ids
     * @param empId
     * @return
     */
    public String updateRole(String ids,Integer empId){
        Map map = Maps.newHashMap();
        if(ids != null && ids != "") {
            //先把以前的删除
            roleDao.delEmpRoleByEmpId(empId);
            String[] id = ids.split(",");
            List<Role> roles = Lists.newArrayList();
            for (String str : id) {
                Role role = new Role();
                role.setId(Integer.valueOf(str));
                role.setEmpId(String.valueOf(empId));
                role.setDelFlag(0);
                roles.add(role);
            }
            roleDao.addEmpRole(roles);
            map.put("status", "success");
            map.put("message", "更新成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "error");
        map.put("message", "更新失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 删除用户角色关系
     * @param empIds
     * @return
     */
    public String delEmpRole(String empIds){
        Map map = Maps.newHashMap();
        if(empIds != null && empIds != ""){
            String[] ids = empIds.split(",");
            List list = Arrays.asList(ids);
            roleDao.delEmpRole(list);
            map.put("status", "success");
            map.put("message", "删除成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "success");
        map.put("message", "删除失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 条件查询菜单
     * @param findContent
     * @return
     */
    public List<Menu> selectMenu(String findContent){
        return menuDao.selectMenu(findContent);
    }
    /**
     * 添加菜单
     * @param menu
     * @return
     */
    public String addMenu(Menu menu){
        Map map = Maps.newHashMap();
        MenuExample menuExample = new MenuExample();
        MenuExample.Criteria criteria = menuExample.createCriteria();
        criteria.andDelFlagEqualTo(0);
        criteria.andNameEqualTo(menu.getName());
        List<Menu> list = menuDao.selectByExample(menuExample);
        if(list != null && list.size() < 1){
            menuDao.insertSelective(menu);
            map.put("status", "success");
            map.put("message", "添加成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "success");
        map.put("message", "添加失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 删除权限
     * @param ids
     * @return
     */
    public String delMenu(String ids){
        Map map = Maps.newHashMap();
        if(ids != null && ids != ""){
            String[] id = ids.split(",");
            MenuExample menuExample = new MenuExample();
            MenuExample.Criteria criteria = menuExample.createCriteria();
            List list = Arrays.asList(id);
            criteria.andIdIn(list);
            Menu menu = new Menu();
            menu.setDelFlag(1);
            menuDao.updateByExampleSelective(menu, menuExample);
            map.put("status", "success");
            map.put("message", "删除成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "success");
        map.put("message", "删除失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 每个角色拥有的所有权限列表
     * @param findContent
     * @return
     */
    public List<Role> getRolePermission(String findContent){
        List<Role> lists = roleDao.getRolePermission(findContent);
        List<Integer> menuIds = Lists.newArrayList();
        for (Role role : lists) {
            menuIds.add(role.getId());
        }
        List<Menu> list = menuDao.selectMenuByList(menuIds);
        List<Role> roleLists = Lists.newArrayList();
        for (Role role : lists){
            List<Menu> menus = role.getMenus();
            StringBuffer names = new StringBuffer();
            StringBuffer ids = new StringBuffer();
            for (Menu menu : list) {
                if(menu.getRoleId().equals(String.valueOf(role.getId()))){
                    if("".equals(names.toString())){
                        names.append(menu.getName());
                        ids.append(menu.getId());
                    }else{
                        names.append(",");
                        names.append(menu.getName());
                        ids.append(",");
                        ids.append(menu.getId());
                    }

                }
            }
            role.setMenuNames(names.toString());
            role.setMenuIds(ids.toString());
            roleLists.add(role);
        }
        return roleLists;
    }

    /**
     * 权限设置  权限列表
     * @param roleId
     * @return
     */
    public List<Menu> selectPermission(Integer roleId){
        List<Integer> roles = Lists.newArrayList();
        roles.add(roleId);
        List<Menu> menusCheck = menuDao.selectMenuByList(roles);
        List<Integer> menus = Lists.newArrayList();
        for (Menu menu : menusCheck ){
            menus.add(menu.getId());
        }
        List<Menu> menusNoCheck = menuDao.selectMenuNoCheck(menus);
        menusCheck.addAll(menusNoCheck);
        return menusCheck;
    }

    /**
     * 更新角色权限
     * @param roleId
     * @param menuIds
     * @return
     */
     public String updatePermission(Integer roleId,String menuIds){
         Map map = Maps.newHashMap();
         //删除以前权限关系
         menuDao.deleteRoleMenu(roleId);
         //创建新的关系
         if(menuIds != null && menuIds != ""){
             String[] menus = menuIds.split(",");
             List<Role> roles = Lists.newArrayList();
             for (String str : menus) {
                 Role role = new Role();
                 role.setId(roleId);
                 role.setMenuIds(str);
                 roles.add(role);
             }
             menuDao.insertRoelMenu(roles);
             map.put("status", "success");
             map.put("message", "更新成功！");
             return JSON.toJSONString(map);
         } else if(menuIds == ""){
             map.put("status", "success");
             map.put("message", "更新成功！");
             return JSON.toJSONString(map);
         }
         map.put("status", "error");
         map.put("message", "更新失败！");
         return JSON.toJSONString(map);
     }

     public Set<String> getAllPermission(String empName){
         return empDao.selectAllpermission(empName);
     }

     public List<Role> getAllRoleByEmpId(Integer empId){
         List<Integer> list = Lists.newArrayList();
         list.add(empId);
         List<Role> lists = roleDao.selectEmpAllRole(list);
         return lists;
     }

    /**
     * 查找配送员
     * @return
     */
     public List<Employee> selectDistribution(){
         return empDao.selectDistribution();
     }
}
