package com.kwShop.Shop.member.controller;

import com.kwShop.Shop.member.service.MemberService;
import com.kwShop.Shop.member.vo.MemberVO;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Random;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService service;
    private JavaMailSender mailSender;

    @GetMapping({"/profile","/update"})
    public void profile(String member_id, Model model) throws Exception {

        model.addAttribute("Member", service.profile(member_id));
    }


    @GetMapping("/login")
    public void login(){

    }

    @GetMapping("/join")
    public void join(){
        log.info("회원가입 페이지");
    }

    @PostMapping("/join")
    public String join(@Valid MemberVO member, BindingResult bindingResult,Model model) throws  Exception {
        log.info("회원 가입");

        if(bindingResult.hasErrors()){

            model.addAttribute("errors", bindingResult.getAllErrors());
            model.addAttribute("member", member);

            return "/member/join";
        }

        service.memberJoin(member);

        return "redirect:/member/login";
    }

    @PostMapping("/update")
    public String update(@Valid MemberVO member, BindingResult bindingResult,Model model) throws  Exception {
        log.info("업데이트" + member.toString());
        if(bindingResult.hasErrors()){

            model.addAttribute("errors", bindingResult.getAllErrors());
            model.addAttribute("member", member);

            return "/member/update";
        }

        service.memberUpdate(member);

        return "redirect:/member/login";
    }
    

    //로그인 처리
    @PostMapping("/login")
    @ResponseBody
    public void member_login(@RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception {

        log.info(member_id + ":" + member_pw);

        HttpSession session = request.getSession(); // 세션 획득

        MemberVO member = service.memberLogin(member_id, member_pw); // 로그인한 멤버 객체

        session.setAttribute("member", member); // 세션에 로그인한 멤버 객체 저장

        log.info(member.toString());
    } // 로그인

    //로그아웃 처리
    @PostMapping("/logout")
    @ResponseBody
    public void member_logout(HttpServletRequest request){

        HttpSession session = request.getSession();
        session.invalidate();
    }

    //ID 중복 체크
    @PostMapping("/m_id_check")
    @ResponseBody
    public String m_id_check(@RequestParam("member_id") String member_id) throws Exception {

        log.info("아이디 중복검사");
        log.info(member_id);

        return service.idCheck(member_id);
    }

    // 이메일 인증
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheckGET(@RequestParam("email") String email) throws Exception{
        log.info("email :" + email);

        // 인증번호 생성
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111; // 111111 ~ 999999 까지 난수 생성

        log.info(String.valueOf(checkNum));

        // 이메일 보내기
        //String setForm = "kkwkkj12@gmail.com";
        String toMail = email;
        String title = "회원 가입 인증 메일입니다.";
        String content =  "안녕하세요 기원 shop 입니다." + "<br><br> 인증 번호는 " + checkNum + "입니다." + "<br><br> 감사합니다. ";

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        //helper.setFrom(setForm);
        helper.setTo(toMail);
        helper.setSubject(title);
        helper.setText(content, true);
        mailSender.send(message);

        String num = Integer.toString(checkNum);

        return num;
    }




}
