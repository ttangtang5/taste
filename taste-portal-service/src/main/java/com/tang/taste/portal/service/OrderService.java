package com.tang.taste.portal.service;

import com.google.common.collect.Lists;
import com.tang.taste.common.dao.BookingMapper;
import com.tang.taste.common.entity.pojo.*;
import com.tang.taste.common.util.DateUtil;
import com.tang.taste.portal.dao.OrderDao;
import com.tang.taste.portal.dao.OrderDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

    @Autowired
    private BookingMapper bookingMapper;

    @Value("${SEARCH_PAGE_SIZE}")
    private Integer pageSize;
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

    /**
     * 添加订单信息
     * @param order
     * @return
     */
    public int addOrder(Order order){
        orderDao.insertSelective(order);
        return order.getOrderId();
    }

    /**
     * 添加订单详情
     * @param orderDetail
     */
    public void addOrderDetail(List<OrderDetail> orderDetail){
        orderDetailDao.insertOrderDetail(orderDetail);
    }


    /**
     * 付款更新
     * @param orderId
     */
    public void updateOrderPayStatus(int orderId){
        Order order = new Order();
        order.setStatus(2);
        order.setPaymentType(1);
        order.setOrderId(orderId);
        orderDao.updateByPrimaryKeySelective(order);
    }

    /**
     * 添加评价内容
     * @param order
     */
    public void updateOrderRateStatus(Order order){
        orderDao.updateByPrimaryKeySelective(order);
    }

    /**
     * 分页查询评论列表
     * @param page
     * @return
     */
    public List<Order> selectRateList(int page){
        List<Order> lists = orderDao.selectOrderRateList(pageSize*(page-1),pageSize);
        List<Order> listNew = Lists.newArrayList();
        for (Order order : lists) {
            order.setCreateTimeStr(DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss",order.getCreateTime()));
            if(order != null && order.getRatePicture() != null){
                String[] picture = order.getRatePicture().split("==");
                order.setRatePictureArr(picture);
            }
            listNew.add(order);
        }
       return listNew;
    }

    /**
     * 统计评论条数
     * @return
     */
    public long countRateList(){
       return orderDao.countOrderRateList();
    }

    /**
     * 添加预订
     * @param booking
     * @return
     */
    public String addBooking(Booking booking) {
        int i = bookingMapper.insertSelective(booking);
        return "/toBooking";
    }

    /***
     * 取消订单
     * @param id
     * @return
     */
    public String cancelBooking(int id){
        Booking booking = new Booking();
        booking.setId(id);
        booking.setDelFlag(1);
        int i = bookingMapper.updateByPrimaryKeySelective(booking);
        if(i == 1){
            return "200";
        }
        return "500";
    }

    /**
     * 查看订单
     * @param userId
     * @return
     */
    public Booking showBooking(int userId){
        BookingExample bookingExample = new BookingExample();
        BookingExample.Criteria criteria = bookingExample.createCriteria();
        criteria.andUserIdEqualTo(userId);
        criteria.andDelFlagEqualTo(0);
        List<Booking> bookings = bookingMapper.selectByExample(bookingExample);
        if(bookings != null && bookings.size() == 1){
            return bookings.get(0);
        }
        return null;
    }
}
