package com.tang.taste.portal.service;

import com.google.common.collect.Lists;
import com.tang.taste.common.entity.extra.SearchDishes;
import com.tang.taste.common.entity.extra.SearchResult;
import com.tang.taste.manage.dao.DishesDao;
import com.tang.taste.portal.dao.SearchUtilDao;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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
    private DishesDao dishesDao;
    @Autowired
    private SearchUtilDao searchUtilDao;

    @Autowired
    private SolrServer solrServer;

    @Value("${SEARCH_PAGE_SIZE}")
    private Integer pageSize;
    /**
     * 将信息添加进索引库
     * @return
     */

    public String getSearchContent() {
        List<SearchDishes> list = Lists.newArrayList();
        try {
            //查找处索引数据
            list = dishesDao.getSearchContent();
            //遍历商品数据添加到索引库
            for (SearchDishes searchDishes :list) {
                //创建文档对象SolrInputDocument
                SolrInputDocument solrInputDocument = new SolrInputDocument();
                //向文档添加域
                solrInputDocument.addField("id", searchDishes.getId());
                solrInputDocument.addField("dishes_name", searchDishes.getDishesName());
                solrInputDocument.addField("dishes_price", searchDishes.getDishesPrice());
                solrInputDocument.addField("dishes_picture", searchDishes.getDishesPicture());
                solrInputDocument.addField("dishes_type_name", searchDishes.getDishesTypeName());
                solrInputDocument.addField("dishes_desc", searchDishes.getDishesDesc());
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
        solrQuery.set("df","dishes_name");
        //设置高亮
        solrQuery.setHighlight(true);
        solrQuery.addHighlightField("dishes_name");
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

    /**
     * 无搜索内容  返回搜索结果
     * @param page  第几页
     * @return
     * @throws Exception
     */
    public List<SearchDishes> getAllQueryResult(int page) throws Exception{
        List<SearchDishes> list = dishesDao.getAllSearchContent(pageSize*(page-1),pageSize);
        return list;
    }

    /**
     *无搜索内容  统计条数
     * @return
     */
    public long countAllQueryResult(){
      long count = dishesDao.countAllSearchContent();
        return count;
    }

    /**
     * 通过分类id查找
     * @param categoryId
     * @param page
     * @return
     */
    public List<SearchDishes> selectDishesByCategoryId(int categoryId,int page){
        return  dishesDao.selectDishesByCategoryId(categoryId,pageSize*(page-1),pageSize);
    }

    /**
     * 统计分类id的商品数量
     * @param categoryId
     * @return
     */
    public long countDishesByCategoryId(int categoryId){
        long count = dishesDao.countDishesByCategoryId(categoryId);
        return count;
    }
}
