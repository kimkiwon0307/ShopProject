package com.kwShop.Shop.mall.mapper;

import com.kwShop.Shop.mall.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
class ReplyMapperTest {

    @Autowired
    private ReplyMapper mapper;

    @Test
    @DisplayName("목록")
    public void testList(){

        List<ReplyVO> replyVOS = mapper.list(133);

        replyVOS.forEach(list -> log.info(list.toString()));

    }

    @Test
    @DisplayName("업데이트")
    public void testupdate(){

        String r_reply = "테스트 업데이트 ";
        int r_no = 1;

        mapper.update(r_no,r_reply);

        List<ReplyVO> replyVOS = mapper.list(133);

        replyVOS.forEach(list -> log.info(list.toString()));

    }

    @Test
    @DisplayName("삭제")
    public void testdelete(){

        mapper.delete(9);

    }

}