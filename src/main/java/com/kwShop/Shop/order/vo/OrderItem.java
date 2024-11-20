package com.kwShop.Shop.order.vo;


import lombok.Data;

import java.math.BigDecimal;

@Data
public class OrderItem {

    private int id; // 아이템 ID
    private int orderId; // 주문 ID (Order 클래스와 연결)
    private int productId; // 상품 ID
    private String productName; // 상품명 (선택 사항)
    private BigDecimal price; // 상품 단가
    private int quantity; // 수량
    private BigDecimal totalPrice; // 총 결제 금액 (price * quantity)

}
