package com.tang.taste.common.entity.pojo;

import com.tang.taste.common.entity.extra.OrderExtra;

import java.io.Serializable;
import java.util.Date;

public class Order extends OrderExtra implements Serializable {
    private Integer orderId;

    private Integer userId;

    private String receiver;

    private String address;

    private String phone;

    private Integer num;

    private Double sumNum;

    private Integer empId;

    private Date createTime;

    private Integer paymentType;

    private Integer status;

    private Date updateTime;

    private Date paymentTime;

    private Date consignTime;

    private Date endTime;

    private Date closeTime;

    private String buyerMessage;

    private Integer rateLevel;

    private String ratePicture;

    private String rateContent;

    private Integer delFlag;

    private static final long serialVersionUID = 1L;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Double getSumNum() {
        return sumNum;
    }

    public void setSumNum(Double sumNum) {
        this.sumNum = sumNum;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Date getConsignTime() {
        return consignTime;
    }

    public void setConsignTime(Date consignTime) {
        this.consignTime = consignTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    public String getBuyerMessage() {
        return buyerMessage;
    }

    public void setBuyerMessage(String buyerMessage) {
        this.buyerMessage = buyerMessage;
    }

    public Integer getRateLevel() {
        return rateLevel;
    }

    public void setRateLevel(Integer rateLevel) {
        this.rateLevel = rateLevel;
    }

    public String getRatePicture() {
        return ratePicture;
    }

    public void setRatePicture(String ratePicture) {
        this.ratePicture = ratePicture;
    }

    public String getRateContent() {
        return rateContent;
    }

    public void setRateContent(String rateContent) {
        this.rateContent = rateContent;
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
        Order other = (Order) that;
        return (this.getOrderId() == null ? other.getOrderId() == null : this.getOrderId().equals(other.getOrderId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getReceiver() == null ? other.getReceiver() == null : this.getReceiver().equals(other.getReceiver()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
            && (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
            && (this.getNum() == null ? other.getNum() == null : this.getNum().equals(other.getNum()))
            && (this.getSumNum() == null ? other.getSumNum() == null : this.getSumNum().equals(other.getSumNum()))
            && (this.getEmpId() == null ? other.getEmpId() == null : this.getEmpId().equals(other.getEmpId()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getPaymentType() == null ? other.getPaymentType() == null : this.getPaymentType().equals(other.getPaymentType()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
            && (this.getPaymentTime() == null ? other.getPaymentTime() == null : this.getPaymentTime().equals(other.getPaymentTime()))
            && (this.getConsignTime() == null ? other.getConsignTime() == null : this.getConsignTime().equals(other.getConsignTime()))
            && (this.getEndTime() == null ? other.getEndTime() == null : this.getEndTime().equals(other.getEndTime()))
            && (this.getCloseTime() == null ? other.getCloseTime() == null : this.getCloseTime().equals(other.getCloseTime()))
            && (this.getBuyerMessage() == null ? other.getBuyerMessage() == null : this.getBuyerMessage().equals(other.getBuyerMessage()))
            && (this.getRateLevel() == null ? other.getRateLevel() == null : this.getRateLevel().equals(other.getRateLevel()))
            && (this.getRatePicture() == null ? other.getRatePicture() == null : this.getRatePicture().equals(other.getRatePicture()))
            && (this.getRateContent() == null ? other.getRateContent() == null : this.getRateContent().equals(other.getRateContent()))
            && (this.getDelFlag() == null ? other.getDelFlag() == null : this.getDelFlag().equals(other.getDelFlag()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getOrderId() == null) ? 0 : getOrderId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getReceiver() == null) ? 0 : getReceiver().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getNum() == null) ? 0 : getNum().hashCode());
        result = prime * result + ((getSumNum() == null) ? 0 : getSumNum().hashCode());
        result = prime * result + ((getEmpId() == null) ? 0 : getEmpId().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getPaymentType() == null) ? 0 : getPaymentType().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getPaymentTime() == null) ? 0 : getPaymentTime().hashCode());
        result = prime * result + ((getConsignTime() == null) ? 0 : getConsignTime().hashCode());
        result = prime * result + ((getEndTime() == null) ? 0 : getEndTime().hashCode());
        result = prime * result + ((getCloseTime() == null) ? 0 : getCloseTime().hashCode());
        result = prime * result + ((getBuyerMessage() == null) ? 0 : getBuyerMessage().hashCode());
        result = prime * result + ((getRateLevel() == null) ? 0 : getRateLevel().hashCode());
        result = prime * result + ((getRatePicture() == null) ? 0 : getRatePicture().hashCode());
        result = prime * result + ((getRateContent() == null) ? 0 : getRateContent().hashCode());
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
        sb.append(", userId=").append(userId);
        sb.append(", receiver=").append(receiver);
        sb.append(", address=").append(address);
        sb.append(", phone=").append(phone);
        sb.append(", num=").append(num);
        sb.append(", sumNum=").append(sumNum);
        sb.append(", empId=").append(empId);
        sb.append(", createTime=").append(createTime);
        sb.append(", paymentType=").append(paymentType);
        sb.append(", status=").append(status);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", paymentTime=").append(paymentTime);
        sb.append(", consignTime=").append(consignTime);
        sb.append(", endTime=").append(endTime);
        sb.append(", closeTime=").append(closeTime);
        sb.append(", buyerMessage=").append(buyerMessage);
        sb.append(", rateLevel=").append(rateLevel);
        sb.append(", ratePicture=").append(ratePicture);
        sb.append(", rateContent=").append(rateContent);
        sb.append(", delFlag=").append(delFlag);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}