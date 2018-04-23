package com.tang.taste.manage.controller;

import com.google.common.collect.Lists;
import com.tang.taste.common.entity.pojo.TableOrder;
import com.tang.taste.common.entity.pojo.TableOrderDetail;
import com.tang.taste.manage.service.OrderService;
import com.tang.taste.portal.dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
}
