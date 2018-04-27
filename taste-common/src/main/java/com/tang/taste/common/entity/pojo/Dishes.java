package com.tang.taste.common.entity.pojo;

import com.tang.taste.common.entity.extra.DishesExtra;

import java.io.Serializable;

public class Dishes extends DishesExtra implements Serializable {
    private Integer id;

    private String dishesName;

    private Double dishesPrice;

    private Integer dishesType;

    private String supplyTime;

    private String picture;

    private String desc;

    private Integer delFlag;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public Integer getDishesType() {
        return dishesType;
    }

    public void setDishesType(Integer dishesType) {
        this.dishesType = dishesType;
    }

    public String getSupplyTime() {
        return supplyTime;
    }

    public void setSupplyTime(String supplyTime) {
        this.supplyTime = supplyTime;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Dishes other = (Dishes) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getDishesName() == null ? other.getDishesName() == null : this.getDishesName().equals(other.getDishesName()))
            && (this.getDishesPrice() == null ? other.getDishesPrice() == null : this.getDishesPrice().equals(other.getDishesPrice()))
            && (this.getDishesType() == null ? other.getDishesType() == null : this.getDishesType().equals(other.getDishesType()))
            && (this.getSupplyTime() == null ? other.getSupplyTime() == null : this.getSupplyTime().equals(other.getSupplyTime()))
            && (this.getPicture() == null ? other.getPicture() == null : this.getPicture().equals(other.getPicture()))
            && (this.getDesc() == null ? other.getDesc() == null : this.getDesc().equals(other.getDesc()))
            && (this.getDelFlag() == null ? other.getDelFlag() == null : this.getDelFlag().equals(other.getDelFlag()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getDishesName() == null) ? 0 : getDishesName().hashCode());
        result = prime * result + ((getDishesPrice() == null) ? 0 : getDishesPrice().hashCode());
        result = prime * result + ((getDishesType() == null) ? 0 : getDishesType().hashCode());
        result = prime * result + ((getSupplyTime() == null) ? 0 : getSupplyTime().hashCode());
        result = prime * result + ((getPicture() == null) ? 0 : getPicture().hashCode());
        result = prime * result + ((getDesc() == null) ? 0 : getDesc().hashCode());
        result = prime * result + ((getDelFlag() == null) ? 0 : getDelFlag().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", dishesName=").append(dishesName);
        sb.append(", dishesPrice=").append(dishesPrice);
        sb.append(", dishesType=").append(dishesType);
        sb.append(", supplyTime=").append(supplyTime);
        sb.append(", picture=").append(picture);
        sb.append(", desc=").append(desc);
        sb.append(", delFlag=").append(delFlag);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}