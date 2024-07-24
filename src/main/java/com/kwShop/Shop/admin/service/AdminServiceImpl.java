package com.kwShop.Shop.admin.service;

import com.kwShop.Shop.admin.mapper.AdminMapper;
import com.kwShop.Shop.admin.vo.AttachImageVO;
import com.kwShop.Shop.admin.vo.Criteria;
import com.kwShop.Shop.admin.vo.ProductVO;
import com.kwShop.Shop.mall.mapper.ReplyMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

    private final AdminMapper mapper;
    private final ReplyMapper replyMapper;

    public AdminServiceImpl(AdminMapper mapper, ReplyMapper replyMapper){
        this.mapper = mapper;
        this.replyMapper = replyMapper;
    }
    
    // 상품등록
    @Override
    public void productRegister(ProductVO product) {
        mapper.productRegister(product);

    }

    @Override
    public List<ProductVO> productList(Criteria cri) {

        int offset = (cri.getPageNum() - 1) * cri.getAmount();
        int amount = cri.getAmount();
        String keyword = cri.getKeyword();
        log.info(String.valueOf(offset));

        return mapper.productList(offset, amount, keyword);
    }
    @Transactional
    @Override
    public int productUpdate(ProductVO product) {

        ProductVO findProduct =  mapper.ImageByProduct(product.getP_id()); // 삭제예정
        
        AttachImageVO attachImage = new AttachImageVO();
        
        attachImage.setUuid(product.getAttachList().get(0).getUuid());
        attachImage.setFileName(product.getAttachList().get(0).getFileName());
        attachImage.setUploadPath(product.getAttachList().get(0).getUploadPath());
        attachImage.setP_id(product.getP_id());

        log.info("이거" + product.toString());
     
        log.info(attachImage.toString());

        mapper.update(attachImage);

        return mapper.productUpdate(product);
        
    }
    @Transactional
    @Override
    public int productDelete(int p_id) {

        mapper.deleteImage(p_id);

        return mapper.deleteProduct(p_id);
    }

    @Override
    public int productTotal(Criteria cri) {
        return mapper.productTotal(cri);
    }

    @Override
    public ProductVO productGet(int p_id) {
        return mapper.productGet(p_id);
    }
    
    // 이미지 가져오기
    @Override
    public List<AttachImageVO> productImages(int p_id) {
        return mapper.findByPid(p_id);
    }

    @Override
    public List<AttachImageVO> AllImages() {
        return mapper.findByAll();
    }


    @Override
    public void ImageRegister(ProductVO product, int p_id) {
        product.getAttachList().get(0).setP_id(p_id);

        log.info("이미지등록" + product.getAttachList().get(0).toString());

        mapper.insert(product.getAttachList().get(0));

    }
}
