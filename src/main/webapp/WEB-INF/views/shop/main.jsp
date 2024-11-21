<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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

        <!--
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
       -->


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

                   <!-- 가운데 home, Q&A -->
                   <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                       <div class="navbar-nav mx-auto">
                           <a href="/shop/main" class="nav-item nav-link active">Home</a>
                           <a href="/shop/Qna" class="nav-item nav-link">Q & A</a>
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
                                           <li><a class="dropdown-item"><i class="bi bi-coin"></i> 충전 포인트 : ${member.point} 원</a></li>
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
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Child</a>
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


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>Our Shoes</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;">All Products</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                        <span class="text-dark" style="width: 130px;">Man</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                        <span class="text-dark" style="width: 130px;">Woman</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                        <span class="text-dark" style="width: 130px;">Kid</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </div>

                   <div class="tab-content">
                       <div id="tab-1" class="tab-pane fade show p-0 active">
                           <div class="row g-4">
                               <div class="col-lg-12">
                                   <div class="row g-4">

                                       <!-- 상품 목록 반복 -->
                                       <c:forEach items="${product}" var="product">
                                           <div class="col-md-6 col-lg-4 col-xl-3">
                                               <div class="rounded position-relative fruite-item">
                                                   <!-- 결과 영역 -->
                                                   <div class="result-${product.p_id}"></div>

                                                   <!-- 상품 태그 -->
                                                   <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                       <c:choose>
                                                           <c:when test="${product.p_categoryCode == 1000}">Man</c:when>
                                                           <c:when test="${product.p_categoryCode == 2000}">Woman</c:when>
                                                           <c:when test="${product.p_categoryCode == 3000}">Kid</c:when>
                                                       </c:choose>
                                                   </div>

                                                   <!-- 상품 정보 -->
                                                   <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                       <!-- 상품 이름 -->
                                                       <h4><c:out value="${product.p_name}" /></h4>

                                                       <!-- 상품 내용 -->
                                                       <p><c:out value="${product.p_content}" /></p>

                                                       <div class="d-flex justify-content-between flex-lg-wrap">
                                                           <!-- 상품 가격 -->
                                                           <p class="text-dark fs-5 fw-bold mb-0">
                                                               <fmt:formatNumber value="${product.p_price}" pattern="#,###" /> 원
                                                           </p>

                                                           <!-- 장바구니 버튼 (로그인 여부에 따라 다르게 표시) -->
                                                           <c:if test="${member != null}">
                                                               <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary bucket_btn" id="${product.p_id}">
                                                                   <i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart
                                                               </a>
                                                           </c:if>

                                                           <c:if test="${member == null}">
                                                               <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary bucket_noLoginBtn" id="${product.p_id}">
                                                                   <i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart
                                                               </a>
                                                           </c:if>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                       </c:forEach>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
            </div>
        </div>
        <!-- Fruits Shop End-->


   <!-- Footer Start -->
             <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
                 <div class="container py-5">
                     <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                         <div class="row g-4">
                             <div class="col-lg-3">
                                 <a href="#">
                                     <h1 class="text-primary mb-0">Fruitables</h1>
                                     <p class="text-secondary mb-0">Fresh products</p>
                                 </a>
                             </div>
                             <div class="col-lg-6">
                                 <div class="position-relative mx-auto">
                                     <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email">
                                     <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                                 </div>
                             </div>
                             <div class="col-lg-3">
                                 <div class="d-flex justify-content-end pt-3">
                                     <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                     <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                     <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                     <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="row g-5">
                         <div class="col-lg-3 col-md-6">
                             <div class="footer-item">
                                 <h4 class="text-light mb-3">Why People Like us!</h4>
                                 <p class="mb-4">typesetting, remaining essentially unchanged. It was
                                     popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                                 <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                             </div>
                         </div>
                         <div class="col-lg-3 col-md-6">
                             <div class="d-flex flex-column text-start footer-item">
                                 <h4 class="text-light mb-3">Shop Info</h4>
                                 <a class="btn-link" href="">About Us</a>
                                 <a class="btn-link" href="">Contact Us</a>
                                 <a class="btn-link" href="">Privacy Policy</a>
                                 <a class="btn-link" href="">Terms & Condition</a>
                                 <a class="btn-link" href="">Return Policy</a>
                                 <a class="btn-link" href="">FAQs & Help</a>
                             </div>
                         </div>
                         <div class="col-lg-3 col-md-6">
                             <div class="d-flex flex-column text-start footer-item">
                                 <h4 class="text-light mb-3">Account</h4>
                                 <a class="btn-link" href="">My Account</a>
                                 <a class="btn-link" href="">Shop details</a>
                                 <a class="btn-link" href="">Shopping Cart</a>
                                 <a class="btn-link" href="">Wishlist</a>
                                 <a class="btn-link" href="">Order History</a>
                                 <a class="btn-link" href="">International Orders</a>
                             </div>
                         </div>
                         <div class="col-lg-3 col-md-6">
                             <div class="footer-item">
                                 <h4 class="text-light mb-3">Contact</h4>
                                 <p>Address: 1429 Netus Rd, NY 48247</p>
                                 <p>Email: Example@gmail.com</p>
                                 <p>Phone: +0123 4567 8910</p>
                                 <p>Payment Accepted</p>

                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <!-- Footer End -->




    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/test/lib/easing/easing.min.js"></script>
    <script src="/test/lib/waypoints/waypoints.min.js"></script>
    <script src="/test/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/test/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/test/js/main.js"></script>


    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>

      $(document).ready(function() {

          // member_id 가져오기
          var member_id = '<c:out value="${member.member_id}"/>';

          // 장바구니 사이즈 가져오기
          $.getJSON("/shop/getBucketSize", { member_id: member_id }, function(size) {
              console.log("사이즈: " + size);

              // 장바구니 아이콘과 사이즈 표시
              var str = "";
              str += "<i class='fa fa-shopping-bag fa-2x'></i>";
              str += "<span class='position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1' style='top: -5px; left: 15px; height: 20px; min-width: 20px;'>" + size + "</span>";

              // 장바구니 아이콘을 원하는 위치에 추가
              $(".my-auto").append(str);
          });

          // 로그아웃 버튼 클릭 시 start
          $("#logout_btn").on("click", function(e) {

              $.ajax({
                  type: "post",
                  url: "/member/logout",
                  success: function() {
                      alert("로그아웃 되었습니다.");
                      self.location = "/shop/main";  // 로그아웃 후 메인 페이지로 이동
                  }
              }); // ajax
          }); // 로그아웃 버튼 클릭 시 end

          // 상품 이미지 추가
          <c:forEach items="${product}" var="product">
              var uploadPath = '<c:out value="${product.attachUploadPath}"/>';
              var uuid = '<c:out value="${product.attachUuid}"/>';
              var filename = '<c:out value="${product.attachFilename}"/>';
              var uploadResult = $(".result-${product.p_id}");
              var fileCallPath = encodeURIComponent("C:\\upload2\\" + uploadPath + "/" + uuid + "_" + filename);

              var imageTag = '<img src="/shop/display?fileName=' + fileCallPath + '" class="img-fluid w-100 rounded-top" style="height:368px;">';
              uploadResult.append(imageTag);
          </c:forEach>

          // 로그인 후 장바구니 추가 버튼 클릭시 start
          $(".bucket_btn").on("click", function(e) {

              e.preventDefault();

              var productPrice = $(this).parent().find(".text-dark").text().trim().replace("원", "").replace(",", "").trim();
              var quantity = 1;
              var p_id = $(this).attr('id');
              var member_id = '<c:out value="${member.member_id}"/>';

              var data = {
                  price: productPrice,
                  p_id: p_id,
                  quantity: quantity,
                  member_id: member_id
              };

              $.ajax({
                  type: "POST",
                  url: "/bucket/insert",
                  contentType: 'application/json',
                  data: JSON.stringify(data),
                  success: function(response) {
                      console.log("전송 성공!");
                      console.log("서버 응답:", response);
                      alert("장바구니에 담겼습니다.");
                      if (confirm("장바구니로 이동하시겠습니까?")) {
                          location.href = "/bucket/main?member_id=" + member_id;
                      }
                  },
                  error: function(xhr, status, error) {
                      console.error("전송 실패:", error);
                  }
              }); // ajax
          }); // 로그인 후 장바구니 추가 버튼 클릭시 end

            // 비로그인 상태 장바구니 눌렀을 경우 start
           $(".bucket_noLoginBtn").on("click",function(e){

                e.preventDefault();

                alert("로그인후 이용가능합니다.");
                location.href="/member/login";
           });// 비로그인 상태 장바구니 눌렀을 경우 end

        // 검색 폼 변수 정의
        var searchForm = $('#searchForm');

        // 검색 버튼 클릭 이벤트 처리
        $("#searchBtn").on("click", function(e) {
            e.preventDefault(); // 기본 동작(폼 제출) 방지

            // 검색 키워드 유효성 검사
            var keyword = searchForm.find("input[name='keyword']").val();
            if (!keyword) {
                alert("키워드를 입력하십시오"); // 키워드 미입력 시 알림
                return false; // 이벤트 중단
            }

            // 페이지 번호 초기화
            searchForm.find("input[name='pageNum']").val("1");

            // 폼 제출
            searchForm.submit();
        });

        // 리셋 버튼 클릭 이벤트 처리
        $("#resetBtn").on("click", function() {
            // 키워드 필드 초기화
            searchForm.find("input[name='keyword']").val('');

            // 폼 제출
            searchForm.submit();
        });



      }); // $(document).ready(function())


    </script>


    </body>

</html>