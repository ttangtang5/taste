package com.tang.taste.portal.dao;

import com.tang.taste.common.dao.ShoppingCartDetailMapper;
import com.tang.taste.common.entity.extra.PageHelper;
import com.tang.taste.common.entity.pojo.ShoppingCartDetail;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName: ShoppingCartDetailDao
 * @Author:   16
 * Date:     2018/4/16 19:57
 * Description:购物车详情持久层
 */
public interface ShoppingCartDetailDao extends ShoppingCartDetailMapper {

    /**
     * 向购物车中添加同样商品更改数量
     * @param dishesId
     * @param cartId
     */
    @Update({"<script>" +
            " UPDATE shopping_cart_detail  " +
            "  SET num = num + 1  " +
            "WHERE " +
            " dishes_id = #{dishesId}  " +
            " AND cart_id = #{cartId} " +
            "</script>"})
    void updateShoppingCartDetailNum(@Param("dishesId") int dishesId,@Param("cartId") int cartId);

    /**
     * 购物车编号为cartId 的购物车详情
     * @param cartId
     * @return
     */
    @Select({"<script>" +
            " SELECT " +
            " s.cart_id 'cartId', " +
            " s.dishes_id 'dishesId', " +
            " s.num, " +
            " d.dishes_name 'dishesName', " +
            " d.dishes_price 'dishesPrice', " +
            " d.picture 'dishesPicture', " +
            " s.num * d.dishes_price 'dishesTotal'  " +
            "FROM " +
            " shopping_cart_detail s, " +
            " sys_dishes d  " +
            "WHERE " +
            " s.dishes_id = d.id  " +
            " AND s.cart_id = #{cartId}  " +
            " AND d.del_flag = 0 " +
            " AND s.`status` = 0 " +
            "</script>"})
    List<ShoppingCartDetail> selectShoppingCartDetail(int cartId);

    @Select({"<script>" +
            " SELECT " +
            " count(0) " +
            "FROM " +
            " shopping_cart_detail s, " +
            " sys_dishes d  " +
            "WHERE " +
            " s.dishes_id = d.id  " +
            " AND s.cart_id = #{cartId}  " +
            " AND d.del_flag = 0 " +
            " AND s.`status` = 0 " +
            "</script>"})
    long countShoppingCartDetail(int cartId);
}
