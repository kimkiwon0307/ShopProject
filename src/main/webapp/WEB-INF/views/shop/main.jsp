<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="../common/header.jsp"%>

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
                                        <span class="text-dark" style="width: 130px;">Products</span>
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



    <%@ include file="../common/footer.jsp" %>

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