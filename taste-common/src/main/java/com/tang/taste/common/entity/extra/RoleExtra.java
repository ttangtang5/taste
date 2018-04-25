package com.tang.taste.common.entity.extra;

import com.tang.taste.common.entity.pojo.Menu;
import java.util.List;

/**
 * FileName: RoleExtra
 * @Author:   16
 * Date:     2018/4/24 13:33
 * Description:
 */
public class RoleExtra {

    private String empId;

    private String check;

    private List<Menu> menus;

    private String menuIds;

    private String menuNames;

    public String getMenuIds() {
        return menuIds;
    }

    public void setMenuIds(String menuIds) {
        this.menuIds = menuIds;
    }

    public String getMenuNames() {
        return menuNames;
    }

    public void setMenuNames(String menuNames) {
        this.menuNames = menuNames;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }
}
