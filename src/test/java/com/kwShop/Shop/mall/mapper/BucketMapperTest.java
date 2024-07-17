package com.kwShop.Shop.mall.mapper;

import com.kwShop.Shop.mall.vo.BucketVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


@Slf4j
class BucketMapperTest {

    @Autowired
    private BucketMapper mapper;


    @Test
    @DisplayName("장바구니 인설트 테스트")
    public void insertTest(){

        BucketVO bucket = new BucketVO();

        bucket.setMember_id("admin");
        bucket.setP_id(140);
        bucket.setPrice(100000);
        bucket.setQuantity(3);

        mapper.insert(bucket);
    }

    @Test
    @DisplayName("장바구니 리스트")
    public void listTest(){

       List<BucketVO> buckets = mapper.list("admin");

       for(BucketVO bucket : buckets){
           log.info(bucket.toString());
       }

    }

    @Test
    @DisplayName("장바구니 삭제 테스트")
    public void deleteTest(){
        mapper.delete(1);

    }





}