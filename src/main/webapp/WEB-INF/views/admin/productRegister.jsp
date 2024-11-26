<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
        #productRegister {
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
        <h1 class="mb-4">상품 등록 </h1>

      <div class="container mt-3">
         <ul class="list-group list-group-horizontal">
           <li class="list-group-item" id="productManage"><a href="/admin/main"> 상품 관리</a></li>
           <li class="list-group-item" id="productRegister"><a href="/admin/productRegister"> 상품 등록</a></li>
           <li class="list-group-item" id="memberManage"><a href="/admin/memberManage"> 회원 관리</a></li>
         </ul>
       </div>

        <!-- 상품 추가 폼 -->
        <div class="card mt-5">
            <div class="card-header">
              <button  class="btn btn-success" id="product_register_btn"> 상품 등록 </button>
            </div>

            <div class="card-body" id="product_register_card">

                          <c:if test="${not empty errors}">
                             <div class="alert alert-danger" role="alert">
                                 <strong>유효성 검사 에러:</strong>
                                    <ul>
                                       <c:forEach items="${errors}" var="error">
                                           <li>${error.defaultMessage}<br></li>
                                        </c:forEach>
                                    </ul>
                              </div>
                          </c:if>



                <form:form method="post" action="/admin/productRegister" modelAttribute="product" id="formObj">

                      <div class="form-group" style="margin-bottom:20px;">
                            <label for="product_name"><span class="badge bg-primary">대분류</span></label>
                            <select class="form-select" name="p_categoryCode" id="categorySelect">
                             <option selected value="none" class="bg-secondary text-light">대분류를 선택하세요</option>
                               <c:forEach items="${categoryList}" var="category">
                                <c:if test="${category.tier == 1}">
                                 <option value=${category.cateCode} class="bg-secondary text-light">${category.cateName}</option>
                                </c:if>
                               </c:forEach>
                            </select>
                      </div>

                     <div class="form-group" style="margin-bottom:20px;">
                             <label for="product_name"><span class="badge bg-primary">중분류</span></label>
                             <select class="form-select" name="p_categoryName" id="subCategorySelect" >
                                 <option selected value="none" class="bg-secondary text-light">중분류를 선택하세요</option>
                             </select>
                       </div>

                     <div class="form-group" style="margin-bottom:20px;">
                           <label for="product_name"><span class="badge bg-primary">상품 이름</span></label>
                                <form:input path="p_name" type="text" class="form-control" placeholder="이름을 입력하세요"/>
                                <form:errors path="p_name" cssClass="text-danger" />

                       </div>

                   <div class="form-group" style="margin-bottom:20px;">
                     <label for="product_price"><span class="badge bg-primary">상품 가격</span></label>
                       <form:input path="p_price" type="text"  class="form-control" placeholder="가격을 입력하세요" />
                       <form:errors path="p_price" cssClass="text-danger" />
                   </div>

                    <div class="form-group" style="margin-bottom:20px;">
                      <label for="product_price"><span class="badge bg-primary">상품 할인율</span></label>
                         <form:input path="p_discount" type="text" class="form-control" placeholder="할인율을 입력하세요"/>
                         <form:errors path="p_discount" cssClass="text-danger" />
                    </div>


                    <div class="form-group" style="margin-bottom:20px;">
                      <label for="product_price"><span class="badge bg-primary">등록 제목</span></label>
                        <form:input path="p_title" type="text"  class="form-control" placeholder="상품 등록 제목을 입력하세요"/>
                        <form:errors path="p_title" cssClass="text-danger" />
                    </div>

                    <div class="form-group" style="margin-bottom:20px;">
                       <label for="product_price"><span class="badge bg-primary">등록 내용</span></label>
                       <form:input path="p_content" type="text"  class="form-control" placeholder="상품 등록 내용을 입력하세요" />
                       <form:errors path="p_content" cssClass="text-danger" />
                    </div>
                    <div class="form-group" style="margin-bottom:20px;">
                        <label for="product_price"><span class="badge bg-primary">상품 수량</span></label>
                        <form:input path="p_quantity" type="text"  class="form-control" placeholder="상품 수량을 입력하세요"/>
                        <form:errors path="p_quantity" cssClass="text-danger" />
                    </div>
                <br>
                <div class="form-group" style="margin-bottom:20px;">
                    <label for="product_image"><span class="badge bg-primary">상품 이미지</span></label>
                    <input type="file" id="product_image" name="uploadFile" style="height: 30px;" multiple>
                </div>

                <div id='uploadResult'>
                	<ul id="uUl">
                	</ul>
                </div>
                <div>
                        <button type="submit" class="btn btn-primary" id="register_btn">상품 등록</button>
                        <button type="button" class="btn btn-danger" id="cancle_btn">취소</button>
                </div>
               </form:form>
            </div>
        </div>
    </div>
    <%@include file="../common/footer.jsp"%>

    <!-- Bootstrap JS 및 필요한 기타 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

   <script>
     $(document).ready(function() {

          $('#cancle_btn').on("click",function(e){
                self.location="/admin/main";
           })


         // 카테고리 중분류 선택
         $('#categorySelect').on('change', function() {

             var selectedCategory = $(this).val();

             if (selectedCategory === "none") {
                 return;
             }

             var url = 'getSubCategories?cateCode=' + selectedCategory;

             $.ajax({
                 url: url,
                 type: 'GET',
                 dataType: 'json',
                 success: function(subCategoryList) {
                     var $subCategorySelect = $('#subCategorySelect');

                     // 기존 옵션을 초기화하고 "중분류를 선택하세요" 옵션 추가
                     $subCategorySelect.html('<option selected value="none">중분류를 선택하세요</option>');

                     // 새로운 중분류 옵션 추가
                     $.each(subCategoryList, function(index, subCategory) {
                         var option = $('<option></option>')
                             .val(subCategory.cateName)  // 값 설정
                             .text(subCategory.cateName); // 텍스트 설정
                         $subCategorySelect.append(option);
                     });
                 },
                 error: function(xhr, status, error) {
                     console.error("Error: ", error);
                     console.log("Response Text: ", xhr.responseText); // 오류가 발생하면 서버 응답을 확인
                 }
             });
          });

             var formObj = $("#formObj");
             var obj; // obj가 어떻게 초기화되는지 확인 필요


          // 상품등록 버튼 눌렀을때
          $("#register_btn").on("click", function(e) {
              e.preventDefault();

              var p_image = $("input[name='uploadFile']").val();


              if (!p_image) {
                  alert("이미지를 등록하세요.");
              }


                  var str = "";
                  var uploadResult = $("#uploadResult");

                  str += "<input type='hidden' name='attachList[0].fileName' value='" + obj.fileName + "'>";
                  str += "<input type='hidden' name='attachList[0].uuid' value='" + obj.uuid + "'>";
                  str += "<input type='hidden' name='attachList[0].uploadPath' value='" + obj.uploadPath + "'>";

                  uploadResult.append(str);

                  alert("상품이 등록되었습니다.");

                  formObj.submit();



          });




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



                    /* 이미지 파일 체크 */
                	var regex = new RegExp("(.*?)\.(jpg|png)$");
                	var maxSize = 1048576; //1MB

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


               // 삭제버튼
               $(document).on("click", ".d_btn", function() {
                   var p_id = $(this).data("p_id");
                   if(confirm("정말 삭제하시겠습니까?")){
                   $.ajax({
                       url: '/admin/ProductDelete',
                       type: 'POST',
                       data: { p_id: p_id }, // p_id를 데이터 객체에 속성으로 전달
                       dataType: 'json'

                   });
                     location.reload();
                  }else{
                   return;
                   }
               });

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
                 });

          });



   </script>

</body>

</html>