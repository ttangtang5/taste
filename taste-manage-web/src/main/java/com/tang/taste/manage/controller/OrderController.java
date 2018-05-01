package com.tang.taste.manage.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.tang.taste.common.entity.pojo.*;
import com.tang.taste.common.util.DateUtil;
import com.tang.taste.common.util.DateUtils;
import com.tang.taste.manage.service.OrderService;
import com.tang.taste.portal.dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * FileName: OrderController
 * @Author:   16
 * Date:     2018/4/23 11:10
 * Description:订单 结账
 */
@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    /**
     * 保存订单
     * @return
     * @throws Exception
     */
    @RequestMapping("saveOrder")
    @ResponseBody
    public String saveOrder(int tableId,int num,double total,HttpServletRequest request) throws Exception{
        String[] dishesNames = request.getParameterValues("dishesNames");
        String[] dishesNums = request.getParameterValues("dishesNums");
        List<TableOrderDetail> lists = Lists.newArrayList();
        for(int i = 0;i < dishesNames.length; i++){
            TableOrderDetail tableOrderDetail = new TableOrderDetail();
            String[] str = dishesNames[i].split("---");
            tableOrderDetail.setDishesName(str[0]);
            tableOrderDetail.setDishesPrice(Double.valueOf(str[1]));
            tableOrderDetail.setPayPrice(0d);
            tableOrderDetail.setSumNum(Integer.valueOf(dishesNums[i]));
            tableOrderDetail.setTableId(tableId);
            tableOrderDetail.setSumMoney(tableOrderDetail.getSumNum() * tableOrderDetail.getDishesPrice());
            tableOrderDetail.setSpecialDiscount(0d);
            tableOrderDetail.setDelFlag(0);
            lists.add(tableOrderDetail);
        }
        TableOrder tableOrder = new TableOrder();
        tableOrder.setTableId(tableId);
        tableOrder.setTotal(total);
        tableOrder.setNum(num);
        tableOrder.setDelFlag(0);
        tableOrder.setCreateTime(new Date());
        tableOrder.setStatus(1);
        List<TableOrder> tableOrder1 = orderService.getTableOrderByTableId(tableId);
        if(tableOrder1 == null){
            orderService.insertTableOrder(tableOrder);
        }else{
            orderService.updateTableOrder(tableOrder);
        }
        orderService.insertTableOrderDetail(lists);
        return "/manage/index";
    }

    /**
     * 结账显示订单信息
     * @param tableId
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("getOrder")
    public String getOrder(int tableId, HttpServletRequest request) throws Exception{
        List<TableOrder> tableOrder = orderService.getTableOrderByTableId(tableId);
        List<TableOrderDetail> lists = orderService.selectTableOrderDetail(tableId);
        if(tableOrder != null && tableOrder.size() == 1){
            request.setAttribute("tableOrder",tableOrder);
        }
        int i = 0;
        for(TableOrderDetail tableOrderDetail : lists ){
            i = i + tableOrderDetail.getSumNum();
        }
        request.setAttribute("goodsNum",i);
        request.setAttribute("tableOrderDetail",lists);
        return "/manage/checkout";
    }

    /**
     * 获取列表
     * @return
     */
    @RequestMapping("getOrderList")
    @ResponseBody
    public String getOrderList() throws Exception {
        List<Order> lists = orderService.selectOrderListByStatus(1);
        List<Order> listNew = Lists.newArrayList();
        for(Order order : lists){
            order.setCreateTimeStr(DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss",order.getCreateTime()));
            listNew.add(order);
        }
        return JSON.toJSONString(lists);
    }

    /**
     * 跳转接单
     * @return
     * @throws Exception
     */
    @RequestMapping("toAcceptOrder")
    public String toAcceptOrder(int orderId, HttpServletRequest request) throws Exception{
        Order order = orderService.selectOrderByOrderId(orderId);
        int count = 0;
        List<OrderDetail> lists = orderService.selectOrderDetailByOrderId(orderId);
        for(int i = 0;i < lists.size();i++){
            count = count + lists.get(i).getSumNum();
        }
        request.setAttribute("order",order);
        request.setAttribute("count",count);
        request.setAttribute("orderDetail",lists);
        return "manage/acceptOrder";
    }

    /**
     * 获取预订列表
     * @return
     * @throws Exception
     */
    @RequestMapping("getBookingList")
    @ResponseBody
    public String getBookingList() throws Exception{
        List<Booking> lists = orderService.selectBookingList();
        return JSON.toJSONString(lists);
    }

    /**
     * 获取能安排的餐桌
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("getTableBooking")
    @ResponseBody
    public String getTableBooking(int id) throws Exception{
        List<Tables> lists = orderService.selectExitTable(id);
        return JSON.toJSONString(lists);
    }

    /**
     * 安排预订餐桌
     * @param id
     * @param tableId
     * @return
     * @throws Exception
     */
    @RequestMapping("saveBooking")
    @ResponseBody
    public String saveBooking(int id,int tableId) throws Exception{
        Booking booking = new Booking();
        booking.setId(id);
        booking.setTableId(tableId);
        booking.setDelFlag(0);
        return orderService.updateBooking(booking);
    }
}
