package com.kwShop.Shop.member.mapper;

import com.kwShop.Shop.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberMapper {
    void memberJoin(MemberVO memberVO);  // 멤버 회원가입
    public MemberVO memberLogin(@Param("member_id") String member_id, @Param("member_pw")String member_pw); // 멤버 로그인
    int idCheck(String member_id); // 회원 가입시 아이디 중복검사
    public List<MemberVO> memberList(); // 멤버 목록
    public void memberDelete (@Param(("member_id")) String member_id); // 멤버 삭제
    public MemberVO profile(@Param("member_id")String member_id); // 멤버 아이디로 프로필 조회
    void memberUpdate(MemberVO memberVO); // 멤버 업데이트
    
}
