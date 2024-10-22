package com.kwShop.Shop.main.controller;

import com.kwShop.Shop.main.service.ReplyService;
import com.kwShop.Shop.main.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reply/*")
@Slf4j
public class ReplyController {

    private final ReplyService service;

    public ReplyController (ReplyService service){
        this.service = service;
    }

    @PostMapping("/insert")
    public void registerReply(@RequestParam("p_id") int p_id, @RequestParam("r_replyer") String r_replyer, @RequestParam("r_reply") String r_reply){


        ReplyVO replyVO = new ReplyVO();

        replyVO.setP_id(p_id);
        replyVO.setR_reply(r_reply);
        replyVO.setR_replyer(r_replyer);

        log.info("리뷰 작성");
        log.info(replyVO.toString());
        service.insert(replyVO);
    }

    @GetMapping("list")
    public ResponseEntity<List<ReplyVO>> listReply(@RequestParam("p_id") int p_id) {
        log.info("댓글 리스트");
        log.info("p_id " + p_id);
        List<ReplyVO> replyList = service.list(p_id);
        return new ResponseEntity<>(replyList, HttpStatus.OK);
    }

    @PutMapping("update")
    public void updateReply(@RequestParam("r_no") int r_no, @RequestParam("r_reply") String r_reply){

        log.info("리뷰업데이트");
        service.update(r_no, r_reply);
    }

    @DeleteMapping("delete")
    public void deleteReply(@RequestParam("r_no") int r_no){

        log.info("리뷰 삭제");
        service.delete(r_no);
    }
}
