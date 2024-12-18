package com.kwShop.Shop.member.service;

import com.kwShop.Shop.member.mapper.MemberMapper;
import com.kwShop.Shop.member.vo.Criteria;
import com.kwShop.Shop.member.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberMapper mapper;
//    private final BCryptPasswordEncoder passwordEncoder;


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
    public List<MemberVO> memberList(Criteria cri) throws Exception {
        System.out.println(cri.toString());
        cri.setOffset( (cri.getPageNum() - 1) * cri.getAmount());
        System.out.println(cri.toString());
        return mapper.memberList(cri);
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
    public int memberTotal(Criteria cri) throws Exception {
        return mapper.memberTotal(cri);
    }

    @Override
    public void memberUpdate(MemberVO member) throws Exception {
        mapper.memberUpdate(member);
    }



}
