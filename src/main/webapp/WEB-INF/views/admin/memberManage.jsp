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

                <style>
                #memberManage{
                     display: inline-block;
                     background-color: darkgray;
                }

                .list-group-item a{
                    text-decoration : none;
                    color: black;
                }


                </style>
</head>

<body>


       <!-- Navbar start -->
       <div class="container-fluid fixed-top">

           <div class="container px-0">
               <nav class="navbar navbar-light bg-white navbar-expand-xl">

                   <!-- 로고 -->
                   <a href="/shop/main2" class="navbar-brand">
                       <h1 class="text-primary display-6">Shoe Heaven</h1>
                   </a>

                   <!-- 가운데 home, Q&A -->
                   <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                       <div class="navbar-nav mx-auto">
                           <a href="/shop/main2" class="nav-item nav-link">Home</a>
                           <a href="/shop/Qna" class="nav-item nav-link">Q & A</a>
                       </div>

                       <!-- 오른쪽 검색, 장바구니, 프로필 -->
                       <div class="d-flex m-3 me-0 align-items-center">


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



    <div class="container mt-5">
        <h1 class="mb-4">회원 관리</h1>



      <div class="container mt-3">
         <ul class="list-group list-group-horizontal">
           <li class="list-group-item" id="productManage"><a href="/admin/main"> 상품 관리</a></li>
           <li class="list-group-item" id="productRegister"><a href="/admin/productRegister"> 상품 등록</a></li>
           <li class="list-group-item" id="memberManage"><a href="/admin/memberManage"> 회원 관리</a></li>
         </ul>
       </div>


        <!-- 회원 목록 -->
      <div class="card mt-5">
             <div class="card-header">
                <button  class="btn btn-success"> 회원 목록 </button>
             </div>
                 <div class="card-body">
                             <table class="table table-striped" >
                                   <thead>
                                     <tr style="text-align:center">
                                       <th scope="col">회원 아이디</th>
                                       <th scope="col">회원 이름</th>
                                       <th scope="col">이메일</th>
                                        <th scope="col">관리자 여부</th>
                                       <th scope="col">회원 가입일</th>
                                       <th scope="col">삭제</th>
                                     </tr>
                                   </thead>
                                  <tbody id="productList">
                                  <c:forEach items="${members}" var="member">
                                     <tr style="text-align:center">
                                       <td><c:out value="${member.member_id}"/></td>
                                       <td><c:out value="${member.member_name}"/></td>
                                       <td><c:out value="${member.member_mail}"/></td>
                                       <td><c:out value="${member.adminCk}"/></td>
                                       <td><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd"/></td>
                                       <td><button type="button" class="btn btn-warning d_Mbtn" data-member_id='<c:out value="${member.member_id}"/>'>삭제</button></td>
                                     </tr>
                                  </c:forEach>
                                   </tbody>
                                </table>
                         </div>


             <!-- 검색 영역 -->
         <div class="d-flex justify-content-center">
             <form id="searchForm" action="/admin/main" method="get">
                 <div class="input-group">
                     <input type="text" name="keyword" class="form-control" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                     <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                     <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                     <div class="mt-2 ms-2">
                         <button class="btn btn-primary" type="submit">검 색</button>
                         <button class="btn btn-primary" id="resetBtn" type="button">초기화</button>
                     </div>
                 </div>
             </form>
         </div>
            <br>
        	<!-- Pagination -->
            <nav aria-label="..." class="custom-nav">
                <ul class="pagination pagination-sm justify-content-center">
                    <!-- 이전 버튼 -->
                    <c:if test="${pageMaker.prev}">
                        <li class="page-item">
                            <a class="page-link" href="?pageNum=${pageMaker.pageStart - 1}">이전</a>
                        </li>
                    </c:if>

                    <!-- 페이지 번호 -->
                    <c:forEach var="num" begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}">
                        <li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
                            <a class="page-link" href="?pageNum=${num}">${num}</a>
                        </li>
                    </c:forEach>

                    <!-- 다음 버튼 -->
                    <c:if test="${pageMaker.next}">
                        <li class="page-item">
                            <a class="page-link" href="?pageNum=${pageMaker.pageEnd + 1}">다음</a>
                        </li>
                    </c:if>
                </ul>
            </nav>


         	        <form id="moveForm" action="/admin/memberManage" method="get">
         				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
         				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
         				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
         			</form>

         </div>
    </div>
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
                            <img src="img/payment.png" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>





            </div>
        </div>
        <!-- Footer End -->
    <!-- Bootstrap JS 및 필요한 기타 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

   <script>
          $(document).ready(function(){

                           // 멤버 삭제 버튼
                        $(document).on("click", ".d_Mbtn", function() {
                               var formData = new FormData();
                               formData.append('member_id',  $(this).data("member_id"));

                               var member_id = $(this).data("member_id");

                               if(confirm(member_id + " 회원을 삭제하시겠습니까?")){
                               $.ajax({
                                   url: '/admin/MemberDelete',
                                   type: 'DELETE',
                                   data: formData,
                                   processData: false,  // 데이터를 문자열로 변환하지 않음
                                   contentType: false,  // 컨텐츠 타입을 설정하지 않음
                                   success: function(response) {
                                        console.log("전송 성공!");
                                        console.log("서버 응답:", response);
                                        alert("회원이 삭제되었습니다.");
                                        location.reload();
                                     },
                                   error: function(xhr, status, error) {
                                         console.error("전송 실패:", error);
                                   }
                               });

                              }else{
                               return;
                               }
                           });

                             var moveForm = $('#moveForm');

                                           //페이지 이동
                                           $(".page-item a").on("click", function(e){

                                               e.preventDefault();

                                               moveForm.find("input[name='pageNum']").val($(this).attr("href"));

                                               moveForm.submit();

                                           });

                                               // 검색
                                           	var searchForm = $('#searchForm');

                                           	$("#searchForm button").on("click", function(e){

                                           		e.preventDefault();

                                           	// 검색 키워드 유효성 검사
                                           		if(!searchForm.find("input[name='keyword']").val()){
                                           			alert("키워드를 입력하십시오");
                                           			return false;
                                           		}
                                           		searchForm.find("input[name='pageNum']").val("1");

                                           		searchForm.submit();
                                           	});

                                           	$("#resetBtn").on("click",function(){

                                           	   searchForm.find("input[name='keyword']").val('');
                                                  searchForm.submit();
                                           	})


          });



   </script>

</body>

</html>