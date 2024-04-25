package com.kwShop.Shop.admin.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ProductVO {

    private int p_id;              //상품 아이디
    private String p_name;         // 상품명
    private String p_price;       // 상품 가격
    private String p_title;      // 상품 등록 제목
    private String p_content;    // 상품 등록 내용
    private Date p_date;         // 상품 등록날짜
    private Date p_udate;         // 상품 수정 날짜
    private String p_cateCode;    // 카테고리 코드
    private int p_count;          // 상품 갯수

    private String attachUuid;
    private String attachUploadPath;
    private String attachFilename;


    private List<AttachImageVO> attachList; // 상품 이미지 리스트


}