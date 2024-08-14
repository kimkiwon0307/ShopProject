package com.kwShop.Shop.qna.vo;

import lombok.Data;

import java.util.Date;

@Data
public class QnaVO {

    private int q_no;
    private String q_title;
    private String q_content;
    private String q_writer;
    private Date q_date;
    private Date q_udate;
    private boolean q_status;
    private int q_count;

}
