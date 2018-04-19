package com.tang.taste.manage.dao;

import com.tang.taste.common.dao.DishesMapper;
import com.tang.taste.common.entity.extra.PageHelper;
import com.tang.taste.common.entity.extra.SearchDishes;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * FileName: DishesDao
 * @Author:   16
 * Date:     2018/4/16 13:30
 * Description:菜品持久层
 */
public interface DishesDao extends DishesMapper{

    /**
     * 查找出所有菜品信息
     * @return
     */
    public List<SearchDishes> getSearchContent();

    /**
     * 无搜索信息  分页查询
     * @param offset
     * @param limit
     * @return
     */
    public List<SearchDishes> getAllSearchContent(@Param("offset") int offset,@Param("limit") int limit);

    /**
     * 统计无搜索信息  分页查询
     * @return
     */
    public long countAllSearchContent();

    /**
     * 通过分类id查询 分页
     * @param categoryId
     * @param offset
     * @param limit
     * @return
     */
    public List<SearchDishes>  selectDishesByCategoryId(@Param("categoryId") int categoryId,@Param("offset") int offset,@Param("limit") int limit);

    /**
     *统计类型为categoryId代理数量
     * @param categoryId
     * @return
     */
    public long countDishesByCategoryId(int categoryId);
}
