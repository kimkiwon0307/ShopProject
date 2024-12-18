package com.kwShop.Shop.member.vo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;
import org.hibernate.validator.constraints.UniqueElements;

import java.util.Date;

@Data
public class MemberVO {

    @NotBlank(message = "아이디를 입력해주세요.")
    @Pattern(regexp = "^[a-zA-Z]{2,10}$", message = "아이디는 영문 2자 이상 10자 이하로 입력해주세요.")
    private String member_id;                    //아이디+

    @NotBlank(message = "패스워드 입력해주세요.")
    @Pattern(
            regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",
            message = "비밀번호는 최소 8자 이상, 하나 이상의 문자, 숫자, 특수문자를 포함해야 합니다."
    )
    private String member_pw;                    //비밀번호

    @NotBlank(message = "이름을 입력해주세요.")
    @Pattern(regexp = "^[가-힣a-zA-Z\\s]{2,10}$", message = "이름은 한글 또는 영문 2자 이상 10자 이하로 입력해주세요.")
    private String member_name;                  //이름

    @NotBlank(message = "메일을 입력해주세요.")
    @Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$", message = "이메일 형식에 맞지 않습니다.")
    private String member_mail;                  //이메일

    @NotBlank(message = "주소를 입력해주세요.")
    private String member_Addr1;                //  주소1 : 지역번호

    @NotBlank(message = "주소를 입력해주세요.")
    private String member_Addr2;                //  주소2 : 주소

    @NotBlank(message = "주소를 입력해주세요.")
    private String member_Addr3;                //  주소3 : 상세주소

    private int adminCk;                        //  관리자여부 =>  0=일반사용자 1=관리자
    private Date regDate;                       //  가입 날짜
    private int money;                          //  돈
    private int point;                          //  포인트
}
