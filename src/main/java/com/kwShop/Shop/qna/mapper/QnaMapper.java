package com.kwShop.Shop.qna.mapper;

import com.kwShop.Shop.qna.vo.Criteria;
import com.kwShop.Shop.qna.vo.QnaVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QnaMapper {
    public void insert(QnaVO qnaVO);
    public List<QnaVO> getList();
    public QnaVO get(int q_no);
    public int update(QnaVO qnaVO);
    public int delete(int q_no);
    public void count(int q_no);
    public List<QnaVO> getListWithPaging(Criteria cri);

}
