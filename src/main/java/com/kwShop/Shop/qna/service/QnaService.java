package com.kwShop.Shop.qna.service;

import com.kwShop.Shop.qna.vo.Criteria;
import com.kwShop.Shop.qna.vo.QnaVO;

import java.util.List;

public interface QnaService {

    public List<QnaVO> getList() throws Exception;
    public void insert(QnaVO qnaVO) throws Exception;
    public QnaVO get(int q_no) throws Exception;
    public int update(QnaVO qnaVO) throws Exception;
    public int delete(int q_no) throws Exception;

    public List<QnaVO> getList(Criteria cri);

    public int getTotal(Criteria cri);

}
