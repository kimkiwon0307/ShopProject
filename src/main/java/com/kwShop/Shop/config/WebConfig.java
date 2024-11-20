package com.kwShop.Shop.config;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@AllArgsConstructor
public class WebConfig implements WebMvcConfigurer {


    private AdminIntercepter adminintercepter;
    private MemberIntercepter memberIntercepter;
    private BucketIntercepter bucketIntercepter;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(memberIntercepter).addPathPatterns("/member/profile");
        registry.addInterceptor(adminintercepter).addPathPatterns("/admin/**"); // 인터셉터를 적용할 URL 패턴
        registry.addInterceptor(bucketIntercepter).addPathPatterns("/bucket/**");
    }
}
