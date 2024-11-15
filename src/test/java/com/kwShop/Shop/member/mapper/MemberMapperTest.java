package com.kwShop.Shop.member.mapper;

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
class MemberMapperTest {

    @Autowired
    private MemberMapper mapper;  // 회원 매퍼를 주입 받음

    @Test
    @DisplayName("회원가입 테스트")
    public void memberJoin() throws  Exception{

        MemberVO memberVO = new MemberVO();        //멤버 객체 생성

        memberVO.setMember_id("test아이디");         // 멤버 객체 필드 주입
        memberVO.setMember_pw("1234");
        memberVO.setMember_name("test");
        memberVO.setMember_mail("test@test.com");
        memberVO.setMember_Addr1("test시");
        memberVO.setMember_Addr2("test구");
        memberVO.setMember_Addr3("test동");
        memberVO.setAdminCk(0);
        memberVO.setMoney(1000);
        memberVO.setPoint(100);
        mapper.memberJoin(memberVO);            // 매퍼에 회원가입 테스트
        log.info(memberVO.toString());
    }
    
    @Test
    @DisplayName("아이디 중복체크")
    public void idCheckTest(){

        MemberVO memberVO = new MemberVO();
        
        memberVO.setMember_id("admin"); // 중복아이디
       // memberVO.setMember_id("adminXID"); // 새로운아이디

        int result = mapper.idCheck(memberVO.getMember_id());
        
        if(result == 0) {
            log.info("생성 가능한 아이디");
            log.info(String.valueOf(result));
        }else {
            log.info("아이디 존재");
            log.info(String.valueOf(result));
        }
        
    }
    
    @Test
    @DisplayName("회원 로그인 테스트")
    public void memberLogin() throws  Exception{

        MemberVO member = new MemberVO();               // 멤버 객체 생성

        member.setMember_id("admin");
        member.setMember_pw("admin");

        String member_id = member.getMember_id();
        String member_pw = member.getMember_pw();

        MemberVO findmember = mapper.memberLogin(member_id, member_pw);   // 로그인할때 아이디와 비밀번호 넘겨주기

        log.info(findmember.toString());   // 찾아온 멤버 toString으로 보기
    }

    @Test
    @DisplayName("멤버 목록")
    public void memberList() {
        Criteria cri = new Criteria(1,10);

       List<MemberVO> Members = mapper.memberList(cri);
       Members.forEach(list -> log.info(list.toString()));
    }

    @Test
    @DisplayName("멤버 총인원")
    public void memberTotalTest(){
        Criteria cri = new Criteria(1, 10);

        int members = mapper.memberTotal(cri);

        log.info("총인원 : {}", members);

    }
}