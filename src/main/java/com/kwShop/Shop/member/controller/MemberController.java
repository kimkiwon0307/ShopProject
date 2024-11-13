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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.security.SecureRandom;
import java.util.Random;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService service;
    private JavaMailSender mailSender;
    private HttpSession session;


    @GetMapping({"/profile","/update"})
    public void profile(String member_id, Model model) throws Exception {

        model.addAttribute("Member", service.profile(member_id));
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



    //로그인 처리 start
    @GetMapping("/login")
    public void login(){
        log.info("로그인 페이지");
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<String> member_login(@RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception {

        log.info(member_id + ":" + member_pw);

        MemberVO member = service.memberLogin(member_id, member_pw); // 로그인한 멤버 객체

        if(member != null) {
            HttpSession session = request.getSession(); // 세션 획득
            session.setAttribute("member", member); // 세션에 로그인한 멤버 객체 저장
            return ResponseEntity.ok("로그인 성공");
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 실패: 아이디 또는 비밀번호가 올바르지 않습니다.");

    } // 로그인 end

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
        log.info(service.idCheck(member_id));
        return service.idCheck(member_id);
    }

    // 이메일 인증
    @GetMapping("/mailCheck")
    @ResponseBody
    public int mailCheckGET(@RequestParam("email") String email) throws Exception{
        log.info("email :" + email);

        // 인증번호 생성
        SecureRandom random = new SecureRandom();
        int checkNum = random.nextInt(888888) + 111111; // 111111 ~ 999999 까지 난수 생성

        log.info(String.valueOf(checkNum));

        // 이메일 보내기
        String setForm = "kkwkkj@gmail.com";  // 보내는 사람 이메일
        String toMail = email;                  // 받는 사람 이메일
        String title = "회원가입 인증 메일입니다.";  // 메일 제목
        String content =  "안녕하세요 기원 shop 입니다." + "<br><br> 인증 번호는 " + checkNum + "입니다." + "<br><br> 감사합니다. "; // 메일 내용

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setForm);   // 보내는 사람 설정
            helper.setTo(toMail);      // 받는 사람 설정
            helper.setSubject(title);  // 제목 설정
            helper.setText(content, true);   // 본문 설정 (HTML 형식)
            mailSender.send(message);

            //인증번호를 세션에 저장하고 유효 시간을 설정한다
            session.setAttribute(email, checkNum);
            session.setMaxInactiveInterval(3 * 60); // 5분 설정
            return checkNum;
        }catch(Exception e){
            return 0;
        }
    }// 이메일 인증 end
}
