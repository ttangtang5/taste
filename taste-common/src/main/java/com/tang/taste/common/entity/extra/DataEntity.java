package com.tang.taste.common.entity.extra;

import java.util.Date;

/**
 * 数据Entity类
 * @author zky
 */
public class DataEntity {

    private Long createBy;
    private Date createTime;
    private Long updateBy;
    private Date updateTime;

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Long updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 插入之前执行方法，需要手动调用
     */
    public void preInsert(Long userId){
        this.setCreateBy(userId);
        this.setUpdateBy(userId);
        this.setCreateTime(new Date());
        this.setUpdateTime(new Date());
    }

    /**
     * 更新之前执行方法，需要手动调用
     */
    public void preUpdate(Long userId){
        this.setUpdateBy(userId);
        this.setUpdateTime(new Date());
    }
}
