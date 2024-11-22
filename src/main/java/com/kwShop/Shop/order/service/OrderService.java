package com.kwShop.Shop.order.service;


import com.kwShop.Shop.order.vo.Order;
import com.kwShop.Shop.order.vo.OrderItem;

import java.util.List;

public interface OrderService {

    public void insertOrder (Order order) throws Exception;

    public List<Order> orderedList(String member_id) throws Exception;


}
