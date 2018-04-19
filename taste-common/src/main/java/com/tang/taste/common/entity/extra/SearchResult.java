package com.tang.taste.common.entity.extra;

import java.io.Serializable;
import java.util.List;

/**
 * FileName: SearchResult
 * @Author:   16
 * Date:     2018/2/6 18:01
 * Description:搜索数据存储
 */
public class SearchResult implements Serializable {

    private long totalPage;

    private long recordCount;

    private List<SearchDishes> searchDishes;

    public long getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(long totalPage) {
        this.totalPage = totalPage;
    }

    public long getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(long recordCount) {
        this.recordCount = recordCount;
    }

    public List<SearchDishes> getSearchDishes() {
        return searchDishes;
    }

    public void setSearchDishes(List<SearchDishes> searchDishes) {
        this.searchDishes = searchDishes;
    }
}
