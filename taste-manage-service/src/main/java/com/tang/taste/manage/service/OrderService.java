package com.tang.taste.manage.service;

import com.tang.taste.common.dao.TableOrderMapper;
import com.tang.taste.common.entity.pojo.TableOrder;
import com.tang.taste.common.entity.pojo.TableOrderDetail;
import com.tang.taste.common.entity.pojo.TableOrderDetailExample;
import com.tang.taste.common.entity.pojo.TableOrderExample;
import com.tang.taste.manage.dao.TableOrderDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName: OrderService
 * @Author:   16
 * Date:     2018/4/23 11:31
 * Description:餐厅订单业务逻辑
 */
@Service
public class OrderService {

    @Autowired
    private TableOrderMapper tableOrderMapper;
    @Autowired
    private TableOrderDetailDao tableOrderDetailDao;
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

    public void updateTableOrder(TableOrder tableOrder){
        TableOrderExample tableOrderExample = new TableOrderExample();
        tableOrderExample.createCriteria().andTableIdEqualTo(tableOrder.getTableId());
        tableOrderMapper.updateByExampleSelective(tableOrder, tableOrderExample);
    }
}
