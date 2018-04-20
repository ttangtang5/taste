package com.tang.taste.portal.controller;

import com.alibaba.fastjson.JSON;
import com.tang.taste.common.entity.pojo.Order;
import com.tang.taste.common.entity.pojo.OrderDetail;
import com.tang.taste.common.entity.pojo.User;
import com.tang.taste.common.util.SessionUtils;
import com.tang.taste.portal.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * FileName: OrderController
 * @Author:   16
 * Date:     2018/4/19 14:38
 * Description:订单控制层
 */
@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**
     * 显示订单列表
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("orderList")
    @ResponseBody
    public String getOrderList(HttpServletRequest request) throws Exception{
        User user = SessionUtils.getUser(request);
        List<Order> list = orderService.selectOrderList(user.getId());
        return JSON.toJSONString(list);
    }

    /**
     * 获取订单信息通过订单编号
     * @param orderId
     * @return
     * @throws Exception
     */
    @RequestMapping("getOrder")
    @ResponseBody
    public String getOrder(int orderId)throws Exception{
        Order order = orderService.selectOrderById(orderId);
        return JSON.toJSONString(order);
    }

    /**
     * 通过订单编号获取详情
     * @param orderId
     * @return
     * @throws Exception
     */
    @RequestMapping("orderDetaileList")
    @ResponseBody
    public String getOrderDetailList(int orderId) throws Exception{
        List<OrderDetail> list = orderService.selectOrderDetailList(orderId);
        return JSON.toJSONString(list);
    }

    /**
     * 删除订单 以及订单详情
     * @param orderId
     * @return
     * @throws Exception
     */
    @RequestMapping("delOrder")
    @ResponseBody
    public String delOrder(int orderId) throws Exception{
        String str = orderService.delOrder(orderId);
        return JSON.toJSONString(str);
    }
}
