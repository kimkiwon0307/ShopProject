package com.kwShop.Shop.admin.service;

import com.kwShop.Shop.admin.mapper.AdminMapper;
import com.kwShop.Shop.admin.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Slf4j
class AdminServiceImplTest {

    @Autowired
    private AdminMapper mapper;



    @Test
    @DisplayName("서비스 등록 테스트")
    public void testInsert(){

        ProductVO productVO = new ProductVO();

        productVO.setP_name("테스트상품");
        productVO.setP_price(100000);
        productVO.setP_title("테스트상품");
        productVO.setP_content("테스트상품");
        productVO.setP_quantity(100);
        productVO.setP_categoryCode("1");
        productVO.setP_discount(10.0);

        mapper.productRegister(productVO);

    }


}