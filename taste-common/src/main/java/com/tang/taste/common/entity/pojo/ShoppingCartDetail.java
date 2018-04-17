package com.tang.taste.common.entity.pojo;

import com.tang.taste.common.entity.extra.ShoppingCartDetailExtra;

import java.io.Serializable;

public class ShoppingCartDetail extends ShoppingCartDetailExtra implements Serializable {
    private Integer cartId;

    private Integer dishesId;

    private Integer num;

    private Integer status;

    private static final long serialVersionUID = 1L;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getDishesId() {
        return dishesId;
    }

    public void setDishesId(Integer dishesId) {
        this.dishesId = dishesId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
        ShoppingCartDetail other = (ShoppingCartDetail) that;
        return (this.getCartId() == null ? other.getCartId() == null : this.getCartId().equals(other.getCartId()))
            && (this.getDishesId() == null ? other.getDishesId() == null : this.getDishesId().equals(other.getDishesId()))
            && (this.getNum() == null ? other.getNum() == null : this.getNum().equals(other.getNum()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCartId() == null) ? 0 : getCartId().hashCode());
        result = prime * result + ((getDishesId() == null) ? 0 : getDishesId().hashCode());
        result = prime * result + ((getNum() == null) ? 0 : getNum().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", cartId=").append(cartId);
        sb.append(", dishesId=").append(dishesId);
        sb.append(", num=").append(num);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}