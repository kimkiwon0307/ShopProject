package com.kwShop.Shop.order.controller;

import com.kwShop.Shop.admin.service.AdminService;
import com.kwShop.Shop.admin.vo.*;
import com.kwShop.Shop.main.service.BucketService;
import com.kwShop.Shop.main.vo.BucketVO;
import com.kwShop.Shop.member.service.MemberService;
import com.kwShop.Shop.member.vo.MemberPageDTO;
import com.kwShop.Shop.member.vo.MemberVO;
import com.kwShop.Shop.order.service.OrderService;
import com.kwShop.Shop.order.vo.Order;
import com.kwShop.Shop.order.vo.OrderItem;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/order/*")
@Slf4j
@RequiredArgsConstructor
public class OrderController {

    private final OrderService service;
    private final MemberService memberService;
    private final BucketService bucketService;

        @PostMapping("/orderProduct")
        @ResponseBody
        public ResponseEntity<String> orderProduct(@RequestBody Order order, HttpSession session) throws Exception {

            int result = 0;

            for (OrderItem o :  order.getOrderItemList()) {
                result += o.getTotalPrice().intValue();
            };


            MemberVO member = memberService.profile(order.getMember_id());

            if(member.getMoney() >= result ) {

                log.info("남은돈 {}", member.getMoney() - result);
                member.setMoney(member.getMoney() - result);
                memberService.memberUpdate(member);
                session.setAttribute("member", member);

              for (int b : order.getB_id()) {
                  bucketService.delete(b);
              }



                service.insertOrder(order);

                return  new ResponseEntity<>(HttpStatus.OK);
            }else {
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }

        }

        @GetMapping("/orderList")
        public void orderList(String member_id, Model model) throws Exception {

            List<Order> orderList = service.orderedList("member_id");
            model.addAttribute("orderList", orderList);

            log.info(orderList.toString());
        }


}
