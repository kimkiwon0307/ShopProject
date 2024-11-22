package com.kwShop.Shop.order.controller;

import com.kwShop.Shop.admin.service.AdminService;
import com.kwShop.Shop.admin.vo.*;
import com.kwShop.Shop.member.service.MemberService;
import com.kwShop.Shop.member.vo.MemberPageDTO;
import com.kwShop.Shop.order.service.OrderService;
import com.kwShop.Shop.order.vo.Order;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
@RequestMapping("/order/*")
@Slf4j
@RequiredArgsConstructor
public class OrderController {

    private final OrderService service;

        @PostMapping("/orderProduct")
        public void orderProduct(@RequestBody Order order) throws Exception {

            service.insertOrder(order);

        }

}
