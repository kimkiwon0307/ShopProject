package com.kwShop.Shop.admin.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ProductVO {

    private int p_id;              // 상품 아이디
    private String p_name;         // 상품명
    private String p_price;       //  상품 가격
    private String p_title;      //   상품 등록 제목
    private String p_content;    //   상품 등록 내용
    private Date p_date;         //   상품 등록날짜
    private Date p_udate;         //  상품 수정 날짜
    private int p_quantity;        // 상품 갯수

    private String p_categoryCode; // 상품 카테고리
    private double p_discount; // 상품 할인 확률

    private String attachUuid;
    private String attachUploadPath;
    private String attachFilename;

    private String p_categoryName; // 상품 분류

    private List<AttachImageVO> attachList; // 상품 이미지 리스트


}
