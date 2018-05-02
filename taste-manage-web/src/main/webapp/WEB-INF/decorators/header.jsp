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
                    <a class="dropdown-toggle"  href="${ctx}/manage/toIndex">
                        点餐<span class="collapsing"></span>
                    </a>
                </li>
                <shiro:hasRole name="admin">
                <li>
                    <a class="dropdown-toggle"  href="${ctx}/manage/toDishesManage">
                        餐厅管理<span class="collapsing"></span>
                    </a>
                </li>
                </shiro:hasRole>
                <li>
                    <a class="dropdown-toggle"  href="${ctx}/manage/toContent">
                        内容管理<span class="collapsing"></span>
                    </a>
                </li>
                <shiro:hasRole name="admin">
                <li>
                    <a class="dropdown-toggle"  href="${ctx}/manage/toUserMange">
                        用户管理<span class="collapsing"></span>
                    </a>
                </li>
                </shiro:hasRole>
                <li>
                    <a class="dropdown-toggle"  href="${ctx}/manage/toReport">
                        统计<span class="collapsing"></span>
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav  pull-right" >
                <li class="dropdown " style="color:#fff;">
                    <a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown"
                        class="dropdown-toggle qqlogin" >
                        ${sessionScope.empName}<span class="caret"></span></a>
                    <ul class="dropdown-menu" userid="1">
                        <li><a href="${ctx}/logout" >退出登录</a></li>
                    </ul>
                </li>
            </ul>
            <style>#topMenu>li>a{padding:10px 13px}</style>

            <style>#topMenu>li>a{padding:10px 13px}</style>
        </div>
    </div>
</div>



