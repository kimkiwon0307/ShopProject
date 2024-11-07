package com.kwShop.Shop.order.vo;


import lombok.Data;

import java.math.BigDecimal;

@Data
public class OrderItem {

    private int id;
    private int order_id; // 주문 ID
    private int product_id; // 상품 id
    private int quantity; // 주문 수량
    private BigDecimal price; // 상품 가격

}
