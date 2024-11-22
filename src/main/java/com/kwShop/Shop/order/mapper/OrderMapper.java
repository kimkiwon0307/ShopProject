package com.kwShop.Shop.order.mapper;

import com.kwShop.Shop.order.vo.Order;
import com.kwShop.Shop.order.vo.OrderItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {

    public void insertOrder(Order order);

    public void insertOrderItems(List<OrderItem> orderItems);



}
