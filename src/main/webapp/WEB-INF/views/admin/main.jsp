<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="../common/header.jsp"%>
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

    <style>
        #productManage{
            display: inline-block;
            background-color: darkgray;
        }

        .list-group-item a {
            text-decoration: none;
            color: black;
        }

        /* 페이지네이션을 수평으로 표시 */
        .pagination {
            display: flex; /* Flexbox를 사용하여 수평으로 나열 */
            list-style: none; /* 리스트 스타일 제거 */
            padding-left: 0; /* 기본 패딩 제거 */
            margin: 0; /* 기본 마진 제거 */
        }

        .pagination .page-item {
            margin: 0; /* 페이지 항목 간의 마진 제거 */
        }

        .pagination .page-link {
            display: block; /* 링크를 블록 요소로 설정하여 클릭 영역을 확장 */
            padding: 0.5rem 0.75rem; /* 기본 패딩 */
            margin: 0; /* 링크 간의 마진 제거 */
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
        <h1 class="mb-4">상품 관리</h1>

      <div class="container mt-3">
         <ul class="list-group list-group-horizontal">
           <li class="list-group-item" id="productManage"><a href="/admin/main"> 상품 관리</a></li>
           <li class="list-group-item" id="productRegister"><a href="/admin/productRegister"> 상품 등록</a></li>
           <li class="list-group-item" id="memberManage"><a href="/admin/memberManage"> 회원 관리</a></li>
         </ul>
       </div>



        <!-- 상품 목록 -->
         <div class="card mt-5">
            <div class="card-header">
              <button  class="btn btn-success" id="product_list_btn"> 상품 목록 </button>
            </div>
            <div class="card-body">
                <table class="table table-striped" >
                      <thead>
                        <tr style="text-align:center">
                          <th scope="col">상품 번호</th>
                          <th scope="col">상품 분류</th>
                          <th scope="col">상품 이름</th>
                          <th scope="col">가격</th>
                          <th scope="col">할인율(%)</th>
                          <th scope="col">제목</th>
                          <th scope="col">내용</th>
                          <th scope="col">등록일</th>
                          <th scope="col">수정일</th>
                          <th scope="col">재고 수량</th>
                          <th scope="col">수정</th>
                          <th scope="col">삭제</th>
                        </tr>
                      </thead>
                     <tbody id="productList">
                     <c:forEach items="${products}" var="product">
                        <tr style="text-align:center">
                          <td><c:out value="${product.p_id}"/></td>
                           <td><c:out value="${product.p_categoryName}"/></td>
                           <td>
                             <a class="move"  href='<c:out value="${product.p_id}"/>'>
                                 <c:out value="${product.p_name}"/>
                             </a>
                          </td>
                          <td><c:out value="${product.p_price}"/></td>
                          <td><c:out value="${product.p_discount}"/></td>
                          <td><c:out value="${product.p_title}"/></td>
                          <td><c:out value="${product.p_content}"/></td>
                          <td><fmt:formatDate value="${product.p_date}" pattern="yyyy-MM-dd"/></td>
                          <td><fmt:formatDate value="${product.p_udate}" pattern="yyyy-MM-dd"/></td>
                          <td><c:out value="${product.p_quantity}"/></td>
                          <td><button type="button" class="btn btn-info u_btn"
                               data-p_id='<c:out value="${product.p_id}"/>'
                               data-p_name='<c:out value="${product.p_name}"/>'
                               data-p_price='<c:out value="${product.p_price}"/>'
                               data-p_discount='<c:out value="${product.p_discount}"/>'
                               data-p_title='<c:out value="${product.p_title}"/>'
                               data-p_content='<c:out value="${product.p_content}"/>'
                               data-p_quantity='<c:out value="${product.p_quantity}"/>'>수정</button></td>
                          <td><button type="button" class="btn btn-warning d_btn" data-p_id='<c:out value="${product.p_id}"/>'>삭제</button></td>
                        </tr>
                     </c:forEach>
                      </tbody>
                   </table>
            </div>


                <!-- 수정 모달 -->
                     <!-- 팝업 모달 -->
                     <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                       <div class="modal-dialog modal-dialog-centered">
                         <div class="modal-content">
                           <div class="modal-header">
                             <h5 class="modal-title" id="productModalLabel">상품 정보 입력</h5>
                             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                           </div>
                           <div class="modal-body">
                             <!-- 상품 정보 입력 폼 -->
                             <form id="modal_form" action="/admin/productUpdate" method="post" enctype="multipart/form-data">
                                <div class="form-group" style="margin-bottom:20px;">
                                  <label for="product_name"><span class="badge bg-primary">상품 번호</span></label>
                                  <input type="text" class="form-control" name="p_id" readonly = "readonly">
                                </div>

                               <div class="form-group" style="margin-bottom:20px;">
                                 <label for="product_name" ><span class="badge bg-primary">상품 이름</span></label>
                                 <input type="text" class="form-control" name="p_name" placeholder="상품 이름을 입력하세요" required>
                               </div>
                               <div class="form-group" style="margin-bottom:20px;">
                                 <label for="product_price"><span class="badge bg-primary">상품 가격</span></label>
                                 <input type="number" class="form-control" name="p_price" placeholder="상품 가격을 입력하세요" required>
                               </div>
                                <div class="form-group" style="margin-bottom:20px;">
                                  <label for="product_price"><span class="badge bg-primary">상품 할인율</span></label>
                                  <input type="number" class="form-control" name="p_discount" placeholder="상품 할인율 입력하세요" required>
                                </div>
                               <div class="form-group" style="margin-bottom:20px;">
                                 <label for="product_title"><span class="badge bg-primary">상품 등록 제목</span></label>
                                 <input type="text" class="form-control" name="p_title" placeholder="상품 제목을 입력하세요" required>
                               </div>
                               <div class="form-group" style="margin-bottom:20px;">
                                 <label for="product_content"><span class="badge bg-primary">상품 등록 내용</span></label>
                                 <input type="text" class="form-control" name="p_content" placeholder="상품 판매 내용" required>
                               </div>
                               <div class="form-group" style="margin-bottom:20px;">
                                 <label for="product_code"><span class="badge bg-primary">재고 수량</span></label>
                                 <input type="text" class="form-control" name="p_quantity" placeholder="상품 수량" required>
                               </div>
                               <div class="form-group" style="margin-bottom:20px;">
                                 <label for="product_image"><span class="badge bg-primary">상품 이미지</span></label>
                                 <!-- <input type="file" class="form-control" id="product_image" name="uploadFile" style="height: 30px;" multiple> -->
                                  <input type="file" id="product_image_update" name="uploadFile2" style="height: 30px;" >
                               </div>
                                        <div id='uploadResult2'>
                                               	<ul id="uUl">
                                               	</ul>
                                               </div>
                               <button type="submit" class="btn btn-primary" id="update_btn">수정</button>
                             </form>
                           </div>
                         </div>
                       </div>
                     </div>
                </div>
            <br>

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
        		<!--  Pagination -->
            	<nav aria-label="..."  class="custom-nav">
            		<ul class="pagination pagination-sm justify-content-center">
            				<c:if test="${pageMaker.prev}">
            					<li class="page-item">
            						<a class="page-link" href="${pageMaker.pageStart -1}">이전</a>
            					</li>

            				</c:if>

            				<c:forEach var="num" begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd }">
            				  <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
            				  	<a class="page-link" href="${num}">${num}</a>
            				  </li>
            				</c:forEach>

            				<c:if test="${pageMaker.next}">
            					<li class="page-item">
            						<a class="page-link" href="${pageMaker.pageEnd + 1}">다음</a>
            					</li>
            				</c:if>
            			</ul>
                  </nav>    <!-- 페이징 -->

         	        <form id="moveForm" action="/admin/main" method="get">
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

             var formObj = $("#formObj");


            $("#product_register_btn").on("click",function(){
                formObj.show();
            }); //$("#product_register_btn").on("click",function()

            $("#cancle_btn").on("click",function(){
                formObj.hide();
            }); //  $("#cancle_btn").on("click",function()


           $("#product_list_btn").on("click",function(){


           }); //     $("#product_list_btn").on("click",function(){



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

                  var obj;

                // 이미지 등록
                // $("input[type='file']").on("change", function(e){
                 $("#product_image").on("change",function(e){

                        var formData = new FormData();
                		var fileInput = $('input[name="uploadFile"]');
                        var fileList = fileInput[0].files;
                        var fileObj = fileList[0];


                    	if(!fileCheck(fileObj.name, fileObj.size)){
                    	    alert("잘못된 사진 또는 이름 입니다");
                        	return false;
                        }
                        for(let i = 0; i < fileList.length; i++){
                        	formData.append("uploadFiles", fileList[i]);
                        }

                        $.ajax({
                        	url: '/admin/uploadAjaxAction',
                        	processData : false,
                        	contentType : false,
                        	data : formData,
                        	type : 'POST',
                        	dataType : 'json',
                        	success: function(result){
                              obj = result[0];
                              console.log(obj);
                              var uploadResult = $("#uploadResult");
                              var uploadPath =obj.uploadPath;
                              var uuid = obj.uuid;
                              var filename = obj.fileName;
                              var fileCallPath = encodeURIComponent("C:\\upload2\\"+uploadPath+"/"+uuid+"_"+filename);
                          // var fileCallPath = encodeURIComponent("//tmp//img//"+uploadPath+"/"+uuid+"_"+filename);
                           var imageTag = '<div style="position: relative; display: inline-block;"> <img src="/shop/display?fileName=' + fileCallPath + '" class="card-img-top" alt="..." style="margin-bottom:20px;">' +
                                          '<button class="deleteImgBtn" style="position: absolute; top: 0; right: 0;" id="deleteImgBtn" data-imgpath =' + fileCallPath + '>  <i class="bi bi-x-circle"></i></button></div>';

                             uploadResult.append(imageTag);


                           },error: function(){
                                alert("이미지 업로드가 실패했습니다.");
                           }
                        });

                	});

                    $(".move").on("click", function(e) {
                       e.preventDefault();
                       moveForm.append("<input type='hidden' name='p_id' value='"+$(this).attr("href") + "'>");
                       moveForm.attr("action", "/admin/productGet");
                       moveForm.submit();

                   });


                    $("#product_image_update").on("change", function(e) {
                        e.preventDefault();

                        let formData = new FormData();
                        let fileInput = $('input[name="uploadFile2"]');
                        let fileList = fileInput[0].files;
                        let fileObj = fileList[0];



                        for (let i = 0; i < fileList.length; i++) {
                            formData.append("uploadFiles", fileList[i]);
                        }

                        $.ajax({
                            url: '/admin/uploadAjaxAction',
                            processData: false,
                            contentType: false,
                            data: formData,
                            type: 'POST',
                            processData: false,  // 데이터를 문자열로 변환하지 않음
                            contentType: false,  // 컨텐츠 타입을 설정하지 않음
                           // dataType: 'json',
                            success: function(result) {
                                obj = result[0];
                            },
                            error: function() {
                                alert("실패");
                            }
                        });

                        alert("통과");
                    });



                /* var, method related with attachFile */
                	let regex = new RegExp("(.*?)\.(jpg|png)$");
                	let maxSize = 1048576; //1MB

                	function fileCheck(fileName, fileSize){

                		if(fileSize >= maxSize){
                			alert("파일 사이즈 초과");
                			return false;
                		}

                		if(!regex.test(fileName)){
                			alert("해당 종류의 파일은 업로드할 수 없습니다.");
                			return false;
                		}

                		return true;
                	}



                // 상품등록 버튼 눌렀을때
                $("#product_register_btn1").on("click",function(e){

                       e.preventDefault();

                       var formObj = $("form[role='form']");
                       var str = "";
                       var uploadResult = $("#uploadResult");

                        str += "<input type='hidden' name='attachList[0].fileName' value='"+ obj.fileName +"'>";
                        str += "<input type='hidden' name='attachList[0].uuid' value='"+ obj.uuid +"'>";
                        str += "<input type='hidden' name='attachList[0].uploadPath' value='"+ obj.uploadPath +"'>";

                        uploadResult.append(str);

                        formObj.submit();
                });


                // 수정버튼
               $(document).on("click", ".u_btn", function() {
                    var p_id = $(this).data("p_id");
                    var p_name = $(this).data("p_name");
                    var p_price = $(this).data("p_price");
                    var p_discount = $(this).data("p_discount");
                    var p_title = $(this).data("p_title");
                    var p_content = $(this).data("p_content");
                    var p_quantity = $(this).data("p_quantity");

                    $("#productModal").find("[name=p_id]").val(p_id);
                    $("#productModal").find("[name=p_name]").val(p_name);
                    $("#productModal").find("[name=p_price]").val(p_price);
                    $("#productModal").find("[name=p_discount]").val(p_discount);
                    $("#productModal").find("[name=p_title]").val(p_title);
                    $("#productModal").find("[name=p_content]").val(p_content);
                    $("#productModal").find("[name=p_quantity]").val(p_quantity);

                    $("#productModal").modal("show");



               });

               //업로드 이미지 삭제 버튼
               $(document).on("click",".deleteImgBtn", function(e){

                    e.preventDefault();

                    var imgpath = $(this).data("imgpath");

                     var formData = new FormData();
                             formData.append('imgpath',  imgpath);

                                if(confirm("정말 삭제하시겠습니까?")){
                                   $.ajax({
                                       url: '/admin/deleteImage',
                                       type: 'DELETE',
                                       data: formData,
                                       processData: false,  // 데이터를 문자열로 변환하지 않음
                                       contentType: false,  // 컨텐츠 타입을 설정하지 않음
                                       success: function(response) {

                                            $("#uploadResult").empty();

                                            console.log("전송 성공!");
                                            console.log("서버 응답:", response);

                                         },
                                       error: function(xhr, status, error) {
                                             console.error("전송 실패:", error);
                                       }
                                   });

                                  }else{
                                   return;
                                   }


               });


               // 상품 삭제버튼
               $(document).on("click", ".d_btn", function() {
                   var p_id = $(this).data("p_id");
                   if(confirm(p_id + "번 상품을 삭제하시겠습니까?")){
                   $.ajax({
                       url: '/admin/ProductDelete',
                       type: 'POST',
                       data: { p_id: p_id }, // p_id를 데이터 객체에 속성으로 전달
                       dataType: 'json',
                       success: function(response){
                          if(response.success){
                            alert("상품이 삭제되었습니다.");
                            location.reload();
                          } else {
                            alert("삭제에 실패했습니다.");
                          }
                      },
                                   error: function() {
                                       alert("에러가 발생했습니다. 다시 시도해 주세요.");
                                   }
                   });

                  }else{
                   return;
                   }
               });

                // 상품 수정 버튼
                $("#update_btn").on("click",function(e){

                         e.preventDefault();

                         var formObj = $("#modal_form");
                         var str = "";
                         var uploadResult2 = $("#uploadResult2");

                          str += "<input type='hidden' name='attachList[0].fileName' value='"+ obj.fileName +"'>";
                          str += "<input type='hidden' name='attachList[0].uuid' value='"+ obj.uuid +"'>";
                          str += "<input type='hidden' name='attachList[0].uploadPath' value='"+ obj.uploadPath +"'>";

                          uploadResult2.append(str);

                          formObj.submit();

                          alert("수정되었습니다.");
                 })

          });



   </script>

</body>

</html>