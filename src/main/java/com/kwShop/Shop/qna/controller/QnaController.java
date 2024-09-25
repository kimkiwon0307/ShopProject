package com.kwShop.Shop.qna.controller;

import com.kwShop.Shop.qna.service.QnaService;
import com.kwShop.Shop.qna.vo.Criteria;
import com.kwShop.Shop.qna.vo.PageDTO;
import com.kwShop.Shop.qna.vo.QnaVO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
@AllArgsConstructor
@RequestMapping("/qna/*")
public class QnaController {

    private QnaService service;


    @GetMapping("/main")
    public void getList(Criteria cri, Model model) throws Exception {
        log.info("목록");

        model.addAttribute("list", service.getList(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
    }

    @GetMapping("/register")
    public void register(){

    }

    @PostMapping("/register")
    public String register(QnaVO qnaVO) throws Exception {
        log.info(qnaVO.toString());
        service.insert(qnaVO);

        return "redirect:/qna/main";
    }

    @GetMapping({"/get","/update"})
    public void get(@RequestParam("q_no") int q_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

        log.info("get" + String.valueOf(q_no));
        model.addAttribute("qna", service.get(q_no));

    }

    @PostMapping("/update")
    public String update(QnaVO qnaVO, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) throws Exception {
        service.update(qnaVO);

        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());

        return "redirect:/qna/main";
    }

    @PostMapping("/delete")
    public String delete(int q_no) throws Exception {
        service.delete(q_no);

        return "redirect:/qna/main";
    }




}
