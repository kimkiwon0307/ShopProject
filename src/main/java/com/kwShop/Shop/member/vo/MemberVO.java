package com.kwShop.Shop.member.vo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

import java.util.Date;

@Data
public class MemberVO {

    @NotBlank(message = "아이디를 입력해주세요.")
    private String member_id;
    @NotBlank(message = "패스워드 입력해주세요.")
    private String member_pw;
    @NotBlank(message = "이름을 입력해주세요.")
    private String member_name;
    @NotBlank(message = "메일을 입력해주세요.")
    @Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$", message = "이메일 형식에 맞지 않습니다.")
    private String member_mail;

    @NotBlank(message = "주소를 입력해주세요.")
    private String member_Addr1;
    @NotBlank(message = "주소를 입력해주세요.")
    private String member_Addr2;
    @NotBlank(message = "주소를 입력해주세요.")
    private String member_Addr3;
    private int adminCk;
    private Date regDate;
    private int money;
    private int point;
}
