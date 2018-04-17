package com.tang.taste.common.entity.extra;

/**
 * FileName: ShoppingCartDetailExtra
 * @Author:   16
 * Date:     2018/4/17 9:32
 * Description:购物车详情扩展类
 */
public class ShoppingCartDetailExtra {

    private String dishesName;

    private String dishesPicture;

    private double dishesPrice;

    private double dishesTotal;

    public String getDishesName() {
        return dishesName;
    }

    public void setDishesName(String dishesName) {
        this.dishesName = dishesName;
    }

    public String getDishesPicture() {
        return dishesPicture;
    }

    public void setDishesPicture(String dishesPicture) {
        this.dishesPicture = dishesPicture;
    }

    public double getDishesPrice() {
        return dishesPrice;
    }

    public void setDishesPrice(double dishesPrice) {
        this.dishesPrice = dishesPrice;
    }

    public double getDishesTotal() {
        return dishesTotal;
    }

    public void setDishesTotal(double dishesTotal) {
        this.dishesTotal = dishesTotal;
    }
}
