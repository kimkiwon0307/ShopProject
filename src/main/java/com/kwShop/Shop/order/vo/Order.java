package com.kwShop.Shop.order.vo;


import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Data
public class Order {

    private int id; // 주문번호(PK)
    private int member_id; // 회원 아이디
    private LocalDateTime orderDate; // 주문 날짜 및 시간
    private String status; // 주문 상태
    private List<OrderItem> orderItesList; // 주문 항목 리스트

}
