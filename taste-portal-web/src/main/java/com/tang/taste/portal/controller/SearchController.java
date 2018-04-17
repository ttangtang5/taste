package com.tang.taste.portal.controller;

import com.tang.taste.portal.service.SearchService;
import com.taotao.search.service.ISearchService;
import easyUI.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String  getSearchResult(Model model, @RequestParam("word") String keyWords, @RequestParam(defaultValue = "1") Integer page) throws Exception{
        keyWords = new String(keyWords.getBytes("iso-8859-1"),"utf-8");
        SearchResult searchResult = searchService.getQueryResult(keyWords,page,pageSize);
        model.addAttribute("query",keyWords);
        model.addAttribute("totalPages",searchResult.getTotalPage());
        model.addAttribute("itemList",searchResult.getSearchItems());
        model.addAttribute("page",page);
        return "search";
    }
}
