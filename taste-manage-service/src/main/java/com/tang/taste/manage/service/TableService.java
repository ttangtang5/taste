package com.tang.taste.manage.service;

import com.tang.taste.common.entity.pojo.Tables;
import com.tang.taste.common.entity.pojo.TablesExample;
import com.tang.taste.manage.dao.TableDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName: TableService
 * @Author:   16
 * Date:     2018/4/23 10:39
 * Description:餐桌业务逻辑层
 */
@Service
public class TableService {

    @Autowired
    private TableDao tableDao;
    /**
     * 找出未维护的桌子信息
     * @return
     */
    public List<Tables> selectTableBystatus(){
        TablesExample tablesExample = new TablesExample();
        tablesExample.createCriteria().andStatusNotEqualTo(2);
        tablesExample.createCriteria().andDelFlagEqualTo(0);
       return tableDao.selectByExample(tablesExample);
    }
}
