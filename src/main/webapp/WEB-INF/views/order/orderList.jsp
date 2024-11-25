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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/test/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/test/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/test/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/test/css/style.css" rel="stylesheet">

</head>

<body>

       <!-- Navbar start -->
         <div class="container-fluid">

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

         <div class="container">
             <table class="table" style="margin: auto; text-align: center;">


                 <tr>
                     <td><h5>주문번호</h5></td>
                     <td><h5>상품</h5></td>
                     <td><h5>수량</h5></td>
                     <td><h5>가격</h5></td>
                     <td><h5>주문날짜</h5></td>
                     <td><h5>주문상태</h5></td>
                 </tr>



              <c:forEach items="${orderList}" var="order">
                  <tr>
                      <c:choose>
                          <c:when test="${prev_order_id != order.order_id}">
                              <!-- 주문번호 -->
                              <td style="width: 180px; text-align: center; vertical-align: middle; " >
                                  <h5 class="fw-bold mb-3">${order.order_id}</h5>
                              </td>
                          </c:when>
                          <c:otherwise>
                              <td style="width: 180px; text-align: center; vertical-align: middle;">
                                  <h5 class="fw-bold mb-3"></h5>
                              </td>
                          </c:otherwise>
                      </c:choose>

                      <!-- 상품 -->
                      <td style="width: 180px; text-align: center; vertical-align: middle;">
                          <a href="/shop/productGet?p_id=${order.product_id}">
                              <h5 class="fw-bold mb-3">${order.product_name}</h5>
                          </a>
                      </td>

                      <!-- 수량 -->
                      <td style="width: 180px; text-align: center; vertical-align: middle;" data-name="${item.p_name}">
                          <h5 class="fw-bold mb-3">${order.product_quantity}</h5>
                      </td>

                      <!-- 가격 -->
                      <td style="width: 230px; text-align: center; vertical-align: middle;" data-price="${item.p_price}" data-discount="${item.p_discount}">
                          <h5 class="fw-bold mb-3" style="text-decoration: line-through;">
                              정가 : <fmt:formatNumber value="${order.product_price * order.product_quantity}" pattern="#,###" />원
                          </h5>
                          <h5 class="fw-bold mb-3">
                              할인율 : <fmt:formatNumber value="${order.product_discount}" pattern="#,###" /> %
                          </h5>
                          <c:set var="discountedPrice" value="${order.product_price - (order.product_price * (order.product_discount / 100.0))}" />
                          <h5 class="fw-bold mb-3" data-totalPrice="${discountedPrice * order.product_quantity}">
                              판매가 : <fmt:formatNumber value="${discountedPrice * order.product_quantity}" type="number" maxFractionDigits="0" />원
                          </h5>
                      </td>

                      <!-- 주문날짜 -->
                      <td style="width: 150px; text-align: center; vertical-align: middle;">
                          <h5><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd" /></h5>
                      </td>


                      <!-- 삭제 버튼 -->
                      <td style="width: 150px; text-align: center; vertical-align: middle; ">
                          <button type="button"  class="btn btn-success d_btn" data-b_id='<c:out value="${item.b_id}"/>'>
                              <i class="bi bi-trash"></i>
                              주문 완료
                          </button>

                      </td>




                  </tr>

                  <c:set var="prev_order_id" value="${order.order_id}" />
              </c:forEach>
             </table>


         </div>

         <br><br>

<%@include file="../common/footer.jsp"%>
                <!-- jquery -->
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <script>
                    $(document).ready(function () {



                        $("#logout_btn").on("click", function (e) {
                            $.ajax({
                                type: "post",
                                url: "/member/logout",
                                success: function () {
                                    alert("로그아웃 되었습니다.");
                                    self.location = "/shop/main";
                                }
                            }); // ajax

                        }); // logoutBtn

                        var member_id = '<c:out value="${member.member_id}"/>';

                        $.getJSON("/shop/getBucketSize", { member_id: member_id }, function (size) {
                            console.log("사이즈" + size);

                            var str = "";

                            str += "<i class='fa fa-shopping-bag fa-2x'></i>";
                            str += "<span class='position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1' style='top: -5px; left: 15px; height: 20px; min-width: 20px;'>" + size + "</span>";

                            $(".my-auto").append(str);

                        });


                     setTimeout(function() {
                            $('#disableButton').prop('disabled', true);
                             $('#disableButton').hide(); // 기존 버튼 숨기기
                             $('#newButton').show();     // 새로운 버튼 보이기

                        }, 5000); // 300000ms = 5분



                    }); //  $(document).ready(function () {


                </script>


                </body>

                </html>