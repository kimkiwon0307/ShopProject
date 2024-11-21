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
                //var fileCallPath = encodeURIComponent("//tmp//img//"+obj.uploadPath+"/"+obj.uuid+"_thumb_"+obj.fileName);
		        str += "<img src='/shop/display?fileName=" + fileCallPath + "'class='img-fluid rounded' alt='Slide 2'>";
		        str += "</div>";
		        console.log(fileCallPath);
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


            str += "<div class='d-flex'>";
            str += "<img src='/shop/main/img/avatar.jpg' class='img-fluid rounded-circle p-3' style='width: 100px; height: 100px;' alt=''>";
            str += "<div>";
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
         $("#bucketBtn").on("click",function(e){

                e.preventDefault();

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