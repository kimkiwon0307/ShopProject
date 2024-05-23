package com.kwShop.Shop.admin.vo;

import lombok.Data;

@Data
public class CategoryVO {

    private int id; // 카테고리 아이디 1.상의 2.하의 3.아우터 4.원피스 5.속옷
    private String name;  // 카테고리 이름(분류)
    private int parent_id; // 부모 카테고리 아이디

}
