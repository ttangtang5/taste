package com.tang.taste.manage.dao;

import com.tang.taste.common.dao.BookingMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * FileName: BookingDao
 * @Author:   16
 * Date:     2018/5/1 15:57
 * Description:
 */
public interface BookingDao extends BookingMapper {


    /**
     * 筛选不符合条件的餐桌
     * @param time
     * @return
     */
    @Select({"<script>" +
            "SELECT " +
            " table_id, " +
            " time  " +
            "FROM " +
            " booking  " +
            "WHERE " +
            " del_flag = 0 " +
            " AND table_id IS NOT NULL " +
            " AND time BETWEEN date_sub( #{time}, INTERVAL 1 HOUR )  " +
            " AND date_add( #{time}, INTERVAL 1 HOUR );" +
            "</script>"})
    List<Integer> selectExitTable(@Param("time") String time);
}
