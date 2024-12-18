package com.kwShop.Shop.qna.mapper;

import com.kwShop.Shop.qna.vo.Criteria;
import com.kwShop.Shop.qna.vo.QnaVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
class QnaMapperTest {

    @Autowired
    private QnaMapper mapper;


    @Test
    @DisplayName("insert 테스트")
    public void insertTest(){

        QnaVO qnaVO = new QnaVO();

        qnaVO.setQ_title("테스트 제목");
        qnaVO.setQ_content("테스트 내용");
        qnaVO.setQ_writer("테트스 저자");
        mapper.insert(qnaVO);
    }

    @Test
    @DisplayName("목록 테스트")
    public void getListTest(){
        mapper.getList().forEach(list -> log.info(list.toString()));
    }

    @Test
    @DisplayName("조회 테스트")
    public void getTest(){
        QnaVO qnaVO = mapper.get(1);
        log.info(qnaVO.toString());
    }

    @Test
    @DisplayName("업데이트 테스트")
    public void getUpdate(){

        QnaVO qnaVO = mapper.get(1);

        qnaVO.setQ_title("수정 테스트");
        qnaVO.setQ_content("수정 테스트 내용");
        qnaVO.setQ_writer("수정 테스트 작가");

        int result = mapper.update(qnaVO);

        log.info(String.valueOf(result));
        log.info(mapper.get(1).toString());
    }

    @Test
    @DisplayName("삭제 테스트")
    public void deleteTest(){

        log.info(mapper.getList().toString());
        int result = mapper.delete(5);
        log.info(String.valueOf(result));
        log.info(mapper.getList().toString());
    }

    @Test
    @DisplayName("조회수 테스트")
    public void countTest(){

        log.info(String.valueOf(mapper.get(10).getQ_count()));

        mapper.count(10);

        log.info(String.valueOf(mapper.get(10).getQ_count()));

    }

    @Test
    @DisplayName(" 검색 테스트")
    public void testSearch() {

        Criteria cri = new Criteria();
        cri.setKeyword("gd");
        cri.setType("q_title");

        List<QnaVO> list = mapper.getListWithPaging(cri);

        list.forEach(qna -> log.info(String.valueOf(qna)));
    }


}