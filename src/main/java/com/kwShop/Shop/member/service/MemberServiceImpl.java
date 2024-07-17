package com.kwShop.Shop.member.service;

import com.kwShop.Shop.member.mapper.MemberMapper;
import com.kwShop.Shop.member.vo.MemberVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{

    private final MemberMapper mapper;

    public MemberServiceImpl(MemberMapper mapper){
        this.mapper = mapper;
    }

    @Override
    public void memberJoin(MemberVO member) throws Exception {
        mapper.memberJoin(member);
    }

    @Override
    public MemberVO memberLogin(String member_id, String member_pw) throws Exception {
        return mapper.memberLogin(member_id, member_pw);
    }


    @Override //아이디 중복검사
    public String idCheck(String member_id) throws Exception {

        int result = mapper.idCheck(member_id);

        if(result !=0 ) {
            return "fail";
        }else {
            return "success";
        }
    }

    @Override
    public List<MemberVO> memberList() throws Exception {
        return mapper.memberList();
    }

    @Override
    public void deleteMember(String member_id) throws Exception {
        mapper.memberDelete(member_id);
    }

    @Override
    public MemberVO profile(String member_id) throws Exception {
        return mapper.profile(member_id);
    }

    @Override
    public void memberUpdate(MemberVO member) throws Exception {
        mapper.memberUpdate(member);
    }


}
