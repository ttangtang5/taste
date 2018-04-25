package com.tang.taste.common.entity.extra;

import com.tang.taste.common.entity.pojo.Role;

import java.util.List;

/**
 * FileName: EmployeeExtra
 * @Author:   16
 * Date:     2018/4/24 11:01
 * Description:员工扩展实体类
 */
public class EmployeeExtra {

    private String entryTimeStr;

    private String leaveTimeStr;

    private String roleId;

    private List<Role> role;

    private String roleStr;

    public List<Role> getRole() {
        return role;
    }

    public void setRole(List<Role> role) {
        this.role = role;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleStr() {
        return roleStr;
    }

    public void setRoleStr(String roleStr) {
        this.roleStr = roleStr;
    }

    public String getEntryTimeStr() {
        return entryTimeStr;
    }

    public void setEntryTimeStr(String entryTimeStr) {
        this.entryTimeStr = entryTimeStr;
    }

    public String getLeaveTimeStr() {
        return leaveTimeStr;
    }

    public void setLeaveTimeStr(String leaveTimeStr) {
        this.leaveTimeStr = leaveTimeStr;
    }
}
