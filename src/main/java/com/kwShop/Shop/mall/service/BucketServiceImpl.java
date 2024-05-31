package com.kwShop.Shop.mall.service;

import com.kwShop.Shop.mall.mapper.BucketMapper;
import com.kwShop.Shop.mall.vo.BucketVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BucketServiceImpl implements BucketService{


    private final BucketMapper mapper;

    public BucketServiceImpl(BucketMapper mapper){
        this.mapper = mapper;
    }


    @Override
    public void insert(BucketVO bucket) {

        if(mapper.findProduct(bucket.getP_id(),bucket.getMember_id()) == 1){
            mapper.plusProduct(bucket.getP_id(), bucket.getQuantity());
        }else{
            mapper.insert(bucket);
        }

    }

    @Override
    public List<BucketVO> list(String member_id) {
        return mapper.list(member_id);
    }

    @Override
    public void delete(int b_id) {
        mapper.delete(b_id);
    }


}
