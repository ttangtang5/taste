package com.tang.taste.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * FileName: OrderController
 * @Author:   16
 * Date:     2018/4/23 11:10
 * Description:订单 结账
 */
@Controller
@RequestMapping("order")
public class OrderController {

    /**
     * 保存订单
     * @return
     * @throws Exception
     */
    @RequestMapping("saveOrder")
    public String saveOrder() throws Exception{
        return "";
    }

    @RequestMapping("getOrder")
    public String getOrder(int tableId) throws Exception{
        return "";
    }
}
