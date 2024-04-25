package com.kwShop.Shop.admin.vo;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class Criteria {

    private int pageNum;
    private int amount;
    private int offset;
    private String type; // 검색 타입
    private String keyword; // 검색 키워드


    public Criteria(){
        this(1,12);
        log.info("기본생성자");
    }
    public Criteria(int pageNum, int amount){
        log.info("생성자");
        this.pageNum = pageNum;
        this.amount = amount;
    }



    // 검색 타입 배열 변환
    public String[] getTypeArr() {
        return type == null? new String[]{} : type.split("");
    }


}
