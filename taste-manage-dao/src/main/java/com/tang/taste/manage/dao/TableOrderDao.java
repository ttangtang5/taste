package com.tang.taste.manage.dao;

import com.tang.taste.common.dao.TableOrderMapper;
import org.apache.ibatis.annotations.Select;

/**
 * FileName: TableOrderDao
 * @Author:   16
 * Date:     2018/5/1 17:21
 * Description:
 */
public interface TableOrderDao extends TableOrderMapper {

    /**
     * 统计线下 销售额
     * @return
     */
    @Select({"<script>" +
            "SELECT " +
            " sum(total)  " +
            "FROM " +
            " table_order  " +
            "WHERE " +
            " del_flag = 0  " +
            " AND `status` = 2" +
            "</script>"})
    Long sumTableOrder();

    /**
     * 统计线上 销售额
     * @return
     */
    @Select({"<script>" +
            "SELECT " +
            " sum( sum_num )  " +
            "FROM " +
            " `order` " +
            "WHERE " +
            " del_flag = 0  " +
            " AND `status` != 1 " +
            "</script>"})
    long sumOrder();
}
