package com.kwShop.Shop.order.vo;


import com.kwShop.Shop.admin.vo.ProductVO;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Data
public class Order {

    private int order_id; // 주문번호(PK)
    private String member_id; // 회원 아이디
    private List<OrderItem> orderItemList; // 주문 항목 리스트
    private LocalDateTime order_date; // 주문 날짜 및 시간
}
