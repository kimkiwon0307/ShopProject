# 쇼핑몰 사이트 - 개인프로젝트 (2024/04/22 ~ 진행중)

## 개발환경

Front-End

* HTML5/CSS3/JAVASCRIPT
* jQuery / AJax
* BootStrap Framework

Back-End

* JAVA
* JSP/Servlet
* Spring Boot
* Mybatis
* Tomcat

Data-Base
* MySQL

## 패키지 구조
![image](https://github.com/kimkiwon0307/ShopProject/assets/46276548/338a93cb-78d6-454a-a8a7-847cd02c8a36)


## 주요기능
### * 회원 기능 : 회원 CRUD, 아이디 및 비밀번호 중복확인, 다음주소API, 이메일 인증 구현
![image](https://github.com/kimkiwon0307/ShopProject/assets/46276548/e10e7430-e53a-4197-b6a9-e7fe3fb0966a)

### * 상품 기능 : 상품 CRUD, 리뷰 기능 구현
![image](https://github.com/kimkiwon0307/ShopProject/assets/46276548/84d5ac33-f13c-4bbb-b1c0-3a408df766e0)
![image](https://github.com/kimkiwon0307/ShopProject/assets/46276548/70c3b8b8-441e-491b-8150-5d3c270c66de)

### * 관리자 기능 : 상품 및 회원 CRUD 구현
![image](https://github.com/kimkiwon0307/ShopProject/assets/46276548/23555686-a164-4f0b-9fb1-6bc209c86f20)

### * 공통기능 - vaildation
![image](https://github.com/kimkiwon0307/ShopProject/assets/46276548/831f8449-63f6-45bd-ad2d-d77cdf3e4bf1)

### * 문제 및 해결 방법
<ul> 
  문제 1. formData로 만들어서 ajax로 보낼 시 해당 컨트롤러에서 매핑을 못하는 문제 발생
  해결 :  @RequestParam 을 사용하여 들어오는 파라미터의 이름을 지정해줌
</ul>

