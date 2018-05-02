package com.tang.taste.portal.dao;

import com.tang.taste.common.dao.OrderMapper;
import com.tang.taste.common.entity.pojo.Order;
import org.apache.ibatis.annotations.Param;
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
            " user_id = #{userId}" +
            " order by create_time desc " +
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
            " o.phone 'phone', " +
            " create_time 'createTime', " +
            " sum_num 'sumNum', " +
            " o.STATUS 'status', " +
            " e.emp_name 'empName', " +
            " e.phone 'empPhone'  " +
            "FROM " +
            " `order` o " +
            " LEFT JOIN sys_employee e ON o.emp_id = e.id  " +
            "WHERE " +
            " o.del_flag = 0  " +
            " AND o.STATUS != #{status} " +
            "ORDER BY " +
            " create_time DESC" +
            "</script>"})
    List<Order> selectOrderListByStatus(int status);

    /**
     * 分页查询评论列表
     * @param offset
     * @param limit
     * @return
     */
    @Select({"<script>" +
            " SELECT " +
            " LEFT(user_name,7) as 'userName', " +
            " o.create_time, " +
            " rate_level, " +
            " rate_picture, " +
            " rate_content  " +
            "FROM " +
            " `order` o, " +
            " sys_user u  " +
            "WHERE " +
            " o.user_id = u.id " +
            " AND " +
            "  o.`status` = 5 " +
            "  LIMIT #{offset},#{limit}" +
            "</script>"})
    List<Order> selectOrderRateList(@Param("offset") int offset, @Param("limit") int limit);

    @Select({"<script>" +
            "SELECT " +
            " count(0) " +
            "FROM " +
            " `order` o, " +
            " sys_user u  " +
            "WHERE " +
            " o.user_id = u.id " +
            " AND " +
            "  o.`status` = 5 " +
            "</script>"})
    long countOrderRateList();

}
