package com.kwShop.Shop.member.mapper;

import com.kwShop.Shop.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberMapper {
    void memberJoin(MemberVO memberVO);

    public MemberVO memberLogin(@Param("member_id") String member_id, @Param("member_pw")String member_pw);

    int idCheck(String member_id);
    
    public List<MemberVO> memberList(); // 멤버 목록

    public void memberDelete (@Param(("member_id")) String member_id);
}
