﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	/**
	* 接收参数 创建订单
	*/
	String token = "XDca0b2mokapJFIEi3llt2IpIPIPaGw4"; //记得更改 http://codepay.fateqq.com 后台可设置
	String codepay_id ="46481" ;//记得更改 http://codepay.fateqq.com 后台可获得

	String price = request.getParameter("price"); //表单提交的价格
	String type = request.getParameter("type"); //支付类型  1：支付宝 2：QQ钱包 3：微信
	String pay_id = request.getParameter("pay_id"); //支付人的唯一标识
	String param = request.getParameter("param"); //自定义一些参数 支付后返回

	String notify_url = "http://www.baidu.com";//通知地址
	String return_url = "http://www.baidu.com";//支付后同步跳转地址

	if(price == null){
		price="1";
	}
	//参数有中文则需要URL编码
	//String url="http://codepay.fateqq.com:52888/creat_order?id="+codepay_id+"&pay_id="+pay_id+"&price="+price+"&type="+type+"&token="+token+"&param="+param+"&notify_url="+notify_url+"&return_url="+return_url;
	//response.sendRedirect(url);
	
%>