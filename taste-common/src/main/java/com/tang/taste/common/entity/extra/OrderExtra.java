package com.tang.taste.common.entity.extra;

/**
 * FileName: OrderExtra
 * @Author:   16
 * Date:     2018/4/19 14:45
 * Description: 订单扩展类
 */
public class OrderExtra {

    private String empName;

    private String empPhone;

    private String createTimeStr;

    private String userName;

    private String[] ratePictureArr;

    public String[] getRatePictureArr() {
        return ratePictureArr;
    }

    public void setRatePictureArr(String[] ratePictureArr) {
        this.ratePictureArr = ratePictureArr;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpPhone() {
        return empPhone;
    }

    public void setEmpPhone(String empPhone) {
        this.empPhone = empPhone;
    }
}
