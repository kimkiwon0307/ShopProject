package com.kwShop.Shop.admin.service;

import com.kwShop.Shop.admin.mapper.AdminMapper;
import com.kwShop.Shop.admin.vo.CategoryVO;
import com.kwShop.Shop.admin.vo.Criteria;
import com.kwShop.Shop.admin.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Slf4j
class AdminServiceImplTest {

    @Autowired
    private AdminService service;



    @Test
    @DisplayName("상품 등록 테스트")
    public void testInsert() throws Exception {

        ProductVO productVO = new ProductVO();

        productVO.setP_name("테스트상품");
        productVO.setP_price(100000);
        productVO.setP_title("테스트상품");
        productVO.setP_content("테스트상품");
        productVO.setP_quantity(100);
        productVO.setP_categoryCode("1");
        productVO.setP_discount(10.0);

        service.productRegister(productVO);

    }

    @Test
    @DisplayName("카테고리 리스트 테스트")
    public void testCategoryList(){

        List<CategoryVO> list = service.categoryList();

        list.forEach(category -> log.info(category.toString()));

    }

    @Test
    @DisplayName("상품 리스트 테스트")
    public void testList() throws Exception{

        Criteria criteria = new Criteria();

        List<ProductVO> list = service.productList(criteria);

        list.forEach(product -> log.info(product.toString()));

    }

    @Test
    @DisplayName("상품 총갯수")
    public void testTotal() throws Exception {

        Criteria cri = new Criteria();

        cri.setAmount(200);
        cri.setPageNum(1);

        int a = service.productTotal(cri);

        log.info(String.valueOf(a));
    }

    @Test
    @DisplayName("상품 조회 테스트")
    void testGet() throws Exception {
        ProductVO findProduct= service.productGet(151);
        log.info(findProduct.toString());
    }


}