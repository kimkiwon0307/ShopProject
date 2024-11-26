package com.kwShop.Shop.admin.controller;

import com.kwShop.Shop.admin.mapper.AdminMapper;
import com.kwShop.Shop.admin.service.AdminService;
import com.kwShop.Shop.admin.vo.*;
import com.kwShop.Shop.member.service.MemberService;
import com.kwShop.Shop.member.vo.MemberPageDTO;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

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

        int total = service.productTotal(cri);

        log.info(cri.toString());

        PageDTO pageMaker = new PageDTO(cri, total);

        model.addAttribute("products", service.productList(cri));

        model.addAttribute("pageMaker", pageMaker);

        model.addAttribute("members", memberService.memberList(new com.kwShop.Shop.member.vo.Criteria()));

    }

    @GetMapping("/productRegister")
    public void productRegister(Model model){
        log.info("상품 등록 페이지 접속");
        model.addAttribute("categoryList", service.categoryList());
        model.addAttribute("product", new ProductVO());
    }

    // 상품 등록
    @PostMapping("/productRegister")
    public String productRegister(@Valid @ModelAttribute("product") ProductVO product, BindingResult bindingResult, Model model) throws Exception{


        if(bindingResult.hasErrors()){
            model.addAttribute("errors", bindingResult.getAllErrors());
            model.addAttribute("categoryList", service.categoryList());
            return "admin/productRegister";
        }
        log.info(product.toString());

        if(product.getAttachList() == null){

        }else {

            service.productRegister(product);
            service.ImageRegister(product, product.getP_id());
        }
        return "redirect:/admin/main";
    }


    //상품 리스트
    @GetMapping("/productList")
    public void productList(Model model, Criteria cri) throws Exception{
        service.productList(cri).forEach(i -> log.info(i.toString()));
        model.addAttribute("list", service.productList(cri));
    }

    // 상품 상세 페이지ㅣ
    @GetMapping("/productGet")
    public void productGet(int p_id, Criteria cri, Model model) throws Exception {

        model.addAttribute("cri", cri);
        model.addAttribute("product", service.productGet(p_id));
    }

    // 상품 수정
    @PostMapping("/productUpdate")
    public String productUpdate(ProductVO product) throws Exception {

        log.info("상품 수정");
        log.info(product.toString());

        service.productUpdate(product);


        return "redirect:/admin/main";
    }

    // 상품 삭제
    @PostMapping("/ProductDelete")
    @ResponseBody
    public Map<String, Object> productDelete(@RequestParam("p_id") int p_id) throws Exception{

        log.info("상품 삭제" + p_id);

        Map<String, Object> response = new HashMap<>();

        try{
            service.productDelete(p_id);
            response.put("success", true);

        }catch (Exception e){

            response.put("success", false);
        }

        return response;

    }

    //회원관리
    @GetMapping("/memberManage")
    public void memberManage(com.kwShop.Shop.member.vo.Criteria cri, Model model) throws Exception {

        log.info(cri.toString());

        model.addAttribute("members", memberService.memberList(cri));

        int total = memberService.memberTotal(cri);

        MemberPageDTO pageMaker = new MemberPageDTO(cri, total);

        model.addAttribute("pageMaker", pageMaker);

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
       // String uploadFolder = "//tmp//img";

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

                String thumbnailFileName = "thumb_" + uploadFileName;
                Path thumbnailPath = Paths.get(String.valueOf(uploadPath), thumbnailFileName);
                File thumbnailFile = thumbnailPath.toFile();

                Thumbnails.of(saveFile)
                        .size(200, 200) // 섬네일 크기 설정
                        .toFile(thumbnailFile);


            } catch (Exception e) {
                e.printStackTrace();
            }
            list.add(vo);
        }
        return list;
    }

    @GetMapping("/getSubCategories") // 중분류 배열 리스트
    @ResponseBody
    public List<CategoryVO> getSubCategories(@RequestParam("cateCode") int cateCode) throws Exception{

        log.info("카테고리코드" + cateCode);

        List<CategoryVO>list = service.subCategory(cateCode);

        return list;
    }

    @DeleteMapping("/deleteImage")
    @ResponseBody
    public void deleteImage(@RequestParam("imgpath") String imgpath){

        File file = new File(URLDecoder.decode(imgpath));

        file.delete();


    }

}
