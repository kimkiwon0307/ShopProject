<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../common/header.jsp"%>


        <!-- Single Product Start -->
        <div class="container-fluid py-5 mt-5">
            <div class="container d-flex justify-content-center">

                    <div class="col-lg-8 col-xl-9">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="border rounded" id="uploadResult"">

                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h1 class="fw-bold mb-3"><c:out value="${product.p_title}"/></h1>
                                <p class="mb-3">상품번호: <c:out value="${product.p_id}"/></p>
                                <h5 class="fw-bold mb-3" style="text-decoration: line-through;">정가 : <fmt:formatNumber value="${product.p_price}" pattern="#,###"/>원</h5>
                                <h5 class="fw-bold mb-3" >할인율 : <fmt:formatNumber value="${product.p_discount}" pattern="#,###"/> %</h5>

                              <c:set var="discountedPrice" value="${product.p_price - (product.p_price * (product.p_discount / 100.0))}" />

                              <h5 class="fw-bold mb-3">
                                  판매가 : <fmt:formatNumber value="${discountedPrice}" type="number" maxFractionDigits="0"/>원
                              </h5>

                              <!-- 갯수변경 -->
                                <div class="input-group quantity mb-5" style="margin-top:50px; width: 200px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>

                                    <input type="text" class="form-control form-control-sm text-center border-0" value="1" id="quantityValue">

                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>

                     <h5 class="fw-bold mb-3">
                         최종가 : <span id="finalPrice"><fmt:formatNumber value="${discountedPrice}" type="number" maxFractionDigits="0"/></span> 원
                     </h5>

                                 <c:if test="${member != null}">
                                     <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" id="bucketBtn" style="margin-top:20px;"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니</a>
                                 </c:if>
                            </div>

                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">리뷰</button>
                                    </div>
                                </nav>
                                <br>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">

                                    </div>

                                    <div class="tab-pane active" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">

                                    </div>

                                </div>
                            </div>
                            <form action="#">
                                <h4 class="mb-5 fw-bold">리뷰 남기기</h4>
                                <div class="row g-4">
                                    <div class="col-lg-6">
                                        <div class="border-bottom rounded">
                                          <c:if test="${member != null}">
                                               <input type="text" class="form-control" id="r_replyer" name="r_replyer" value="${member.member_id}" readOnly>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="border-bottom rounded">
                                         <c:if test="${member != null}">
                                              <input type="text" class="form-control" id="p_id" name="p_id" value="<c:out value="${product.p_id}"/>" readOnly>
                                        </c:if>
                                         </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="border-bottom rounded my-4">
                                           <c:if test="${member == null}">
                                            <textarea name="r_reply" id="r_reply" class="form-control " cols="30" rows="8" placeholder="로그인 후 작성 가능합니다." spellcheck="false" readOnly></textarea>
                                          </c:if>
                                         <c:if test="${member != null}">
                                           <textarea name="r_reply" id="r_reply" class="form-control " cols="30" rows="8" placeholder="리뷰를 작성하세요." spellcheck="false"></textarea>
                                       </c:if>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                     <c:if test="${member != null}">
                                            <a href="#" id="reply_btn" class="btn border border-secondary text-primary rounded-pill px-4 py-3" style="float:right;"> 리뷰 등록</a>
                                     </c:if>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

   <!-- Footer Start -->

  <footer class="py-3 bg-dark" style="position:relative; transform : translateY(80%); width:100%; height:120px;">
         <br>
         <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2024</p></div>
    </footer>



    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/shop/main/lib/easing/easing.min.js"></script>
    <script src="/shop/main/lib/waypoints/waypoints.min.js"></script>

    <script src="/shop/main/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/shop/main/js/main.js"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script>

    $(document).ready(function(){

        var p_id = '<c:out value="${product.p_id}"/>';
        var uploadResult = $("#uploadResult");


        $.getJSON("/shop/getAttachList", {p_id : p_id}, function(arr){

                var str ="";
                var obj = arr[0];

                var fileCallPath = encodeURIComponent("C:\\upload2\\"+obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
                //var fileCallPath = encodeURIComponent("//tmp//img//"+obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
		        str += "<img src='/shop/display?fileName=" + fileCallPath + "'class='img-fluid rounded' alt='Slide 2'>";
		        str += "</div>";
		        uploadResult.html(str);
        });

        //리뷰 달기
        $("#reply_btn").on("click", function(e) {
                e.preventDefault();

                var formData = new FormData();
                formData.append('p_id', $('#p_id').val());
                formData.append('r_replyer', $('#r_replyer').val());
                formData.append('r_reply', $('#r_reply').val());

                $.ajax({
                    type: "POST",
                    url: "/reply/insert",
                    data: formData,
                    processData: false,  // 데이터를 문자열로 변환하지 않음
                    contentType: false,  // 컨텐츠 타입을 설정하지 않음
                    success: function(response) {
                        console.log("전송 성공!");
                        console.log("서버 응답:", response);
                        alert("리뷰 등록 되었습니다.");
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        console.error("전송 실패:", error);

                    }
                });

        });

        // 리뷰 목록
        $.getJSON("/reply/list?p_id=" + p_id , function(data) {

            var str ="";
            var review_body = $("#nav-mission");

            var member_id = '<c:out value="${member.member_id}"/>';
            for (var i = 0; i < data.length; i++) {


            str += "<div class='d-flex'>"; // 닫는 div 태그가 누락되어 있었습니다.
            str += "<img src='/shop/main/img/avatar.jpg' class='img-fluid rounded-circle p-3' style='width: 100px; height: 100px;' alt=''>";
            str += "<div>"; // p 태그 앞에 div 태그가 열려야 합니다.
            str += "<h5>" + data[i].r_replyer + "</h5>";
            str += "<p>" + data[i].r_reply + "</p>";
            if(member_id === data[i].r_replyer || member_id === 'admin'){
              str += "<button class='btn btn-danger dRplyBtn' style='float:right' data-r_no='" + data[i].r_no + "'> 삭제 </button>";
              str += "<button class='btn btn-info uRplyBtn' data-r_no='"+data[i].r_no +"'style='margin-right: 5px''> 수정 </button>";
            }

            str += "</div>";

            str += "</div>";


               }
            review_body.append(str);
        });

        // 최종가

        $('.btn-plus').on("click",function(e){


            var finalPrice = $('#quantityValue').val() * ${discountedPrice}  ;

            $('#finalPrice').text(finalPrice.toLocaleString());

        });

        $('.btn-minus').on("click",function(e){


            var finalPrice = $('#quantityValue').val() * ${discountedPrice}  ;

            $('#finalPrice').text(finalPrice.toLocaleString());

        });

        // 최종가


        // 수정 버튼 누르면 발동
        $(document).on("click",".uRplyBtn", function(){
            console.log("수정버튼");

            var newReply = prompt("수정할 내용을 입력하세요:"); // 사용자로부터 새로운 내용 입력 받기

            var formData = new FormData();
            formData.append('r_no', $(this).data('r_no'));
            formData.append('r_reply', newReply);


             $.ajax({
                    type: "PUT",
                    url: "/reply/update",
                    data: formData,
                    processData: false,  // 데이터를 문자열로 변환하지 않음
                    contentType: false,  // 컨텐츠 타입을 설정하지 않음
                    success: function(response) {
                        console.log("전송 성공!");
                        console.log("서버 응답:", response);
                        alert("댓글이 수정되었습니다.");
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        console.error("전송 실패:", error);
                    }
                }); // ajax

        });// 수정 버튼

           // 수정 버튼 누르면 발동
                $(document).on("click",".dRplyBtn", function(){
                    console.log("삭제버튼");

                    if(confirm("삭제합니까?")){

                    var formData = new FormData();
                    formData.append('r_no', $(this).data('r_no'));

                     $.ajax({
                            type: "DELETE",
                            url: "/reply/delete",
                            data: formData,
                            processData: false,  // 데이터를 문자열로 변환하지 않음
                            contentType: false,  // 컨텐츠 타입을 설정하지 않음
                            success: function(response) {
                                console.log("전송 성공!");
                                console.log("서버 응답:", response);
                                alert("댓글이 삭제되었습니다.");
                                location.reload();
                            },
                            error: function(xhr, status, error) {
                                console.error("전송 실패:", error);
                            }
                        }); // ajax
                        }else {
                            return;
                        }
                });// 수정 버튼



         // 장바구니 버튼 눌렀을때.
         $("#bucketBtn").on("click",function(){


                var price =  <c:out value="${product.p_price}"/>; // 상품 가격
                var quantity = $('#quantityValue').val(); // 상품 갯수
                var finalPrice = price * quantity; // 상품 가격 * 상품 갯수 = 최종금액
                var p_id = '<c:out value="${product.p_id}"/>'; // 상품 번호
                var member_id = '<c:out value="${member.member_id}"/>';


                var data = {
                    price: finalPrice,
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
                         location.reload();
                    },
                    error: function(xhr, status, error) {
                         console.error("전송 실패:", error);
                    }
                }); // ajax
         });
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
                                              var member_id = '<c:out value="${member.member_id}"/>';
                                                  $.getJSON("/shop/getBucketSize", {member_id : member_id}, function(size){
                                                        console.log("사이즈" + size);

                                                        var str ="";


                                                        str += "<i class='fa fa-shopping-bag fa-2x'></i>";
                                                        str += "<span class='position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1' style='top: -5px; left: 15px; height: 20px; min-width: 20px;'>" + size + "</span>";

                                                        $(".my-auto").append(str);




                                                        });



    });

</script>



    </body>

</html>