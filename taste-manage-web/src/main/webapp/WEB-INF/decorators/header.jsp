<!-- 页面头部 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp" %>
<%@ page pageEncoding="utf-8"%>
<%--shiro 标签 --%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-inverse navbar-fixed-top animated fadeInDown" style="z-index: 101;height: 41px;">

    <div class="container" style="padding-left: 0px; padding-right: 0px;">
        <div class="navbar-header">
            <button data-target=".navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle collapsed">
                <span class="sr-only">导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div role="navigation" class="navbar-collapse collapse">
            <a id="_logo"  href="http://shiro.itboy.net/" style="color:#fff; font-size: 24px;" class="navbar-brand hidden-sm">SSM + Shiro Demo 演示</a>
            <ul class="nav navbar-nav" id="topMenu">
                <li>
                    <a class="dropdown-toggle" target="_blank" href="">
                        点餐<span class="collapsing"></span>
                    </a>
                </li>
                <li class="dropdown ">
                    <a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown" class="dropdown-toggle" href="/member/list.shtml">
                        餐厅管理<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/member/list.shtml">用户列表</a></li>
                        <li><a href="/member/list.shtml">用户列表</a></li>
                        <li><a href="/member/list.shtml">用户列表</a></li>
                        <li><a href="/member/online.shtml">在线用户</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown" class="dropdown-toggle" href="/permission/index.shtml">
                        配送管理<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/role/index.shtml">角色列表</a></li>
                        <li><a href="/role/allocation.shtml">角色分配</a></li>
                        <li><a href="/permission/index.shtml">权限列表</a></li>
                        <li><a href="/permission/allocation.shtml">权限分配</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown" class="dropdown-toggle" href="/permission/index.shtml">
                        用户管理<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/role/index.shtml">角色列表</a></li>
                        <li><a href="/role/allocation.shtml">角色分配</a></li>
                        <li><a href="/permission/index.shtml">权限列表</a></li>
                        <li><a href="/permission/allocation.shtml">权限分配</a></li>
                    </ul>
                </li>
                <li>
                    <a class="dropdown-toggle" target="_blank" href="http://www.sojson.com/tag/shiro">
                        统计<span class="collapsing"></span>
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav  pull-right" >
                <li class="dropdown " style="color:#fff;">
                    <a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown"
                       onclick="location.href='/user/index.shtml'" href="/user/index.shtml" class="dropdown-toggle qqlogin" >
                        管理员<span class="caret"></span></a>
                    <ul class="dropdown-menu" userid="1">
                        <li><a href="/user/index.shtml">个人资料</a></li>
                        <li><a href="/role/mypermission.shtml">我的权限</a></li>
                        <li><a href="javascript:void(0);" onclick="logout();">退出登录</a></li>
                    </ul>
                </li>
            </ul>
            <style>#topMenu>li>a{padding:10px 13px}</style>

            <style>#topMenu>li>a{padding:10px 13px}</style>
        </div>
    </div>
</div>



