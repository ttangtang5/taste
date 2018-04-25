package com.tang.taste.manage.dao;

import com.tang.taste.common.dao.MenuMapper;
import com.tang.taste.common.entity.pojo.Menu;
import com.tang.taste.common.entity.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * FileName: MenuDao
 * @Author:   16
 * Date:     2018/4/24 20:04
 * Description:
 */
public interface MenuDao extends MenuMapper {

    /**
     * 查询菜单
     * @param findContent
     * @return
     */
    List<Menu> selectMenu(@Param("findContent") String findContent);

    List<Menu> selectMenuByList(List<Integer> ids);

    List<Menu> selectMenuNoCheck(List<Integer> ids);

    int deleteRoleMenu(@Param("roleId") Integer roleId);

    int insertRoelMenu(List<Role> roles);
}
