package com.tang.taste.manage.realm;
import com.tang.taste.common.entity.pojo.Employee;
import com.tang.taste.common.entity.pojo.Role;
import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.manage.service.EmpService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class LoginRealm extends AuthorizingRealm {

    @Autowired
    private EmpService empService;
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //将AuthenticationToken转为usernamepasswordToken
        UsernamePasswordToken userToken = (UsernamePasswordToken) token;
        //从userToken获取输入的username
        String username = userToken.getUsername();
        //通过username去数据库中查找数据
        List<Employee> employees = empService.selectUserByUsername(username);
        //数据库不存在该用户、其他异常
        if(employees == null && employees.size() != 1){
            //抛出用户不存在异常
            throw new UnknownAccountException("无效用户名");
            //throw new AuthenticationException();
        }
        //创建AuthenticationInfo(接口)对象 用SimpleAuthenticationInfo实现类创建   并返回
        //三个参数是数据库中的的数据
        //principal:认证实体信息，可以是username 也可以是对应用户的实体对象
        Object principal = username;
        //credentials:密码
        Object credentials = employees.get(0).getPassword();
        //RealmName:当前的realm对象的name 只需调用父类的getName()方法即可
        String realmName = getName();
        //不加密验证密码
        //SimpleAuthenticationInfo info1=new SimpleAuthenticationInfo(principal,credentials,realmName);
        //获取随机盐 通过用户的id产生
        ByteSource salt = ByteSource.Util.bytes(principal);
        //加密验证密码
        SimpleAuthenticationInfo info1 = new SimpleAuthenticationInfo(principal,credentials,salt,realmName);
        return info1;
    }

    /**
     * 授权
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //1、从PrincipalCollection 获取登录用户信息
        Object principal = principalCollection.getPrimaryPrincipal();
        List<Employee> employees = empService.selectUserByUsername((String) principal);
        List<Role> role =  empService.getAllRoleByEmpId(employees.get(0).getId());
        //2、通过用户信息获取角色信息（从数据库）
        Set<String> roles = new HashSet<String>();
        for (Role role1 : role) {
            roles.add(role1.getRemarks());
        }
        //3、创建SimpleAuthorizationInfo对象、将角色放入
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(roles);
        info.setStringPermissions(empService.getAllPermission((String) principal));
        return info;
    }

}
