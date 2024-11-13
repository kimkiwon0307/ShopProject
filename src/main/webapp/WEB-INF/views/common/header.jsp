<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <!DOCTYPE html>

            <html>

            <head>
                <meta charset="UTF-8">
                <title>kiwon's shop mall</title>


                    <meta charset="utf-8">
                    <title>kiwon's shop mall'</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">


                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/shop/main/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/shop/main/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/shop/main/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/shop/main/css/style.css" rel="stylesheet">


            </head>

            <body>

        <!-- Navbar start -->
              <div class="container-fluid fixed-top">
                  <div class="container px-0">
                      <nav class="navbar navbar-light bg-white navbar-expand-xl">
                          <a href="/shop/main" class="navbar-brand"><h1 class="text-primary display-6">kiwon's mall</h1></a>
                          <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                              <span class="fa fa-bars text-primary"></span>
                          </button>

                          <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                              <div class="navbar-nav mx-auto">
                                  <a href="/shop/main" class="nav-item nav-link active">SHOP</a>
                                  <a href="/qna/main" class="nav-item nav-link active">Q & A</a>
                           </div>


                              <div class="d-flex m-3 me-0">
                                  <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                                  <c:if test="${member != null }" >
                                  <a href="/bucket/main?member_id=${member.member_id}" class="position-relative me-4 my-auto">

                                  </a>
                                  </c:if>
                                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 profile-menu">
                                              <li class="nav-item dropdown">

                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                  <i class="fas fa-user fa-2x"></i>
                                                </a>

                                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <c:if test="${member == null }" >
                                                  <li><a class="dropdown-item" href="/member/login"> 로그인</a></li>
                                                  <li><a class="dropdown-item" href="/member/join"> 회원가입</a></li>
                                                 </c:if>
                                                   <c:if test = "${member.adminCk == 1 }">
                                                         <li><a class="dropdown-item" href="/admin/main"> 관리자 페이지 </a></li>
                                                  </c:if>
                                                  <li><hr class="dropdown-divider"></li>
                                                  <c:if test="${member != null }" >
                                                    <li><a class="dropdown-item"><i class="bi bi-cash-coin"></i> 충전 금액 : ${member.money} 원</a></li>
                                                    <li><a class="dropdown-item"><i class="bi bi-coin"></i> 충전 포인트 : ${member.point} 원</a></li>
                                                   <li>  <a class="dropdown-item" href="/member/profile?member_id=${member.member_id}"><i class="bi bi-file-earmark-person" ></i> 내정보</a></li>
                                                   <li><a class="dropdown-item" id="logout_btn"><i class="fas fa-sign-out-alt fa-fw"></i> 로그아웃</a></li>
                                                  </c:if>
                                                </ul>
                                              </li>
                                           </ul>
                              </div>
                          </div>
                      </nav>
                  </div>
              </div>
              <!-- Navbar End -->



