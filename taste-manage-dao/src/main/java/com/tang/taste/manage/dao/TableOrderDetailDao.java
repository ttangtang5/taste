package com.tang.taste.manage.dao;

import com.tang.taste.common.dao.TableOrderDetailMapper;
import com.tang.taste.common.entity.pojo.TableOrderDetail;

import java.util.List;

/**
 * FileName: TableOrderDetailDao
 * @Author:   16
 * Date:     2018/4/23 15:04
 * Description:餐厅订单详情扩展类
 */
public interface TableOrderDetailDao extends TableOrderDetailMapper {

    /**
     * 添加订单详情
     * @param lists
     * @return
     */
    int insertTableOrderDetailList(List<TableOrderDetail> lists);
}
