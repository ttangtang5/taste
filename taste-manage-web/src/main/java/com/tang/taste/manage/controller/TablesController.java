package com.tang.taste.manage.controller;

import com.tang.taste.common.entity.pojo.Tables;
import com.tang.taste.manage.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * FileName: TablesController
 * @Author:   16
 * Date:     2018/4/27 10:49
 * Description:
 */
@RequestMapping("tables")
@Controller
public class TablesController {

    @Autowired
    private TableService tableService;

    @RequestMapping("addTables")
    @ResponseBody
    public String addTables(Tables tables) throws Exception{
        return tableService.addTabel(tables);
    }

    @RequestMapping("alertTables")
    @ResponseBody
    public String alertTables(Tables tables) throws Exception{
        return tableService.alertTable(tables);
    }

    @RequestMapping("delTableByIds")
    @ResponseBody
    public String delTableByIds(String ids) throws Exception{
        return tableService.delTable(ids);
    }
}

