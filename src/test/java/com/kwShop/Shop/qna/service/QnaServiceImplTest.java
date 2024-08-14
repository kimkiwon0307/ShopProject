package com.kwShop.Shop.qna.service;

import com.kwShop.Shop.qna.vo.QnaVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
class QnaServiceImplTest {

    @Autowired
    private QnaService service;

    @Test
    @DisplayName("목록 테스트")
    public void getListTest() throws Exception {
        service.getList().forEach(list -> log.info(list.toString()));
    }

    @Test
    @DisplayName("insert 테스트")
    public void insertTest() throws Exception {

        QnaVO qnaVO = new QnaVO();

        qnaVO.setQ_title("테스트 제목");
        qnaVO.setQ_content("테스트 내용");
        qnaVO.setQ_writer("테트스 저자");
        service.insert(qnaVO);
    }

    @Test
    @DisplayName("조회 테스트")
    public void getTest() throws Exception {
        QnaVO qnaVO = service.get(1);
        log.info(qnaVO.toString());
    }

    @Test
    @DisplayName("업데이트 테스트")
    public void getUpdate() throws Exception {

        QnaVO qnaVO = service.get(3);

        qnaVO.setQ_title("수정 테스트");
        qnaVO.setQ_content("수정 테스트 내용");
        qnaVO.setQ_writer("수정 테스트 작가");

        int result = service.update(qnaVO);

        log.info(String.valueOf(result));
        log.info(service.get(3).toString());
    }

    @Test
    @DisplayName("삭제 테스트")
    public void deleteTest() throws Exception {

        log.info(service.getList().toString());
        int result = service.delete(3);
        log.info(String.valueOf(result));
        log.info(service.getList().toString());
    }


}