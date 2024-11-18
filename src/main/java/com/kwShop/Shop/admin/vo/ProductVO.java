package com.kwShop.Shop.admin.vo;

import jakarta.validation.constraints.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ProductVO {

    private int p_id;              // 상품 아이디

    @NotEmpty(message = "상품명을 입력하세요.")
    private String p_name;         // 상품명

    @NotNull(message = "상품 가격을 입력하세요.")
    @PositiveOrZero(message = "가격은 0 이상이어야 합니다.")
    private Integer p_price;       //  상품 가격

    @NotEmpty(message = "상품 등록 제목을 입력하세요.")
    private String p_title;      //   상품 등록 제목

    @NotEmpty(message = "상품 내용을 입력하세요.")
    private String p_content;    //   상품 등록 내용

    @NotNull(message = "상품 갯수 (0 ~ 100) 를 입력하세요.")
    @PositiveOrZero(message = "수량은 0 이상이어야 합니다.")
    @Max(100)
    private Integer  p_quantity;        // 상품 갯수

    @NotNull(message = "상품 할인율(0~99) 을 입력하세요.")
    @Min(value = 0, message = "할인은 0% 이상이어야 합니다.")
    @Max(value = 99, message = "할인은 99% 이하이어야 합니다.")
    private Double  p_discount; // 상품 할인 확률

    private Date p_date;         //   상품 등록날짜
    private Date p_udate;         //  상품 수정 날짜
    private String p_categoryCode; // 상품 카테고리
    private String p_categoryName; // 상품 분류

    private String attachUuid;
    private String attachUploadPath;
    private String attachFilename;



    private List<AttachImageVO> attachList; // 상품 이미지 리스트


}
