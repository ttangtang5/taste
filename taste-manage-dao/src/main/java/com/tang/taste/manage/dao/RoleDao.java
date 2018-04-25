package com.tang.taste.manage.dao;

import com.tang.taste.common.dao.RoleMapper;
import com.tang.taste.common.entity.pojo.Employee;
import com.tang.taste.common.entity.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * FileName: RoleDao
 * @Author:   16
 * Date:     2018/4/24 12:42
 * Description:角色
 */
public interface RoleDao extends RoleMapper {

    List<Role> selectRoleList(@Param("findContent") String findContent);

    /**
     * 获取用户对应的角色
     * @param ids
     * @return
     */
    List<Role> selectEmpAllRole(List<Integer> ids);

    /**
     * 查找该用户不拥有的角色
     * @param ids
     * @return
     */
    List<Role> selectEmpNoRole(List<Integer> ids);

    /**
     * 删除用户于角色的关系
     * @param empId
     * @return
     */
    int delEmpRoleByEmpId(Integer empId);

    int delEmpRole(List<String> empIds);

    int addEmpRole(List<Role> roles);

    /**
     * 每个角色拥有的所有权限列表
     * @param findContent
     * @return
     */
    List<Role> getRolePermission(@Param("findContent") String findContent);
}
