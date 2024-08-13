package com.kwShop.Shop.admin.mapper;

import com.kwShop.Shop.admin.vo.AttachImageVO;
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
class AdminMapperTest {

    @Autowired
    private AdminMapper mapper;

    @Test
    @DisplayName("상품 리스트")
    public void testList(){

      List<ProductVO> list = mapper.productList(1,12,"");
      list.forEach(product -> log.info(product.toString()));

    }

    @Test
    @DisplayName("상품 총갯수")
    public void testTotal(){

        Criteria cri = new Criteria();

        cri.setAmount(200);
        cri.setPageNum(1);

       int a = mapper.productTotal(cri);

       log.info(String.valueOf(a));
    }

    @Test
    @DisplayName("상품 검색 테스트")
    void testKeyword(){

        List<ProductVO>productVOList = mapper.productList(1,100,"강아지 껌");
        productVOList.forEach(list -> log.info(list.toString()));
    }

    @Test
    @DisplayName("상품 조회 테스트")
    void testGet(){
       ProductVO findProduct= mapper.productGet(151);
       log.info(findProduct.toString());
    }



    @Test
    @DisplayName("이미지 저장")
    void testinsert(){

        AttachImageVO attachImageVO = new AttachImageVO();

        attachImageVO.setP_id(112);
        attachImageVO.setUuid("1111111111111111111");
        attachImageVO.setUploadPath("C:\\album");
        attachImageVO.setFileName("강아지껌");

        mapper.insert(attachImageVO);

    }

    @Test
    @DisplayName("상품 이미지 가져오기")
    void testImage(){
        List<AttachImageVO> attachImageVOS = mapper.findByPid(130);

        attachImageVOS.forEach(list -> log.info(list.toString()));




    }


    @Test
    @DisplayName("상품 업데이트")
    void testupdate(){

        ProductVO findProduct= mapper.productGet(113);
        log.info("수정전 = " + findProduct.toString());
        
        findProduct.setP_title("수정된 타이툴");
        findProduct.setP_name("수정된 이름");
        findProduct.setP_content("수정된 콘텐트");
        //findProduct.setP_price("1234");

        mapper.productUpdate(findProduct);

        mapper.productGet(113);
        log.info("수정후 = " + findProduct.toString());

    }

    @Test
    @DisplayName("이미지 수정")
    void testupdateImage(){

        List<AttachImageVO> attachImageVOS = mapper.findByPid(130);
        log.info("업뎃전" + attachImageVOS.toString());
        
        AttachImageVO attachImageVO = new AttachImageVO();

        attachImageVO.setP_id(130);
        attachImageVO.setUuid("1111111111111111111");
        attachImageVO.setUploadPath("C:\\album");
        attachImageVO.setFileName("강아지껌");

        mapper.update(attachImageVO);

        attachImageVOS = mapper.findByPid(130);
        log.info("업뎃후" + attachImageVOS.toString());

    }

    @Test
    @DisplayName("상품등록테스트")
    public void insertTest(){

        ProductVO productVO = new ProductVO();

        productVO.setP_name("테스트상품");
        productVO.setP_price(100000);
        productVO.setP_title("테스트상품");
        productVO.setP_content("테스트상품");
        productVO.setP_quantity(100);
        productVO.setP_categoryCode("1");
        productVO.setP_discount(10.0);
    }


}