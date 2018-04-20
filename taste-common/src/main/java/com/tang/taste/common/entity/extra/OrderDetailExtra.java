package com.tang.taste.common.entity.extra;

/**
 * FileName: OrderDetailExtra
 * @Author:   16
 * Date:     2018/4/19 14:46
 * Description: 订单详情类
 */
public class OrderDetailExtra {

    private String dishesName;

    private Double dishesPrice;

    public String getDishesName() {
        return dishesName;
    }

    public void setDishesName(String dishesName) {
        this.dishesName = dishesName;
    }

    public Double getDishesPrice() {
        return dishesPrice;
    }

    public void setDishesPrice(Double dishesPrice) {
        this.dishesPrice = dishesPrice;
    }
}
