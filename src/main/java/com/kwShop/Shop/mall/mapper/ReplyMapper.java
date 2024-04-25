package com.kwShop.Shop.mall.mapper;

import com.kwShop.Shop.admin.vo.AttachImageVO;
import com.kwShop.Shop.admin.vo.Criteria;
import com.kwShop.Shop.admin.vo.ProductVO;
import com.kwShop.Shop.mall.vo.ReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReplyMapper {

    public void insert(ReplyVO reply);

    public List<ReplyVO>list(int p_id);

    public void update(@Param("r_no")int r_no, @Param("r_reply") String r_reply);

    public void delete(@Param("r_no")int r_no);
}
