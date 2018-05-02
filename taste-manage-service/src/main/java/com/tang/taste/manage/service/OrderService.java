package com.tang.taste.manage.service;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.dao.BookingMapper;
import com.tang.taste.common.dao.TableOrderMapper;
import com.tang.taste.common.entity.pojo.*;
import com.tang.taste.common.util.DateUtil;
import com.tang.taste.manage.dao.BookingDao;
import com.tang.taste.manage.dao.TableDao;
import com.tang.taste.manage.dao.TableOrderDao;
import com.tang.taste.manage.dao.TableOrderDetailDao;
import com.tang.taste.portal.dao.OrderDao;
import com.tang.taste.portal.dao.OrderDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * FileName: OrderService
 * @Author:   16
 * Date:     2018/4/23 11:31
 * Description:餐厅订单业务逻辑
 */
@Service
public class OrderService {

    @Autowired
    private TableOrderDao tableOrderMapper;
    @Autowired
    private TableOrderDetailDao tableOrderDetailDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private BookingDao bookingMapper;
    @Autowired
    private TableDao tableDao;
    /**
     * 获取餐厅订单
     * @param tableId
     * @return
     */
    public List<TableOrder> getTableOrderByTableId(int tableId){
        TableOrderExample tableOrderExample = new TableOrderExample();
        tableOrderExample.createCriteria().andTableIdEqualTo(tableId);
        return tableOrderMapper.selectByExample(tableOrderExample);
    }

    /**
     * 获取订单详情
     * @param tableId
     * @return
     */
    public List<TableOrderDetail> selectTableOrderDetail(int tableId){
        TableOrderDetailExample tableOrderDetailExample = new TableOrderDetailExample();
        tableOrderDetailExample.createCriteria().andTableIdEqualTo(tableId);
        return tableOrderDetailDao.selectByExample(tableOrderDetailExample);
    }

    /**
     * 添加订单信息
     * @param tableOrder
     */
    public void insertTableOrder(TableOrder tableOrder){
        tableOrderMapper.insertSelective(tableOrder);
    }

    /**
     * 添加订单详情信息
     * @param lists
     */
    public void insertTableOrderDetail(List<TableOrderDetail> lists) {
        tableOrderDetailDao.insertTableOrderDetailList(lists);
    }

    /**
     * 更新订单
     * @param tableOrder
     */
    public void updateTableOrder(TableOrder tableOrder){
        TableOrderExample tableOrderExample = new TableOrderExample();
        tableOrderExample.createCriteria().andTableIdEqualTo(tableOrder.getTableId());
        tableOrderMapper.updateByExampleSelective(tableOrder, tableOrderExample);
    }

    /**
     * 通过状态查找订单列表
     * @param status
     * @return
     */
    public List<Order> selectOrderListByStatus(int status){
        return orderDao.selectOrderListByStatus(status);
    }

    /**
     * 查询订单信息
     * @param orderId
     * @return
     */
    public Order selectOrderByOrderId(int orderId){
        return orderDao.selectOrderById(orderId);
    }

    /**
     * 查询订单详情信息
     * @param orderId
     * @return
     */
    public List<OrderDetail> selectOrderDetailByOrderId(int orderId){
        return orderDetailDao.selectOrderDetailList(orderId);
    }

    /**
     * 查找预订列表
     * @return
     */
    public List<Booking> selectBookingList(){
        BookingExample bookingExample = new BookingExample();
        BookingExample.Criteria criteria = bookingExample.createCriteria();
        criteria.andDelFlagEqualTo(0);
        List<Booking> bookings = bookingMapper.selectByExample(bookingExample);
        List<Booking> lists = Lists.newArrayList();
        for (Booking booking : bookings) {
            booking.setTimeStr(DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss",booking.getTime()));
            lists.add(booking);
        }
        return  lists;
    }

    /**
     *获取可以选择餐桌
     * @param id
     * @return
     */
    public List<Tables> selectExitTable(int id){
        Booking booking = bookingMapper.selectByPrimaryKey(id);
        List<Integer> lists = bookingMapper.selectExitTable(DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss", booking.getTime()));
        TablesExample tablesExample = new TablesExample();
        TablesExample.Criteria criteria = tablesExample.createCriteria();
        criteria.andDelFlagEqualTo(0);
        criteria.andIdNotIn(lists);
        return tableDao.selectByExample(tablesExample);
    }

    /**
     * 安排预订餐桌
     * @param booking
     * @return
     */
    public String updateBooking(Booking booking){
        Map map = Maps.newHashMap();
        int i = bookingMapper.updateByPrimaryKeySelective(booking);
        if(i == 1){
            map.put("status", "200");
            map.put("message", "安排成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "500");
        map.put("message", "安排失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 统计线下销售总额
     * @return
     */
    public long countTableOrderMoney(){
        Long count = tableOrderMapper.sumTableOrder();
        if(count == null){
            return 0L;
        }
        return tableOrderMapper.sumTableOrder();
    }

    /**
     * 线上 销售总额
     * @return
     */
    public long countOrderMoney(){
        return tableOrderMapper.sumOrder();
    }
}
