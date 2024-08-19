package com.kwShop.Shop.qna.service;


import com.kwShop.Shop.qna.mapper.QnaMapper;
import com.kwShop.Shop.qna.vo.Criteria;
import com.kwShop.Shop.qna.vo.QnaVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@AllArgsConstructor
public class QnaServiceImpl implements QnaService{

    private QnaMapper mapper;
    @Override
    public List<QnaVO> getList() throws Exception {
        return mapper.getList();
    }

    @Override
    public void insert(QnaVO qnaVO) throws Exception {
        mapper.insert(qnaVO);
    }

    @Override
    public QnaVO get(int q_no) throws Exception {
        mapper.count(q_no);
        return mapper.get(q_no);
    }

    @Override
    public int update(QnaVO qnaVO) throws Exception {

        int result = mapper.update(qnaVO);

        if(result == 1){
            log.info("Update Success");
        }else {
            log.info("Update Fail");
        }

        return result;
    }

    @Override
    public int delete(int q_no) throws Exception {

        int result = mapper.delete(q_no);

        if(result == 1){
            log.info("Delete Success");
        }else {
            log.info("Delete Fail");
        }
        return result;
    }

    @Override
    public List<QnaVO> getList(Criteria cri) {
        return mapper.getListWithPaging(cri);
    }

    @Override
    public int getTotal(Criteria cri) {
        return 100;
    }


}
