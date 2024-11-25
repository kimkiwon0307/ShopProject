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
    private Date order_date; // 주문 날짜 및 시간
    private boolean order_status; // 주문상태
    // left 조인으로 가져온 필드

    // order_item
    private int orderItem_id; // 아이템 ID
    private int product_id; // 상품 ID
    private String product_name; // 상품명 (선택 사항)
    private int product_quantity; // 수량
    private BigDecimal product_price; // 상품 단가
    private BigDecimal product_discount; // 상품 할인율
    private BigDecimal totalPrice; // 총 결제 금액

    // tbl_attach 테이블
    private String uploadPath;
    private String uuid;
    private String fileName;

    // 장바구니 아이디
    private List<Integer> b_id;
}
