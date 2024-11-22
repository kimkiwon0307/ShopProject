package com.kwShop.Shop.order.service;

import com.kwShop.Shop.order.mapper.OrderMapper;
import com.kwShop.Shop.order.vo.Order;
import com.kwShop.Shop.order.vo.OrderItem;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{

    private final OrderMapper mapper;


    @Transactional
    @Override
    public void insertOrder(Order order) throws Exception {

        System.out.println("order.getOrder_id() = " + order.getOrder_id());
        
        mapper.insertOrder(order);

        System.out.println("order.getOrder_id() = " + order.getOrder_id());

        List<OrderItem> orderItemList = order.getOrderItemList();

        if (orderItemList != null && !orderItemList.isEmpty()) {
            // OrderItem에 orderId를 추가한 후 삽입
            for (OrderItem item : orderItemList) {
                item.setOrder_id(order.getOrder_id()); // 주문 아이디 세팅
            }
            // 여러 개의 OrderItem을 DB에 삽입
            mapper.insertOrderItems(orderItemList);
        }

    }

    @Override
    public List<Order> orderedList(String member_id) throws Exception {
        return mapper.orderList("admin");
    }

}
