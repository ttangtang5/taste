package com.tang.taste.manage.service;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tang.taste.common.entity.extra.SearchDishes;
import com.tang.taste.common.entity.pojo.Dishes;
import com.tang.taste.common.entity.pojo.DishesExample;
import com.tang.taste.manage.dao.DishesDao;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * FileName: DishseService
 * @Author:   16
 * Date:     2018/4/22 16:11
 * Description:菜品业务逻辑
 */
@Service
public class DishesService {

    @Autowired
    private DishesDao dishesDao;

    @Autowired
    private SolrServer solrServer;
    @Value("${PAGE_SIZE}")
    private int pageSize;
    /**
     * 通过分类id查询不分页
     * @param categoryId
     * @return
     */
    public List<Dishes> selectDishes(int categoryId){
       return dishesDao.selectDishes(categoryId);
    }

    /**
     * 后台菜品列表
     * @param findsContent
     * @param page
     * @return
     */
    public List<Dishes> selectDishesMange(String findsContent,int page){
        return dishesDao.selectDishesMange(findsContent,pageSize*(page-1),pageSize);
    }

    /**
     * 统计数量
     * @param findsContent
     * @return
     */
    public long countDishesMange(String findsContent){
        return dishesDao.countDishesMange(findsContent);
    }

    /**
     * 添加菜品
     * @param dishes
     * @return
     */
    public String addDishes(Dishes dishes){
        Map map = Maps.newHashMap();
        DishesExample dishesExample = new DishesExample();
        DishesExample.Criteria criteria = dishesExample.createCriteria();
        criteria.andDishesNameEqualTo(dishes.getDishesName());
        criteria.andDelFlagEqualTo(0);
        List<Dishes> exit = dishesDao.selectByExample(dishesExample);
        if(exit == null || exit.size() < 1 ){
            int num = dishesDao.insertSelective(dishes);
            if(num == 1){
                try {
                        //遍历商品数据添加到索引库
                        //创建文档对象SolrInputDocument
                        SolrInputDocument solrInputDocument = new SolrInputDocument();
                        //向文档添加域
                        solrInputDocument.addField("id", dishes.getId());
                        solrInputDocument.addField("dishes_name", dishes.getDishesName());
                        solrInputDocument.addField("dishes_price", dishes.getDishesPrice());
                        solrInputDocument.addField("dishes_picture", dishes.getPicture());
                        solrInputDocument.addField("dishes_type_name", dishes.getDishesTypeName());
                        solrInputDocument.addField("dishes_desc", dishes.getDesc());
                        //添加入solrServer 写入索引库
                        solrServer.add(solrInputDocument);
                    //提交操作
                    solrServer.commit();
                } catch (Exception e) {
                    e.printStackTrace();
                    map.put("status", "error");
                    map.put("message", "添加失败！");
                    return JSON.toJSONString(map);
                }
                map.put("status", "success");
                map.put("message", "添加成功！");
                return JSON.toJSONString(map);
            }
        }
        map.put("status", "error");
        map.put("message", "添加失败！");
        return JSON.toJSONString(map);
    }

    /**
     * 更新图片
     * @param dishesName
     * @param picture
     * @return
     */
    public int updatePicture(String dishesName,String picture){
        Dishes dishes = new Dishes();
        dishes.setPicture(picture);
        DishesExample dishesExample = new DishesExample();
        dishesExample.createCriteria().andDishesNameEqualTo(dishesName);
       return dishesDao.updateByExampleSelective(dishes, dishesExample);
    }

    public String delDishes(String ids){
        Map map =Maps.newHashMap();
        if(ids != null && ids != ""){
            DishesExample dishesExample = new DishesExample();
            DishesExample.Criteria criteria = dishesExample.createCriteria();
            String[] id = ids.split(",");
            List<Integer> list = Lists.newArrayList();
            for (String str : id) {
                list.add(Integer.valueOf(str));
            }
            criteria.andIdIn(list);
            Dishes dishes = new Dishes();
            dishes.setDelFlag(1);
            dishesDao.updateByExampleSelective(dishes, dishesExample);
            map.put("status", "success");
            map.put("message", "下架成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "error");
        map.put("message", "下架失败！");
        return JSON.toJSONString(map);
    }

    public String putawayDishes(String ids){
        Map map =Maps.newHashMap();
        if(ids != null && ids != ""){
            DishesExample dishesExample = new DishesExample();
            DishesExample.Criteria criteria = dishesExample.createCriteria();
            String[] id = ids.split(",");
            List<Integer> list = Lists.newArrayList();
            for (String str : id) {
                list.add(Integer.valueOf(str));
            }
            criteria.andIdIn(list);
            Dishes dishes = new Dishes();
            dishes.setDelFlag(0);
            dishesDao.updateByExampleSelective(dishes, dishesExample);
            map.put("status", "success");
            map.put("message", "上架成功！");
            return JSON.toJSONString(map);
        }
        map.put("status", "error");
        map.put("message", "上架失败！");
        return JSON.toJSONString(map);
    }


    public List<Dishes> selectAllDishes(){
        DishesExample dishesExample = new DishesExample();
        dishesExample.createCriteria().andDelFlagEqualTo(0);
        return dishesDao.selectByExample(dishesExample);
    }

    public Dishes selectDishesById(int id){
        return dishesDao.selectByPrimaryKey(id);
    }
}
