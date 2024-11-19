package com.kwShop.Shop.admin.vo;

import jakarta.validation.constraints.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ProductVO {

    private int p_id;              // 상품 아이디

    @NotEmpty(message = "상품명을 입력하세요.")
    @Pattern(regexp = "^[가-힣a-zA-Z\\s]{2,10}$", message = "이름은 한글 또는 영문 2자 이상 10자 이하로 입력해주세요.")
    private String p_name;         // 상품명

    @NotNull(message = "상품 가격을 입력하세요.")
    @Min(value = 0, message = "가격은 0 이상이어야 합니다.")
    @Max(value = 10000000, message = "가격은 1,000만 원을 초과할 수 없습니다.")
    private Integer p_price;       //  상품 가격

    @NotEmpty(message = "상품 등록 제목을 입력하세요.")
    @Pattern(regexp = "^[가-힣a-zA-Z\\s]{2,10}$", message = "제목은 한글 또는 영문 2자 이상 10자 이하로 입력해주세요.")
    private String p_title;      //   상품 등록 제목

    @NotEmpty(message = "상품 내용을 입력하세요.")
    @Pattern(regexp = "^[가-힣a-zA-Z0-9\\s]{2,100}$", message = "내용은 한글, 영문, 숫자 및 띄어쓰기를 포함하여 2자 이상 100자 이하로 입력해주세요.")
    private String p_content;    //   상품 등록 내용

    @NotNull(message = "상품 갯수 (0 ~ 100) 를 입력하세요.")
    @Min(value = 0, message = "수량은 1개 이상이어야 합니다.")
    @Max(value = 100, message = "수량은 최대 100개 입니다.")
    private Integer  p_quantity;        // 상품 갯수

    @NotNull(message = "상품 할인율(0~99) 을 입력하세요.")
    @Min(value = 0, message = "할인은 0% 이상이어야 합니다.")
    @Max(value = 99, message = "할인은 99% 이하이어야 합니다.")
    private Double  p_discount; // 상품 할인 확률

    private Date p_date;         //   상품 등록날짜
    private Date p_udate;         //  상품 수정 날짜
    @NotBlank
    private String p_categoryCode; // 상품 카테고리
    @NotBlank
    private String p_categoryName; // 상품 분류

    private String attachUuid;
    private String attachUploadPath;
    private String attachFilename;



    private List<AttachImageVO> attachList; // 상품 이미지 리스트


}
