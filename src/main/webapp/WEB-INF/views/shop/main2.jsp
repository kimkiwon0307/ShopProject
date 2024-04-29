<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
     <!-- Bootstrap icons-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  </head>
    <nav class="py-2 bg-light border-bottom">
       <div class="container d-flex flex-wrap">
         <ul class="nav me-auto">

         </ul>
         <ul class="nav">
           <li class="nav-item"><a href="#" class="nav-link link-dark px-2">로그인</a></li>
           <li class="nav-item"><a href="#" class="nav-link link-dark px-2">회원가입</a></li>
           <li class="nav-item"><a href="#" class="nav-link link-dark px-2">고객센터</a></li>
           <li class="nav-item"><a href="#" class="nav-link link-dark px-2"><i class="bi-cart-fill me-1"></i>장바구니 <span class="badge bg-dark text-white ms-1 rounded-pill">0</span></a></li>
         </ul>
       </div>
     </nav>
     <header class="py-3 mb-4 border-bottom">
       <div class="container d-flex flex-wrap justify-content-center">
         <a href="/" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
           <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
           <span class="fs-4">SHOP</span>
         </a>
         <form class="col-12 col-lg-auto mb-3 mb-lg-0">
           <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
         </form>
       </div>
     </header>
     <body class="p-3 m-0 border-0 bd-example m-0 border-0">

       <div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
         <div class="carousel-inner">
           <div class="carousel-item active">
             <img src="https://atimg.sonyunara.com/files/attrangs/new_banner/1714372741_0.jpg" class="d-block w-100" alt="...">
           </div>
           <div class="carousel-item">
              <img src="https://wingsmall.co.kr/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/939591303c9e8e1eece9669ee933aed8.jpg" class="d-block w-100" alt="...">
           </div>
           <div class="carousel-item">
              <img src="https://wingsmall.co.kr/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/2a6819d062b47b2561c529fd3c766f6b.jpg" class="d-block w-100" alt="...">
           </div>
         </div>
         <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
           <span class="carousel-control-prev-icon" aria-hidden="true"></span>
           <span class="visually-hidden">Previous</span>
         </button>
         <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
           <span class="carousel-control-next-icon" aria-hidden="true"></span>
           <span class="visually-hidden">Next</span>
         </button>
       </div>

       <!-- End Example Code -->
     </body>
   </html>