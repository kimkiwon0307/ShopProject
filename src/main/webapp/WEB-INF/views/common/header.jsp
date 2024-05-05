<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  </head>
    <nav class="py-2 bg-light border-bottom">
       <div class="container d-flex flex-wrap">
         <ul class="nav me-auto">
              <c:if test="${member != null }" >


              </c:if>
         </ul>
         <ul class="nav">
           <c:if test="${member == null }" >
              <li class="nav-item"><a href="/member/login" class="nav-link link-dark px-2">로그인</a></li>
              <li class="nav-item"><a href="/member/join" class="nav-link link-dark px-2">회원가입</a></li>
           </c:if>
      <c:if test="${member != null }" >
         <div class="dropdown">
           <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
             ${member.member_id} 님
           </button>

           <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
             <li><a class="dropdown-item" id="logout_btn">로그아웃</a></li>
             <li><a class="dropdown-item" href="#">내정보</a></li>
              <c:if test = "${member.adminCk == 1 }">
                <li><a class="dropdown-item" href="/admin/main"> 관리자 페이지 </a></li>
              </c:if>
           </ul>
         </div>
     </c:if>
           <li class="nav-item"><a href="#" class="nav-link link-dark px-2">고객센터</a></li>
           <li class="nav-item">
                <a href="/bucket/main?member_id=${member.member_id}" class="nav-link link-dark px-2">
                <i class="bi-cart-fill me-1"></i>
                    장바구니</a></li>
         </ul>
       </div>
     </nav>
     <header class="py-3 mb-4 border-bottom">
       <div class="container d-flex flex-wrap justify-content-center">
         <a href="/shop/main" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
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
             <img src="https://cdn.pixabay.com/photo/2017/06/20/22/14/man-2425121_1280.jpg" style="height:550px" class="d-block w-100" alt="...">
           </div>
           <div class="carousel-item">
              <img src="https://cdn.pixabay.com/photo/2016/08/05/02/14/gum-1571460_1280.jpg" style="height:550px" class="d-block w-100" alt="...">
           </div>
           <div class="carousel-item">
              <img src="https://cdn.pixabay.com/photo/2017/08/05/00/12/girl-2581913_1280.jpg" style="height:550px" class="d-block w-100" alt="...">
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
       <!-- jquery -->
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
       <script>

        $(document).ready(function(){

                $("#logout_btn").on("click",function(e){
                  $.ajax({
                    type: "post",
                    url: "/member/logout",
                    success : function(){
                        alert("로그아웃 되었습니다.");
                        self.location = "/shop/main";
                    }
                  }); // ajax

                }); // logoutBtn
        });
       </script>

       <!-- End Example Code -->
     </body>
   </html>