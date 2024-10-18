package com.kwShop.Shop.admin.vo;

import lombok.Data;

@Data
public class CategoryVO {

    private int tier; // 카테고리 등급
    private String cateName;  // 카테고리 이름
    private String cateCode; // 카테고리코드
    private String cateParent; // 상위 카테고리
}
