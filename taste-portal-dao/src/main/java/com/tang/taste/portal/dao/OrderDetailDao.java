package com.tang.taste.portal.dao;

import com.tang.taste.common.dao.OrderDetailMapper;
import com.tang.taste.common.entity.pojo.OrderDetail;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * FileName: OrderDetailDao
 * @Author:   16
 * Date:     2018/4/19 14:56
 * Description:订单详情持久类
 */
public interface OrderDetailDao extends OrderDetailMapper{

    /**
     * 查询同一订单 详情  关联商品表
     * @param orderId
     * @return
     */
    @Select({"<script>" +
            "SELECT " +
            " o.order_id, " +
            " o.dishes_id, " +
            " o.sum_num, " +
            " o.sum_money, " +
            " o.pay_price, " +
            " o.special_discount, " +
            " o.del_flag, " +
            " d.dishes_name, " +
            " d.dishes_price  " +
            "FROM " +
            " order_detail o " +
            " LEFT JOIN sys_dishes d ON o.order_id = d.id  " +
            "WHERE " +
            " o.order_id = #{orderId}  " +
            " AND o.del_flag = 0" +
            "</script>"})
    List<OrderDetail> selectOrderDetailList(int orderId);

    /**
     * 插入订单详情
     * @param lists
     * @return
     */
    int insertOrderDetail(List<OrderDetail> lists);

}
