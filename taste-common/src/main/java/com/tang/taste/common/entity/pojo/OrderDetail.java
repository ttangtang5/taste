package com.tang.taste.common.entity.pojo;

import java.io.Serializable;

public class OrderDetail implements Serializable {
    private Integer orderId;

    private Integer dishesId;

    private Integer sumNum;

    private Double sumMoney;

    private Double payPrice;

    private Double specialDiscount;

    private Integer delFlag;

    private static final long serialVersionUID = 1L;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getDishesId() {
        return dishesId;
    }

    public void setDishesId(Integer dishesId) {
        this.dishesId = dishesId;
    }

    public Integer getSumNum() {
        return sumNum;
    }

    public void setSumNum(Integer sumNum) {
        this.sumNum = sumNum;
    }

    public Double getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(Double sumMoney) {
        this.sumMoney = sumMoney;
    }

    public Double getPayPrice() {
        return payPrice;
    }

    public void setPayPrice(Double payPrice) {
        this.payPrice = payPrice;
    }

    public Double getSpecialDiscount() {
        return specialDiscount;
    }

    public void setSpecialDiscount(Double specialDiscount) {
        this.specialDiscount = specialDiscount;
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
        OrderDetail other = (OrderDetail) that;
        return (this.getOrderId() == null ? other.getOrderId() == null : this.getOrderId().equals(other.getOrderId()))
            && (this.getDishesId() == null ? other.getDishesId() == null : this.getDishesId().equals(other.getDishesId()))
            && (this.getSumNum() == null ? other.getSumNum() == null : this.getSumNum().equals(other.getSumNum()))
            && (this.getSumMoney() == null ? other.getSumMoney() == null : this.getSumMoney().equals(other.getSumMoney()))
            && (this.getPayPrice() == null ? other.getPayPrice() == null : this.getPayPrice().equals(other.getPayPrice()))
            && (this.getSpecialDiscount() == null ? other.getSpecialDiscount() == null : this.getSpecialDiscount().equals(other.getSpecialDiscount()))
            && (this.getDelFlag() == null ? other.getDelFlag() == null : this.getDelFlag().equals(other.getDelFlag()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getOrderId() == null) ? 0 : getOrderId().hashCode());
        result = prime * result + ((getDishesId() == null) ? 0 : getDishesId().hashCode());
        result = prime * result + ((getSumNum() == null) ? 0 : getSumNum().hashCode());
        result = prime * result + ((getSumMoney() == null) ? 0 : getSumMoney().hashCode());
        result = prime * result + ((getPayPrice() == null) ? 0 : getPayPrice().hashCode());
        result = prime * result + ((getSpecialDiscount() == null) ? 0 : getSpecialDiscount().hashCode());
        result = prime * result + ((getDelFlag() == null) ? 0 : getDelFlag().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", orderId=").append(orderId);
        sb.append(", dishesId=").append(dishesId);
        sb.append(", sumNum=").append(sumNum);
        sb.append(", sumMoney=").append(sumMoney);
        sb.append(", payPrice=").append(payPrice);
        sb.append(", specialDiscount=").append(specialDiscount);
        sb.append(", delFlag=").append(delFlag);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}