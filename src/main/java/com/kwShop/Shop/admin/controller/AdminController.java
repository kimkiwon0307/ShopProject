package com.kwShop.Shop.admin.controller;

import com.kwShop.Shop.admin.mapper.AdminMapper;
import com.kwShop.Shop.admin.service.AdminService;
import com.kwShop.Shop.admin.vo.AttachImageVO;
import com.kwShop.Shop.admin.vo.Criteria;
import com.kwShop.Shop.admin.vo.PageDTO;
import com.kwShop.Shop.admin.vo.ProductVO;
import com.kwShop.Shop.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdminController {


    private final AdminService service;
    private final MemberService memberService;
    public AdminController(AdminService service, MemberService memberService){
        this.service = service;
        this.memberService = memberService;
    }


    // 관리자 메인 페이지
    @GetMapping("/main")
    public void adminMain(Criteria cri,Model model) throws Exception {
        log.info("관리자 메인 페이지");

        int total = service.productTotal(cri);

        PageDTO pageMaker = new PageDTO(cri, total);

        model.addAttribute("product", service.productList(cri));
        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("members", memberService.memberList());
    }



    // 상품 등록
    @PostMapping("/productRegister")
    public String productRegister(ProductVO product) throws Exception{

        log.info("상품 등록");
        log.info(product.toString());

        if(product.getAttachList() == null){
            log.info("null");
        }else {
            log.info("NotNull");

            service.productRegister(product);
            service.ImageRegister(product, product.getP_id());

            log.info(product.getAttachList().toString());
        }
        return "redirect:/admin/main";
    }

    //상품 리스트
    @GetMapping("/productList")
    public void productList(Model model, Criteria cri) throws Exception{

        log.info("상품 리스트");
        model.addAttribute("list", service.productList(cri));

    }

    // 상품 수정
    @PostMapping("/productUpdate")
    public String productUpdate(ProductVO product) throws Exception{

        log.info("상품 수정");
        log.info(product.toString());

        service.productUpdate(product);


        return "redirect:/admin/main";
    }

    @PostMapping("/ProductDelete")
    @ResponseBody
    public void productDelete(@RequestParam("p_id") int p_id) throws Exception{

        log.info("상품 삭제" + p_id);

        service.productDelete(p_id);
    }

    @DeleteMapping("/MemberDelete")
    @ResponseBody
    public void memberDelete(@RequestParam("member_id") String member_id) throws Exception{

        log.info("멤버삭제" + member_id);

        memberService.deleteMember(member_id);
    }



    //파일업로드
    @PostMapping("/uploadAjaxAction")
    @ResponseBody
    public List<AttachImageVO> uploadAjaxPost(@RequestParam("uploadFiles") MultipartFile[] uploadFiles){
        log.info("파일업로드");

        String uploadFolder = "C:\\upload2";

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);

        String datePath = str.replace("-", File.separator);

        /* 폴더 생성 */
        File uploadPath = new File(uploadFolder, datePath);

        if(uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        /* 이미저 정보 담는 객체 */
        List<AttachImageVO> list = new ArrayList();


        for (MultipartFile uploadFile : uploadFiles){
            log.info("파일 이름 : " + uploadFile.getOriginalFilename());
            log.info("파일 타입 : " + uploadFile.getContentType());
            log.info("파일 크기 : " + uploadFile.getSize());

            // 이미지 정보 객체
            AttachImageVO vo = new AttachImageVO();

            /* 파일 이름 */
            String uploadFileName = uploadFile.getOriginalFilename();
            vo.setFileName(uploadFileName);
            vo.setUploadPath(datePath);

            /* uuid 적용 파일 이름 */
            String uuid = UUID.randomUUID().toString();
            vo.setUuid(uuid);

            uploadFileName = uuid + "_" + uploadFileName;

            /* 파일 위치, 파일 이름을 합친 File 객체 */
            File saveFile = new File(uploadPath, uploadFileName);

            /* 파일 저장 */
            try {
                uploadFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            list.add(vo);
        }
        return list;
    }







}
