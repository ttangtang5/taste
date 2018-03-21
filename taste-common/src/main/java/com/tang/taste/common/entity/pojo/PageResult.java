package com.tang.taste.common.entity.pojo;

import java.io.Serializable;

/**
 *
 * @author zky
 * @date 2018/1/5
 * 返回页面结果，通常是提示消息
 */
public class PageResult implements Serializable {
    /**
     * 响应业务状态
      */
    private Integer status;

    /**
     * 响应消息
     */
    private String msg;

    /**
     * 响应中的数据
      */
    private Object data;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
    public static PageResult build(Integer status, String msg, Object data) {
        return new PageResult(status, msg, data);
    }

    public static PageResult ok(Object data) {
        return new PageResult(data);
    }

    public static PageResult ok() {
        return new PageResult(null);
    }

    public PageResult() {

    }

    public static PageResult build(Integer status, String msg) {
        return new PageResult(status, msg, null);
    }

    public PageResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public PageResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }
}
