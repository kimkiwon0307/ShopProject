package com.kwShop.Shop.order.vo;


import lombok.Data;

import java.math.BigDecimal;

@Data
public class OrderItem {

    private int orderItem_id; // 아이템 ID
    private int order_id; // 주문 ID (Order 클래스와 연결)

    private int product_id; // 상품 ID
    private String product_name; // 상품명 (선택 사항)
    private int product_quantity; // 수량

    private BigDecimal product_price; // 상품 단가
    private BigDecimal product_discount; // 상품 할인율
    private BigDecimal totalPrice; // 총 결제 금액


}
