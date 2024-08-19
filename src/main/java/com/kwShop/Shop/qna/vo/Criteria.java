package com.kwShop.Shop.qna.vo;

import lombok.Data;

@Data
public class Criteria {

    private int pageNum;
    private int amount;

    // 검색을 위해 추가
    private String type;
    private String keyword;
    private int offset;  // 가져올 갯수 시작 번호

    public Criteria(){
        this(1,10);
    }

    public Criteria(int pageNum, int amount){
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public String[] getTypeArr(){
        return type == null? new String[] {}: type.split("");
    }

}
