<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Shopping Mall Project</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

        <!-- Libraries Stylesheet -->
        <link href="/test/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="/test/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/test/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/test/css/style.css" rel="stylesheet">

    </head>

    <body>


        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>



       <!-- Navbar start -->
       <div class="container-fluid fixed-top">
           <div class="container topbar bg-primary d-none d-lg-block">
               <div class="d-flex justify-content-between">
                   <div class="top-info ps-2">
                       <small class="me-3">
                           <i class="fas fa-map-marker-alt me-2 text-secondary"></i>
                           <a href="#" class="text-white">김기원 공부용 사이트</a>
                       </small>
                       <small class="me-3">
                           <i class="fas fa-envelope me-2 text-secondary"></i>
                           <a href="#" class="text-white">kkw0307@naver.com</a>
                       </small>
                   </div>
               </div>
           </div>
           <div class="container px-0">
               <nav class="navbar navbar-light bg-white navbar-expand-xl">

                   <!-- 로고 -->
                   <a href="/shop/main" class="navbar-brand">
                       <h1 class="text-primary display-6">Shoe Heaven</h1>
                   </a>


                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                   <!-- 가운데 home -->
                   <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                       <div class="navbar-nav mx-auto">
                           <a href="/shop/main" class="nav-item nav-link active">Home</a>

                       </div>

                       <!-- 오른쪽 검색, 장바구니, 프로필 -->
                       <div class="d-flex m-3 me-0 align-items-center">

                           <!-- 검색 버튼 -->
                           <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal">
                               <i class="fas fa-search text-primary"></i>
                           </button>

                           <!-- 장바구니 로그인한 후 표시 -->
                           <c:if test="${member != null }">
                               <a href="/bucket/main?member_id=${member.member_id}" class="position-relative me-4 my-auto"></a>
                           </c:if>

                           <!-- 프로필 메뉴 -->
                           <ul class="navbar-nav ms-auto mb-2 mb-lg-0 profile-menu">
                               <li class="nav-item dropdown">
                                   <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                       <i class="fas fa-user fa-2x"></i>
                                   </a>

                                   <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                       <!-- 회원이 없을 경우 로그인/회원가입 링크 -->
                                       <c:if test="${member == null }">
                                           <li><a class="dropdown-item" href="/member/login"> 로그인</a></li>
                                           <li><a class="dropdown-item" href="/member/join"> 회원가입</a></li>
                                       </c:if>

                                       <!-- 관리자인 경우 관리자 페이지 링크 -->
                                       <c:if test="${member.adminCk == 1}">
                                           <li><a class="dropdown-item" href="/admin/main"> 관리자 페이지 </a></li>
                                       </c:if>

                                       <li><hr class="dropdown-divider"></li>

                                       <!-- 회원이 있을 경우 충전 금액, 포인트 및 내 정보, 로그아웃 링크 -->
                                       <c:if test="${member != null }">
                                           <li><a class="dropdown-item"><i class="bi bi-cash-coin"></i> 충전 금액 : ${member.money} 원</a></li>
                                           <li><a class="dropdown-item" href="/order/orderList?member_id=${member.member_id}"><i class="bi bi-file-earmark-person"></i> 주문목록</a></li>
                                           <li><a class="dropdown-item" href="/member/profile?member_id=${member.member_id}"><i class="bi bi-file-earmark-person"></i> 내정보</a></li>
                                           <li><a class="dropdown-item" id="logout_btn" style="cursor: pointer;"><i class="fas fa-sign-out-alt fa-fw"></i> 로그아웃</a></li>
                                       </c:if>

                                   </ul>
                               </li>
                           </ul>

                       </div> <!-- d-flex end -->
                   </div> <!-- navbar-collapse end -->
               </nav>
           </div> <!-- container px-0 end -->
       </div> <!-- container-fluid end -->
       <!-- Navbar End -->



           <!-- Modal Search Start -->
                <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content rounded-0">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body d-flex align-items-center">
                                <form id="searchForm" action="/shop/main" method="get" style="width:100%;">
                                     <div class="input-group w-75 mx-auto d-flex">
                                          <input type="text" name="keyword" class="form-control p-3"  aria-describedby="search-icon-1" placeholder="키워드" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                                          <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                                          <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                                          <span id="search-icon-1" class="input-group-text p-3"><button type="button" class="btn btn info" id="searchBtn">검색</button></span>
                                    </div>
                               </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Search End -->

        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">shopping mall project</h4>
                        <h1 class="mb-5 display-3 text-primary">shoe heaven</h1>
                    </div>

                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">

                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="https://cdn.pixabay.com/photo/2019/08/20/02/13/boots-4417595_640.jpg" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Man</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="https://cdn.pixabay.com/photo/2017/07/25/14/50/shoes-2538424_640.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Woman</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="https://cdn.pixabay.com/photo/2014/09/03/20/15/shoes-434918_640.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Kid</a>
                                </div>
                            </div>

                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>

                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Hero End -->
