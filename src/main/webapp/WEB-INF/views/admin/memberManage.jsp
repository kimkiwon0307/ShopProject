<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
                      /* 페이지네이션을 수평으로 표시 */
                               .pagination {
                                display: flex;         /* Flexbox를 사용하여 수평으로 나열 */
                                   list-style: none;      /* 리스트 스타일 제거 */
                                 padding-left: 0;      /* 기본 패딩 제거 */
                                  margin: 0;            /* 기본 마진 제거 */
                             }

                                  .pagination .page-item {
                               margin: 0;            /* 페이지 항목 간의 마진 제거 */
                              }

                                      .pagination .page-link {
                                  display: block;       /* 링크를 블록 요소로 설정하여 클릭 영역을 확장 */
                                  padding: 0.5rem 0.75rem; /* 기본 패딩 */
                               margin: 0;            /* 링크 간의 마진 제거 */
                                 }


                </style>
</head>

<body>


       <!-- Navbar start -->
       <div class="container-fluid fixed-top">

           <div class="container px-0">
               <nav class="navbar navbar-light bg-white navbar-expand-xl">

                   <!-- 로고 -->
                   <a href="/shop/main" class="navbar-brand">
                       <h1 class="text-primary display-6">Shoe Heaven</h1>
                   </a>

                   <!-- 가운데 home, Q&A -->
                   <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                       <div class="navbar-nav mx-auto">
                           <a href="/shop/main" class="nav-item nav-link">Home</a>

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
              <button class="btn btn-success">회원 목록</button>
          </div>
          <div class="card-body">
              <table class="table table-striped text-center">
                  <thead>
                      <tr>
                          <th scope="col">회원 아이디</th>
                          <th scope="col">회원 이름</th>
                          <th scope="col">이메일</th>
                          <th scope="col">관리자 여부</th>
                          <th scope="col">회원 가입일</th>
                          <th scope="col">삭제</th>
                      </tr>
                  </thead>

                  <tbody>
                      <c:forEach items="${members}" var="member">
                          <tr>
                              <td><c:out value="${member.member_id}" /></td>
                              <td><c:out value="${member.member_name}" /></td>
                              <td><c:out value="${member.member_mail}" /></td>
                              <td><c:out value="${member.adminCk}" /></td>
                              <td>
                                  <fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd" />
                              </td>
                              <td>
                                  <button type="button" class="btn btn-warning d_Mbtn" data-member_id="<c:out value='${member.member_id}' />"> 삭제 </button>
                              </td>
                          </tr>
                      </c:forEach>
                  </tbody>
              </table>
          </div>
      </div>


      <!-- 검색 영역 -->
      <div class="d-flex justify-content-center">
          <form id="searchForm" action="/admin/memberManage" method="get">
              <div class="input-group">
                  <input type="text" name="keyword" class="form-control" value="<c:out value='${pageMaker.cri.keyword}'/>">
                  <input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum}'/>">
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                  <div class="mt-2 ms-2">
                      <button class="btn btn-primary" type="submit">검 색</button>
                      <button class="btn btn-primary" id="resetBtn" type="button">초기화</button>
                  </div>
              </div>
          </form>
      </div>

            <br>

      <!-- 페이징 -->
      <nav aria-label="Page navigation example">
          <ul class="pagination pagination-sm justify-content-center">
              <c:if test="${pageMaker.prev}">
                  <li class="page-item"><a class="page-link" href="${pageMaker.pageStart -1}">이전</a></li>
              </c:if>
              <c:forEach var="num" begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}">
                  <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}"><a class="page-link" href="${num}">${num}</a></li>
              </c:forEach>
              <c:if test="${pageMaker.next}">
                  <li class="page-item"><a class="page-link" href="${pageMaker.pageEnd + 1}">다음</a></li>
              </c:if>
          </ul>
      </nav>

      <form id="moveForm" action="/admin/memberManage" method="get">
          <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
          <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
          <input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>">
          <input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type}'/>">
      </form>
       <!-- 페이징 end-->

         </div>
    </div>
    <%@include file="../common/footer.jsp"%>
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