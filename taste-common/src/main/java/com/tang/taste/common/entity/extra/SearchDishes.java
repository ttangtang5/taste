package com.tang.taste.common.entity.extra;

import java.io.Serializable;

/**
 * FileName: SearchDishes
 * @Author:   16
 * Date:     2018/2/6 10:21
 * Description:搜索实体类  推送solr服务器
 */
public class SearchDishes implements Serializable {

    private String id;

    private String dishesName;

    private double dishesPrice;

    private String dishesPicture;

    private String dishesTypeName;

    private String dishesDesc;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDishesName() {
        return dishesName;
    }

    public void setDishesName(String dishesName) {
        this.dishesName = dishesName;
    }

    public double getDishesPrice() {
        return dishesPrice;
    }

    public void setDishesPrice(double dishesPrice) {
        this.dishesPrice = dishesPrice;
    }

    public String getDishesPicture() {
        return dishesPicture;
    }

    public void setDishesPicture(String dishesPicture) {
        this.dishesPicture = dishesPicture;
    }

    public String getDishesTypeName() {
        return dishesTypeName;
    }

    public void setDishesTypeName(String dishesTypeName) {
        this.dishesTypeName = dishesTypeName;
    }

    public String getDishesDesc() {
        return dishesDesc;
    }

    public void setDishesDesc(String dishesDesc) {
        this.dishesDesc = dishesDesc;
    }
}
