package com.tang.taste.portal.service;

import com.tang.taste.common.entity.pojo.Order;
import com.tang.taste.common.entity.pojo.OrderDetail;
import com.tang.taste.common.entity.pojo.OrderDetailExample;
import com.tang.taste.common.entity.pojo.OrderExample;
import com.tang.taste.portal.dao.OrderDao;
import com.tang.taste.portal.dao.OrderDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName: OrderService
 * @Author:   16
 * Date:     2018/4/19 14:41
 * Description: 订单业务逻辑
 */
@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private OrderDetailDao orderDetailDao;
    /**
     * 获取订单列表
     * @param userId
     * @return
     */
    public List<Order> selectOrderList(int userId){
        return orderDao.selectOrderList(userId);
    }

    /**
     * 通过id获取订单信息   关联派送员
     * @param id
     * @return
     */
    public Order selectOrderById(int id){
        return orderDao.selectOrderById(id);
    }

    /**
     * 通过订单号查询订单详情
     * @param orderId
     * @return
     */
    public List<OrderDetail> selectOrderDetailList(int orderId){
        return orderDetailDao.selectOrderDetailList(orderId);
    }

    /**
     * 删除订单及详情
     * @param orderId
     * @return
     */
    public String delOrder(int orderId){
        OrderExample orderExample = new OrderExample();
        orderExample.createCriteria().andOrderIdEqualTo(orderId);
        Order order = new Order();
        order.setDelFlag(1);
       int num =  orderDao.updateByExampleSelective(order,orderExample);
       if(num == 1){
           OrderDetailExample orderDetailExample = new OrderDetailExample();
           orderDetailExample.createCriteria().andOrderIdEqualTo(orderId);
           OrderDetail orderDetail = new OrderDetail();
           orderDetail.setDelFlag(1);
           num = orderDetailDao.updateByExampleSelective(orderDetail, orderDetailExample);
           if(num == 1){
               return "success";
           }
       }
        return "error";
    }
}
