package com.tang.taste.portal.dao;

import com.tang.taste.common.entity.extra.SearchDishes;
import com.tang.taste.common.entity.extra.SearchResult;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * FileName: SearchDao
 * @Author:   16
 * Date:     2018/2/6 19:43
 * Description:搜索查询
 */
@Repository
public class SearchUtilDao {

    @Autowired
    private SolrServer solrServer;

    public SearchResult getQueryList(SolrQuery query) throws Exception{
        //根据solrqurey对象查询索引库
        QueryResponse queryResponse = solrServer.query(query);
        //取查询结果
        SolrDocumentList solrDocumentList = queryResponse.getResults();
        //取出查询记录总数
        long numFound = solrDocumentList.getNumFound();
        SearchResult searchResult = new SearchResult();
        searchResult.setRecordCount(numFound);
        List<SearchDishes> list = new ArrayList<>();
        //将查询结果封装进入list中
        for (SolrDocument solrDocument:solrDocumentList) {
            SearchDishes item = new SearchDishes();
            item.setId((String) solrDocument.get("id"));
            item.setDishesTypeName((String) solrDocument.get("dishes_type_name"));
            item.setDishesPicture((String) solrDocument.get("dishes_picture"));
            item.setDishesPrice((double) solrDocument.get("dishes_price"));
            //取搜索匹配高亮信息    返回结构可以看solr服务器上结构
            Map<String, Map<String, List<String>>> highlighting = queryResponse.getHighlighting();
            List<String> list2 = highlighting.get(solrDocument.get("id")).get("dishes_name");
            String title = "";
            //判断有无高亮信息
            if (list2 != null && list2.size() > 0) {
                title = list2.get(0);
            } else {
                title = (String) solrDocument.get("dishes_name");
            }
            item.setDishesName(title);
            //添加到商品列表
            list.add(item);
        }
        //把结果添加到SearchResult中
        searchResult.setSearchDishes(list);
        //返回
        return searchResult;
    }
}
