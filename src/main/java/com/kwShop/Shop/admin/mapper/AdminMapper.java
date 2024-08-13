package com.kwShop.Shop.admin.mapper;

import com.kwShop.Shop.admin.vo.AttachImageVO;
import com.kwShop.Shop.admin.vo.CategoryVO;
import com.kwShop.Shop.admin.vo.Criteria;
import com.kwShop.Shop.admin.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminMapper {

    public void productRegister(ProductVO product); // 상품 등록

    public List<ProductVO> productList(@Param("offset") int offset, @Param("amount") int amount, @Param("keyword") String keyword); // 상품 목록
    
    public int productUpdate(ProductVO product); // 상품 수정

    public int productTotal(Criteria cri); // 상품 총 갯수

    public ProductVO productGet(int p_id); // 상품 상세 페이지

    public void insert(AttachImageVO vo); // 이미지 저장
    public void update(AttachImageVO vo); // 이미지 저장

    public ProductVO ImageByProduct(int p_id); // p_id를 통해 left 조인해서 product가져오기 가져오기
    public List<AttachImageVO> findByPid(int p_id); // 이미지 데이터 가져오기
    
    public List<AttachImageVO> findByAll(); // 메인화면 이미지 가져오기
    
    public void deleteImage(int p_id); // 이미지 삭제
    public int deleteProduct(int p_id); // 상품 삭제

    public List<CategoryVO> categoryList(); // 카테고리 리스트

}
