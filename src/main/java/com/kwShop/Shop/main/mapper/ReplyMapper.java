package com.kwShop.Shop.main.mapper;

import com.kwShop.Shop.main.vo.ReplyVO;
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
