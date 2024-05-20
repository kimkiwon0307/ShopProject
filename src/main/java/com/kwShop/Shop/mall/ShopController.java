package com.kwShop.Shop.mall;

import com.kwShop.Shop.admin.service.AdminService;
import com.kwShop.Shop.admin.vo.AttachImageVO;
import com.kwShop.Shop.admin.vo.Criteria;
import com.kwShop.Shop.admin.vo.PageDTO;
import com.kwShop.Shop.admin.vo.ProductVO;
import com.kwShop.Shop.mall.service.BucketService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/shop/*")
@Slf4j
public class ShopController {

    private final AdminService service;
    private final BucketService bucketService;

    public ShopController(AdminService service, BucketService bucketService){
        this.bucketService = bucketService;
        this.service = service;
    }

    
    @GetMapping({"/main","/main2"})
    public void mainPage(Model model, Criteria cri,  HttpServletRequest request) throws  Exception{

        log.info("메인페이지");

        int total = service.productTotal(cri);

        PageDTO pageMaker = new PageDTO(cri, total);

        List<ProductVO> productss = service.productList(cri);

        List<ProductVO> product = new ArrayList<>();


        for(ProductVO products : productss){
            log.info("C:\\upload2\\"+products.getAttachUploadPath()+"/"+products.getAttachUuid()+"_"+products.getAttachFilename());

            products.setAttachUploadPath(products.getAttachUploadPath().replaceAll("\\\\","\\\\\\\\"));

            log.info("여기야" + products.getAttachUploadPath());

            product.add(products);
        }


        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("product", product);


    }




    @GetMapping({"/get","/get2"})
    public void getPage(@RequestParam("p_id") int p_id, Criteria cri, Model model){

        log.info("상품 조회 페이지");

        model.addAttribute("product", service.productGet(p_id));
        model.addAttribute("cri", cri);

    }


    @GetMapping("/getAttachList")
    @ResponseBody
    public ResponseEntity<List<AttachImageVO>> getAttachList(@RequestParam("p_id") int p_id) {

        return new ResponseEntity<>(service.productImages(p_id), HttpStatus.OK);
    }

    @GetMapping("/AllAttachList")
    @ResponseBody
    public ResponseEntity<List<AttachImageVO>> AllAttachList() {

        return new ResponseEntity<>(service.AllImages(), HttpStatus.OK);
    }



    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(@RequestParam("fileName") String fileName) {

        log.info("fileName: " + fileName);

        File file = new File(fileName);

        log.info("file: " + file);

        ResponseEntity<byte[]> result = null;

        try {

            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (IOException e) {

            e.printStackTrace();
        }
        return result;
    }

    @GetMapping("/getBucketSize")
    @ResponseBody
    public int getSize(@RequestParam("member_id") String member_id, Model model){

        return bucketService.list(member_id).size();

    }


}
