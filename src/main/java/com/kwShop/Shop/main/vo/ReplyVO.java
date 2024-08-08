package com.kwShop.Shop.main.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyVO {

    private int p_id;
    private int r_no;
    private String r_replyer;
    private String r_reply;
    private Date r_date;
    private Date r_udate;

}
