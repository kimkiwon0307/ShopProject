package com.kwShop.Shop.member.vo;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class Criteria {

    private int pageNum; // 현재 페이지 번호
    private int amount;  // 페이지 표시 갯수
    private int offset;  // 가져올 갯수 시작 번호
    private String type; // 검색 타입
    private String keyword; // 검색 키워드

    public Criteria(){
        this(1,10); // 1페이지 10명 회원씩 나오도록
    }
    public Criteria(int pageNum, int amount){
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
