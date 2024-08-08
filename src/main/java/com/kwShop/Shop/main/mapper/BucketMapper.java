package com.kwShop.Shop.main.mapper;

import com.kwShop.Shop.main.vo.BucketVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BucketMapper {

    public void insert(BucketVO bucket);

    public List<BucketVO> list( @Param("member_id")String member_id);

    public void delete(@Param("b_id")int b_id);

    public int findProduct(@Param("p_id") int p_id, @Param("member_id") String member_id);

    public void plusProduct(@Param("p_id") int p_id, @Param("quantity") int quantity);
}
