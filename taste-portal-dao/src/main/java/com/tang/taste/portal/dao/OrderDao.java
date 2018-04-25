package com.tang.taste.portal.dao;

import com.tang.taste.common.dao.OrderMapper;
import com.tang.taste.common.entity.pojo.Order;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * FileName: OrderDao
 * Author:   16
 * Date:     2018/4/19 14:44
 * Description:订单持久层
 */
public interface OrderDao extends OrderMapper {

    /**
     * 查找订单列表
     * @param userId
     * @return
     */
    @Select({"<script>" +
            "SELECT " +
            " order_Id 'orderId', " +
            " receiver 'receiver', " +
            " phone 'phone', " +
            " create_time 'createTime', " +
            " sum_num 'sumNum', " +
            " STATUS 'status'  " +
            "FROM " +
            " `order`  " +
            "WHERE " +
            " del_flag = 0" +
            " AND" +
            " user_id = #{userId} " +
            "</script>"})
    List<Order> selectOrderList(int userId);

    /**
     * 通过查找信息
     * @param orderId
     * @return
     */
    @Select({"<script>" +
            "SELECT " +
            " o.order_Id, " +
            " o.user_id, " +
            " o.receiver, " +
            " o.address, " +
            " o.phone, " +
            " o.sum_num, " +
            " o.emp_id, " +
            " o.create_time, " +
            " o.payment_type, " +
            " o.STATUS, " +
            " o.update_time, " +
            " o.payment_time, " +
            " o.consign_time, " +
            " o.end_time, " +
            " o.close_time, " +
            " o.buyer_message, " +
            " o.buyer_rate, " +
            " o.rate_level, " +
            " o.rate_content, " +
            " o.del_flag, " +
            " s.emp_name, " +
            " s.phone 'empPhone' " +
            "FROM " +
            " `order` o " +
            " LEFT JOIN sys_employee s ON  o.emp_id = s.id  " +
            "WHERE " +
            " o.del_flag = 0" +
            " AND" +
            " o.order_Id = #{orderId} " +
            "</script>"})
    Order selectOrderById(int orderId);


    /**
     * 查找订单列表  后台使用
     * @param status
     * @return
     */
    @Select({"<script>" +
            "SELECT " +
            " order_Id 'orderId', " +
            " receiver 'receiver', " +
            " phone 'phone', " +
            " create_time 'createTime', " +
            " sum_num 'sumNum', " +
            " STATUS 'status'  " +
            "FROM " +
            " `order`  " +
            "WHERE " +
            " del_flag = 0" +
            " AND" +
            " STATUS != #{status} " +
            "</script>"})
    List<Order> selectOrderListByStatus(int status);

}