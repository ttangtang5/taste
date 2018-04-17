package com.tang.taste.portal.service;

import com.taotao.search.dao.SearchItemDao;
import com.taotao.search.dao.SearchUtilDao;
import com.taotao.search.service.ISearchService;
import easyUI.SearchItem;
import easyUI.SearchResult;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * FileName: SearchServiceImpl
 * @Author:   16
 * Date:     2018/2/6 10:40
 * Description:搜索实现类
 */
@Service
public class SearchService  {

    @Autowired
    private SearchItemDao searchItemDao;

    @Resource(name="searchUtilDao")
    private SearchUtilDao searchUtilDao;

    @Autowired
    private SolrServer solrServer;

    /**
     * 将信息添加进索引库
     * @return
     */
    @Override
    public String getSearchContent() {
        List<SearchItem> list = null;
        try {
            //查找处索引数据
            list = searchItemDao.getSearchContent();
            //遍历商品数据添加到索引库
            for (SearchItem searchItem:list) {
                //创建文档对象SolrInputDocument
                SolrInputDocument solrInputDocument = new SolrInputDocument();
                //向文档添加域
                solrInputDocument.addField("id",searchItem.getId());
                solrInputDocument.addField("item_title", searchItem.getItemTitle());
                solrInputDocument.addField("item_sell_point", searchItem.getItemSellPoint());
                solrInputDocument.addField("item_price", searchItem.getItemPrice());
                solrInputDocument.addField("item_image", searchItem.getItemImage());
                solrInputDocument.addField("item_category_name", searchItem.getItemCategoryName());
                solrInputDocument.addField("item_desc", searchItem.getItemDesc());
                //添加入solrServer 写入索引库
                solrServer.add(solrInputDocument);
            }
            //提交操作
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        return "success";
    }

    /**
     * 通过搜索内容搜索索引库信息
     * @param keyWords
     * @param page
     * @param pageSize
     * @return
     */
    @Override
    public SearchResult getQueryResult(String keyWords,Integer page,Integer pageSize) throws Exception {
        //创建solrQuery对象
        SolrQuery solrQuery = new SolrQuery();
        //设置查询条件
        solrQuery.setQuery(keyWords);
        //设置分页条件
        if(page < 1) {page = 1;}
        //起始0开始
        solrQuery.setStart((page-1)*pageSize);
        if(pageSize < 1){ pageSize = 10;};
        solrQuery.setRows(pageSize);
        //设置默认的搜索域
        solrQuery.set("df","item_title");
        //设置高亮
        solrQuery.setHighlight(true);
        solrQuery.addHighlightField("item_title");
        solrQuery.setHighlightSimplePre("<font color='red'>");
        solrQuery.setHighlightSimplePost("</font>");
        //执行查询语句
        SearchResult searchResult = searchUtilDao.getQueryList(solrQuery);
        //计算查询结果的总页数
        long recordCount = searchResult.getRecordCount();
        long pages =  (recordCount+pageSize-1) / pageSize;
        searchResult.setTotalPage(pages);
        //返回结果集
        return searchResult;
    }
}
