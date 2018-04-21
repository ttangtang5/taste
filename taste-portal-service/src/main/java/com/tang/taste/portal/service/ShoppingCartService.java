package com.tang.taste.portal.service;

import com.tang.taste.common.entity.extra.PageHelper;
import com.tang.taste.common.entity.pojo.ShoppingCart;
import com.tang.taste.common.entity.pojo.ShoppingCartDetail;
import com.tang.taste.common.entity.pojo.ShoppingCartDetailExample;
import com.tang.taste.common.entity.pojo.ShoppingCartExample;
import com.tang.taste.portal.dao.ShoppingCartDao;
import com.tang.taste.portal.dao.ShoppingCartDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName: ShoppingCartService
 * @Author:   16
 * Date:     2018/4/16 19:55
 * Description:购物车业务逻辑
 */
@Service
public class ShoppingCartService {

    @Autowired
    private ShoppingCartDao shoppingCartDao;
    @Autowired
    private ShoppingCartDetailDao shoppingCartDetailDao;

    /**
     * 添加购物车
     * @param shoppingCart
     * @return   返回购物车编号
     */
    public int addShoppingCart(ShoppingCart shoppingCart){
        shoppingCartDao.insertSelective(shoppingCart);
        return shoppingCart.getCartId();
    }

    /**
     * 更新购物车
     * @param shoppingCart
     * @param userId
     * @return
     */
    public int updateShoppingCart(ShoppingCart shoppingCart,int userId){
        ShoppingCartExample shoppingCartExample = new ShoppingCartExample();
        shoppingCartExample.createCriteria().andUserIdEqualTo(userId);
        shoppingCartExample.createCriteria().andStatusEqualTo(0);
        shoppingCartDao.updateByExampleSelective(shoppingCart, shoppingCartExample);
        return 1;
    }

    /**
     * 通过cartid 和 dishesId更新数量
     * @param shoppingCartDetail
     */
    public void updateShoppindCartDetail(ShoppingCartDetail shoppingCartDetail){
        shoppingCartDetailDao.updateShoppingCartDetailNum(shoppingCartDetail.getDishesId(),shoppingCartDetail.getCartId());
    }

    /**
     * 添加购物车详情
     * @param shoppingCartDetail
     */
    public void addShoppingCartDetail(ShoppingCartDetail shoppingCartDetail){
        shoppingCartDetailDao.insertSelective(shoppingCartDetail);
    }

    /**
     * 通过userId查找购物车
     * @param userId
     * @return
     */
    public ShoppingCart getShoppingCartByUserId(int userId){
        ShoppingCartExample shoppingCartExample = new ShoppingCartExample();
        shoppingCartExample.createCriteria().andUserIdEqualTo(userId);
        List<ShoppingCart> shoppingCartList = shoppingCartDao.selectByExample(shoppingCartExample);
        if(shoppingCartList != null && shoppingCartList.size() > 0){
            return shoppingCartList.get(0);
        }
        return null;
    }

    /**
     * 通过购物车id查找未结账的商品
     * @param cartId
     * @return
     */
    public List<ShoppingCartDetail> getShoppingCartDetailByCartId(int cartId){
        return shoppingCartDetailDao.selectShoppingCartDetail(cartId);
    }

    /**
     * 通过购物车id统计未结账的商品
     * @param cartId
     * @return
     */
    public long countShoppingCartDetailByCartId(int cartId){
        return shoppingCartDetailDao.countShoppingCartDetail(cartId);
    }


    /**
     * 将cookie中的值插入购物车中
     * @param list
     */
    public void addShoppingDetailList(List<ShoppingCartDetail> list){
        shoppingCartDetailDao.insertShoppingCartDetail(list);
    }

    /**
     * 删除购物车
     * @param cartId
     */
    public void deleteShoppingDetail(int cartId){
        ShoppingCartDetailExample shoppingCartDetailExample = new ShoppingCartDetailExample();
        shoppingCartDetailExample.createCriteria().andCartIdEqualTo(cartId);
        shoppingCartDetailDao.deleteByExample(shoppingCartDetailExample);
    }
}
