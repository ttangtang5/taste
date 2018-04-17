/**
 * Copyright &copy; 2012-2014 JeeSystem All rights reserved.
 */
package com.tang.taste.common.entity.extra;

import java.util.List;
import java.util.Map;

/**
 * 
 * <p>Description: 分页类</p>
 * @param <T>
 */
public class PageHelper<T> {
	    protected Long total;
	    protected List<T> rows;
	    protected String search;
	    protected String sort;
	    protected Map<String,Object> queryMap;
	    protected int limit=10;
	    protected int pageSize=10;
	    protected int offset = 0;
	    protected String order ="desc" ;
	    
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.limit=pageSize;
			this.pageSize = pageSize;
		}
		public String getSort() {
			return sort;
		}
		public void setSort(String sort) {
			this.sort = sort;
		}
		public String getSearch() {
			return search;
		}
		public void setSearch(String search) {
			this.search = search;
		}
		public Map<String, Object> getQueryMap() {
			return queryMap;
		}
		public void setQueryMap(Map<String, Object> queryMap) {
			this.queryMap = queryMap;
		}
		public Long getTotal() {
			return total;
		}

		public void setTotal(Long total) {
			this.total = total;
		}

		public List<T> getRows() {
			return rows;
		}

		public void setRows(List<T> rows) {
			this.rows = rows;
		}

		public int getLimit() {
			return limit;
		}

		public void setLimit(int limit) {
			this.limit = limit;
		}

		public int getOffset() {
			return offset;
		}

		public void setOffset(int offset) {
			this.offset = offset;
		}

		public String getOrder() {
			return order;
		}

		public void setOrder(String order) {
			this.order = order;
		}

}
