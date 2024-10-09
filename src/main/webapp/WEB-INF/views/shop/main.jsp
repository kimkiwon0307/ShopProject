<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>kiwon's shop mall </title>
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

        <!-- Libraries Stylesheet -->
        <link href="/shop/main/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="/shop/main/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="/shop/main/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
        <!-- Template Stylesheet -->
        <link href="/shop/main/css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


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
                            <a href="/qna/main" class="nav-item nav-link active">CHAT</a>
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


        <!-- slide start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container">
                <div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://cdn.pixabay.com/photo/2017/06/20/22/14/man-2425121_1280.jpg" style="height:550px"
                                class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="https://cdn.pixabay.com/photo/2016/08/05/02/14/gum-1571460_1280.jpg" style="height:550px"
                                class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="https://cdn.pixabay.com/photo/2017/08/05/00/12/girl-2581913_1280.jpg" style="height:550px"
                                class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <!-- - slide End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>제품</h1>
                            <br>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach items="${product}" var="product">
                                        <!-- 상품-->
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                             <a class="move"  href='<c:out value="${product.p_id}"/>'>
                                                <div class="result-${product.p_id}">

                                                </div>
                                            </a>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4><c:out value="${product.p_name}"/></h4>
                                                    <p><c:out value="${product.p_content}"/></p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0"> <fmt:formatNumber value="${product.p_price}" pattern="#,###"/> 원</p>
                                                        <c:if test="${member != null }" >
                                                          <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary bucket_btn" id="${product.p_id}">
                                                          <i class="fa fa-shopping-bag me-2 text-primary"></i>장바구니</a>
                                                        </c:if>
                                                         <c:if test="${member == null }" >
                                                           <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary bucket_noLoginBtn" id="${product.p_id}">
                                                                 <i class="fa fa-shopping-bag me-2 text-primary"></i>장바구니</a>
                                                         </c:if>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                          <form id="moveForm" action="/shop/main" method="get">
                                               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                               <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                               <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                                           </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Start -->

      <div class="container">
        <footer class="py-3 my-4">
          <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
          </ul>
          <p class="text-center text-body-secondary">&copy; 2024 Company, Inc</p>
        </footer>
      </div>
        <!-- Footer End -->

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/shop/main/lib/easing/easing.min.js"></script>
    <script src="/shop/main/lib/waypoints/waypoints.min.js"></script>
    <script src="/shop/main/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/shop/main/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/shop/main/js/main.js"></script>

        <!-- jquery -->
           <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
           <script>

                $(document).ready(function(){




                   let moveForm = $('#moveForm');

                   /* 페이지 이동 버튼 */
                   $(".page-item a").on("click", function(e){

                       e.preventDefault();

                       moveForm.find("input[name='pageNum']").val($(this).attr("href"));

                       moveForm.submit();

                   });

                   	var searchForm = $('#searchForm');


                   $("#searchBtn").on("click", function(e){

                                   		e.preventDefault();

                                   		/* 검색 키워드 유효성 검사 */
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
                           });


                   $(".move").on("click", function(e) {
                       e.preventDefault();

                       moveForm.append("<input type='hidden' name='p_id' value='"+$(this).attr("href") + "'>");
                       moveForm.attr("action", "/shop/get");
                       moveForm.submit();

                   });

                    <c:forEach items="${product}" var="product">


                      var uploadPath ='<c:out value="${product.attachUploadPath}"/>';
                      var uuid = '<c:out value="${product.attachUuid}"/>';

                      var filename = '<c:out value="${product.attachFilename}"/>';
                      var uploadResult = $(".result-${product.p_id}");
                      var fileCallPath = encodeURIComponent("C:\\upload2\\"+uploadPath+"/"+uuid+"_"+filename);
                     // var fileCallPath = encodeURIComponent("//tmp//img//"+uploadPath+"/"+uuid+"_"+filename);
                      var imageTag = '<img src="/shop/display?fileName=' + fileCallPath + '" class="card-img-top" alt="..."  style="height:368px;">';

                       uploadResult.append(imageTag);

                   </c:forEach>

                   $(".bucket_btn").on("click",function(){


                        var productPrice = $(this).parent().find(".text-dark").text().trim().replace("원", "").replace(",","").replace(",","").trim();;
                        var quantity = 1;
                        var p_id = $(this).attr('id');
                        var member_id = '<c:out value="${member.member_id}"/>';

                var data = {
                    price: productPrice,
                    p_id: p_id,
                    quantity: quantity,
                    member_id : member_id
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
                         if(confirm("장바구니로 이동하시겠습니까?")){
                            location.href = "/bucket/main?member_id=" + member_id;
                         }
                    },
                    error: function(xhr, status, error) {
                         console.error("전송 실패:", error);
                    }
                }); // ajax

              });

              $(".bucket_noLoginBtn").on("click",function(){

                                      alert("로그인후 이용가능합니다.");
                                      location.href="/member/login";
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



               });//  $(document).ready(function()
           </script>

    </body>

</html>