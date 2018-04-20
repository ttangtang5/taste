package com.tang.taste.portal.controller;

import com.tang.taste.common.entity.extra.SearchDishes;
import com.tang.taste.common.entity.extra.SearchResult;
import com.tang.taste.portal.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * FileName: searchController
 * @Author:   16
 * Date:     2018/2/6 19:24
 * Description:搜索控制层
 */
@Controller
@RequestMapping("search")
public class SearchController {

    @Autowired
    private SearchService searchService;

    @Value("${SEARCH_PAGE_SIZE}")
    private Integer pageSize;
    /**
     * 搜索框
     * @param keyWords
     * @param page
     * @return
     */
    @RequestMapping("")
    public String  getSearchResult(Model model, @RequestParam(value="word") String keyWords, @RequestParam(defaultValue = "1") Integer page) throws Exception{
        //无搜索内容 直接去数据库查找
        if(keyWords == null || keyWords == ""){
            long count = searchService.countAllQueryResult();
            List<SearchDishes> list = searchService.getAllQueryResult(page);
            model.addAttribute("query",keyWords);
            model.addAttribute("totalPages",count);
            model.addAttribute("itemList",list);
            model.addAttribute("page",page);
        }else{
            keyWords = new String(keyWords.getBytes("iso-8859-1"),"utf-8");
            SearchResult searchResult = searchService.getQueryResult(keyWords,page,pageSize);
            model.addAttribute("query",keyWords);
            model.addAttribute("totalPages",searchResult.getTotalPage());
            model.addAttribute("itemList",searchResult.getSearchDishes());
            model.addAttribute("page",page);
        }
        return "/portal/shop_product_list";
    }

    /**
     * 将菜品内容加入搜索库
     * @return
     * @throws Exception
     */
    @RequestMapping("addDishesIndex")
    @ResponseBody
    public String getSearchContent() throws Exception{
       return searchService.getSearchContent();
    }

    /**
     * 跳转各分类列表
     * @param model
     * @param categoryId
     * @param page
     * @return
     */
    @RequestMapping("toCategoryList")
    public String toCategory(Model model,int categoryId, @RequestParam(defaultValue = "1") Integer page){
        long count = searchService.countDishesByCategoryId(categoryId);
        List<SearchDishes> list = searchService.selectDishesByCategoryId(categoryId,page);
        model.addAttribute("query","");
        model.addAttribute("totalPages",count);
        model.addAttribute("itemList",list);
        model.addAttribute("page",page);
        return "/portal/shop_category_list";
    }

}
