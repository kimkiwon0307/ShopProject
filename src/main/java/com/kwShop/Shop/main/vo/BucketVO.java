package com.kwShop.Shop.main.vo;

import lombok.Data;

import java.util.Date;

@Data
public class BucketVO {

    private int b_id;
    private int p_id;
    private int price;
    private String member_id;
    private int quantity;

    // tbl_member 테이블의 열들
    private String member_pw;
    private String member_name;
    private String member_mail;
    private String member_Addr1;
    private String member_Addr2;
    private String member_Addr3;
    private int adminCk;
    private Date regDate;
    private int money;
    private int point;

    // tbl_product 테이블의 열들
    private String p_name;
    private String p_price;
    private String p_title;
    private String p_content;
    private Date p_date;
    private Date p_udate;
    private String p_cateCode;
    private double p_discount; // 상품 할인 확률

    // tbl_attach 테이블
    private String uploadPath;

    /* uuid */
    private String uuid;

    /* 파일 이름 */
    private String fileName;

}
