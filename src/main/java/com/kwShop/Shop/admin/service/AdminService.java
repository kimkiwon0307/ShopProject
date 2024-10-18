package com.kwShop.Shop.admin.service;


import com.kwShop.Shop.admin.vo.AttachImageVO;
import com.kwShop.Shop.admin.vo.CategoryVO;
import com.kwShop.Shop.admin.vo.Criteria;
import com.kwShop.Shop.admin.vo.ProductVO;

import java.util.List;

public interface AdminService {

    public void productRegister(ProductVO product) throws Exception;  // 상품 등록
    public List<ProductVO> productList(Criteria cri) throws Exception; // 상품 리스트

    public int productUpdate(ProductVO product) throws Exception;  // 상품 수정

    public int productDelete(int p_id) throws Exception;  // 상품 수정
    
    public int productTotal(Criteria cri) throws Exception;  // 상품 총 갯수

    public ProductVO productGet(int p_id) throws Exception; // 상품 조회

    public List<AttachImageVO> productImages(int p_id) ; // 이미지가져오기

    public List<AttachImageVO> AllImages();

    public void ImageRegister(ProductVO product, int p_id); // 이미지 저장

    public List<CategoryVO> categoryList(); // 카테고리 리스트

    public List<CategoryVO> subCategory(int cateCode) throws Exception; // 서브 카테고리



}
