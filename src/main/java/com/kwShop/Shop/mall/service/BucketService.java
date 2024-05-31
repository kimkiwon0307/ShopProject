package com.kwShop.Shop.mall.service;


import com.kwShop.Shop.mall.vo.BucketVO;

import java.util.List;

public interface BucketService {

    public void insert(BucketVO bucket);

    public List<BucketVO> list(String member_id);

    public void delete(int b_id);



}
