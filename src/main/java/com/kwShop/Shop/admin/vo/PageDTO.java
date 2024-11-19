package com.kwShop.Shop.admin.vo;

import lombok.Data;

@Data
public class PageDTO {

    private int pageStart; //페이지 시작 번호
    private int pageEnd;  // 페이지 끝 번호
    private boolean next, prev; // 버튼 존재 유무
    private int total; // 전체 갯수
    private Criteria cri;

    public PageDTO(Criteria cri, int total) {
        this.cri = cri;
        this.total = total;
        this.pageEnd = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
        this.pageStart = this.pageEnd - 9;
        int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount()));
        if(realEnd < pageEnd) {
            this.pageEnd = realEnd;
        }
        this.prev = this.pageStart > 1;
        this.next = this.pageEnd < realEnd;
    }
}
