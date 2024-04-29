 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">쇼핑몰</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/shop/main">Home</a></li>

<!--
                        <li class="nav-item"><a class="nav-link" href="/member/login">login</a></li>
                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="/member/login" role="button" data-bs-toggle="dropdown" aria-expanded="false">login</a>

                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li> -->
                    </ul>
                    <div class="login_success_area">
                        <c:if test="${member != null }" >

                               <div class="dropdown">
                                 <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                      <span> ${member.member_id}</span></a>
                                 </button>
                                 <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                   <li><a class="dropdown-item" href="#">충전 금액 : ${member.money}</a></li>
                                   <li><a class="dropdown-item" href="#">포인트 : ${member.point}</a></li>
                                   <li><a class="dropdown-item" href="#">내정보</a></li>
                                   <li><a class="dropdown-item"  id="logout_btn">로그아웃</a></li>
                                   <c:if test = "${member.adminCk == 1 }">
                                         <li><a class="dropdown-item" href="/admin/main"> 관리자 페이지 </a></li>
                                   </c:if>
                                 </ul>
                               </div>
                        </c:if>
                        <c:if test="${member == null}">
                            <button class="btn btn-blank"><a href="/member/login"> 로그인</a> </button>
                             <button class="btn btn-blank"><a href="/member/join"> 회원가입</a> </button>
                        </c:if>


                    </div>

                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>