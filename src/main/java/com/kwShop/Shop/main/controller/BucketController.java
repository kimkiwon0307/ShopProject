package com.kwShop.Shop.main.controller;

import com.kwShop.Shop.main.service.BucketService;
import com.kwShop.Shop.main.vo.BucketVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/bucket/*")
@Slf4j
@Controller
public class BucketController {

    private final BucketService service;

    public BucketController (BucketService service){
        this.service = service;
    }

    @GetMapping("/main")
    public void list(@RequestParam("member_id")String member_id, Model model){

        List<BucketVO> buckets = service.list(member_id);
     //   List<BucketVO> bucketss = new ArrayList<>();

        for(BucketVO bucket : buckets){

           bucket.setUploadPath(bucket.getUploadPath().replaceAll("\\\\","\\\\\\\\"));
            log.info(bucket.toString());
        }

        model.addAttribute("list", buckets);
    }

    @PostMapping("/insert")
    @ResponseBody
    public void insert(@RequestBody BucketVO bucketVO){

       service.insert(bucketVO);
    }

    @DeleteMapping("/delete")
    @ResponseBody
    public void delete(@RequestParam("b_id") int b_id){

        log.info("버켓 삭제" + b_id);

        service.delete(b_id);

    }

}
