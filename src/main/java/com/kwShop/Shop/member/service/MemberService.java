package com.kwShop.Shop.member.service;

import com.kwShop.Shop.member.vo.MemberVO;

import java.util.List;

public interface MemberService {

    void memberJoin(MemberVO member) throws Exception;
    MemberVO memberLogin(String member_id, String member_pw) throws Exception;
    int idCheck(String member_id) throws Exception;

    public List<MemberVO> memberList() throws Exception;

    public void deleteMember(String member_id) throws Exception;

}
