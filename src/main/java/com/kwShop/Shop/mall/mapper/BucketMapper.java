package com.kwShop.Shop.mall.mapper;

import com.kwShop.Shop.mall.vo.BucketVO;
import com.kwShop.Shop.mall.vo.ReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BucketMapper {

    public void insert(BucketVO bucket);

    public List<BucketVO> list( @Param("member_id")String member_id);

    public void delete(@Param("b_id")int b_id);

}