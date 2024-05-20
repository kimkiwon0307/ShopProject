package com.kwShop.Shop.member.service;

import com.kwShop.Shop.member.vo.MemberVO;

import java.util.List;

public interface MemberService {

    void memberJoin(MemberVO member) throws Exception;   // 회원가입
    MemberVO memberLogin(String member_id, String member_pw) throws Exception;  // 로그인 처리
    int idCheck(String member_id) throws Exception; // 중복 아이디 체크
    public List<MemberVO> memberList() throws Exception;  // 멤버 목록
    public void deleteMember(String member_id) throws Exception; // 멤버 삭제하기

}
