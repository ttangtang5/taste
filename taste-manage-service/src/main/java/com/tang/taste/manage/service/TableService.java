package com.tang.taste.manage.service;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.entity.pojo.Tables;
import com.tang.taste.common.entity.pojo.TablesExample;
import com.tang.taste.manage.dao.TableDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    /**
     * 找出所有的桌子信息
     * @param  findContent
     * @return
     */
    public List<Tables> selectTable(String findContent){
        TablesExample tablesExample = new TablesExample();
        TablesExample.Criteria criteria = tablesExample.createCriteria();
        criteria.andDelFlagEqualTo(0);
        if(findContent != null && findContent != ""){
            criteria.andIdEqualTo(Integer.valueOf(findContent));
        }
        List<Tables> lists =  tableDao.selectByExample(tablesExample);
        List<Tables> listNew = Lists.newArrayList();
        for (Tables tables : lists) {
            switch (tables.getStatus()){
                case 0:
                    tables.setStatusStr("可使用");
                    break;
                case 1:
                    tables.setStatusStr("已使用");
                    break;
                case 2:
                    tables.setStatusStr("维护");
                    break;
                default:
                    tables.setStatusStr("异常");
                    break;
            }
            listNew.add(tables);
        }
        return listNew;
    }

    /**
     * 添加信息
     * @param tables
     * @return
     */
    public String addTabel(Tables tables){
        Map map = Maps.newHashMap();
        int i = tableDao.insertSelective(tables);
        if(i == 1){
            map.put("status", "success");
            map.put("message", "添加成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "error");
        map.put("message", "添加失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 修改状态
     * @param tables
     * @return
     */
    public String alertTable(Tables tables){
        Map map = Maps.newHashMap();
        int i = tableDao.updateByPrimaryKeySelective(tables);
        if(i == 1){
            map.put("status", "success");
            map.put("message", "修改成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "error");
        map.put("message", "修改失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 删除
     * @param ids
     * @return
     */
    public String delTable(String ids){
        Map map = Maps.newHashMap();
        if(ids != null && ids != ""){
            String[] id = ids.split(",");
            List<Integer> lists = Lists.newArrayList();
            for (String str : id) {
                lists.add(Integer.valueOf(str));
            }
            Tables tables = new Tables();
            tables.setDelFlag(1);
            TablesExample tablesExample = new TablesExample();
            tablesExample.createCriteria().andIdIn(lists);
            tableDao.updateByExampleSelective(tables, tablesExample);
            map.put("status", "success");
            map.put("message", "删除成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "error");
        map.put("message", "删除失败！");
        return JSON.toJSONString(map);
    }
}
