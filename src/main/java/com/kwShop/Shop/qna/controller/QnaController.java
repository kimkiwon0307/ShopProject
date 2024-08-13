package com.kwShop.Shop.qna.controller;

import com.kwShop.Shop.qna.service.QnaService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@AllArgsConstructor
@RequestMapping("/qna/*")
public class QnaController {

    private QnaService service;


    @GetMapping("/main")
    public void getList(Model model) throws Exception {
        log.info("목록");

        model.addAttribute("list", service.getList());
    }

}
