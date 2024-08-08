package com.kwShop.Shop.main.service;

import com.kwShop.Shop.main.vo.ReplyVO;

import java.util.List;

public interface ReplyService {

    public void insert (ReplyVO reply); //등록

    public List<ReplyVO> list(int p_id); // 리스트

    public void update (int r_no, String r_reply); // 수정
    public void delete (int r_no); // 삭제
}
