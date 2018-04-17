package com.tang.taste.common.entity.extra;

import java.io.Serializable;

/**
 * FileName: SearchItem
 * @Author:   16
 * Date:     2018/2/6 10:21
 * Description:搜索实体类  推送solr服务器
 */
public class SearchItem implements Serializable {

    private String id;

    private String itemTitle;

    private String itemSellPoint;

    private long itemPrice;

    private String itemImage;

    private String itemCategoryName;

    private String itemDesc;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getItemTitle() {
        return itemTitle;
    }

    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }

    public String getItemSellPoint() {
        return itemSellPoint;
    }

    public void setItemSellPoint(String itemSellPoint) {
        this.itemSellPoint = itemSellPoint;
    }

    public long getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(long itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getItemImage() {
        return itemImage;
    }

    public void setItemImage(String itemImage) {
        this.itemImage = itemImage;
    }

    public String getItemCategoryName() {
        return itemCategoryName;
    }

    public void setItemCategoryName(String itemCategoryName) {
        this.itemCategoryName = itemCategoryName;
    }

    public String getItemDesc() {
        return itemDesc;
    }

    public void setItemDesc(String itemDesc) {
        this.itemDesc = itemDesc;
    }

}
