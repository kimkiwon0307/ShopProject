package com.kwShop.Shop.mall.service;

import com.kwShop.Shop.mall.mapper.ReplyMapper;
import com.kwShop.Shop.mall.vo.ReplyVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService{

    private final ReplyMapper mapper;

    public ReplyServiceImpl (ReplyMapper mapper){
        this.mapper = mapper;
    }


    @Override
    public void insert(ReplyVO reply) {
        mapper.insert(reply);
    }

    @Override
    public List<ReplyVO> list(int p_id) {
        return  mapper.list(p_id);
    }

    @Override
    public void update(int r_no, String r_reply) {
        mapper.update(r_no, r_reply);
    }

    @Override
    public void delete(int r_no) {
        mapper.delete(r_no);
    }


}
