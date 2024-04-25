package com.kwShop.Shop.member.mapper;

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
    private MemberMapper mapper;

    @Test
    public void memberJoin() throws  Exception{

        MemberVO memberVO = new MemberVO();

        memberVO.setMember_id("testId2");
        memberVO.setMember_pw("1234");
        memberVO.setMember_name("test");
        memberVO.setMember_mail("test@test.com");
        memberVO.setMember_Addr1("test시");
        memberVO.setMember_Addr2("test구");
        memberVO.setMember_Addr3("test동");
        memberVO.setAdminCk(0);
        memberVO.setMoney(1000);
        memberVO.setPoint(100);

        mapper.memberJoin(memberVO);
    }

    @Test
    public void memberLogin() throws  Exception{

        MemberVO member = new MemberVO();

        member.setMember_id("admin");
        member.setMember_pw("admin");

        String member_id = member.getMember_id();
        String member_pw = member.getMember_pw();

        MemberVO findmember = mapper.memberLogin(member_id, member_pw);

        log.info(findmember.toString());
    }

    @Test
    @DisplayName("멤버 목록")
    public void memberList() {

       List<MemberVO> Members = mapper.memberList();

        Members.forEach(list -> log.info(list.toString()));

    }



}