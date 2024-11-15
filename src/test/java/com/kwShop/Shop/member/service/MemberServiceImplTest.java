package com.kwShop.Shop.member.service;

import com.kwShop.Shop.member.vo.Criteria;
import com.kwShop.Shop.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
class MemberServiceImplTest {

    @Autowired
    private MemberService service;

    @Test
    @DisplayName("회원가입 테스트")
    public void memberJoin() throws Exception {

        MemberVO memberVO = new MemberVO();        //멤버 객체 생성

        memberVO.setMember_id("test아이디Service");         // 멤버 객체 필드 주입
        memberVO.setMember_pw("1234");
        memberVO.setMember_name("test");
        memberVO.setMember_mail("test@test.com");
        memberVO.setMember_Addr1("test시");
        memberVO.setMember_Addr2("test구");
        memberVO.setMember_Addr3("test동");
        memberVO.setAdminCk(0);
        memberVO.setMoney(1000);
        memberVO.setPoint(100);

        service.memberJoin(memberVO);

        log.info(memberVO.toString());
    }

    @Test
    @DisplayName("아이디 중복체크")
    public void idCheckTest() throws Exception {

        MemberVO memberVO = new MemberVO();

        memberVO.setMember_id("admin"); // 중복아이디
        // memberVO.setMember_id("adminXID"); // 새로운아이디

        String result = service.idCheck(memberVO.getMember_id());

        if (result == "success") {
            log.info("생성 가능한 아이디");
            log.info(String.valueOf(result));
        } else {
            log.info("아이디 존재");
            log.info(String.valueOf(result));
        }
    }

    @Test
    @DisplayName("로그인 테스트")
    public void loginTest() throws Exception {

        MemberVO member = new MemberVO();               // 멤버 객체 생성

        member.setMember_id("admin");
        member.setMember_pw("admin");

        String member_id = member.getMember_id();
        String member_pw = member.getMember_pw();

        MemberVO findmember = service.memberLogin(member_id, member_pw);

        log.info(findmember.toString());   // 찾아온 멤버 toString으로 보기
    }

    @Test
    @DisplayName("회원 목록 테스트")
    public void memberListTest() throws Exception {
        Criteria cri = new Criteria(1,10);

        List<MemberVO> Members = service.memberList(cri);
        Members.forEach(list -> log.info(list.toString()));
    }
}