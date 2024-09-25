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

         <link href="https://cdn.datatables.net/2.1.3/css/dataTables.bootstrap5.css" rel="stylesheet">

            <!-- 위지웍 -->
         <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.0.0/ckeditor5.css">

          <style>
            .ck-content {
                height : 350px;
            }
          </style>

    </head>


<body>
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

    <div class="container mt-5">

        <!-- 글작성 폼 -->
        <div class="card mt-5">
            <div class="card-header">
              <button  class="btn btn-success" id="product_register_btn"> 작성완료 </button>
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

                      <div class="form-group" style="margin-bottom:20px;">
                           <label for="product_name"><span class="badge bg-primary">번호</span></label>
                           <input type="text" class="form-control" name="q_no" value="${qna.q_no}" readonly = "readonly"/>
                       </div>


                     <div class="form-group" style="margin-bottom:20px;">
                           <label for="product_name"><span class="badge bg-primary">제목</span></label>
                           <input type="text" class="form-control" name="q_title" value="${qna.q_title}" readonly = "readonly"/>
                       </div>

                        <div class="form-group" style="margin-bottom:20px;">
                           <label for="product_name"><span class="badge bg-primary">작성자</span></label>
                           <input type="text" class="form-control" name="q_writer" value="${qna.q_writer}" readonly = "readonly"/>
                       </div>



                    <div class="form-group" style="margin-bottom:20px;">
                       <label for="product_price"><span class="badge bg-primary">내용</span></label>
                       <textarea id="editor" name="q_content" disabled>
                            <c:out value="${qna.q_content}"/>
                       </textarea>
                    </div>
<!--
                <div class="form-group" style="margin-bottom:20px;">
                    <label for="product_image"><span class="badge bg-primary">첨부파일</span></label>
                    </br>
                    <input type="file" id="product_image" name="uploadFile" style="height: 30px;" multiple>
                </div>

                <div id='uploadResult'>
                	<ul id="uUl">
                	</ul>
                </div>
   -->
                <div>
                     <c:if test="${member.member_id == qna.q_writer}">

                     </c:if>
                         <button type="button" class="btn btn-primary" id="update_btn">수정</button>
                         <button type="button" class="btn btn-danger" id="list_btn">목록</button>
                </div>

            </div>
        </div>

        <form id='operForm' action="/qna/update" method="get">
            <input type='hidden' id='q_no' name='q_no' value='<c:out value="${qna.q_no}"/>'>
            <input type='hidden' id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
            <input type='hidden' id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>

        </form>

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


    <!-- Bootstrap JS 및 필요한 기타 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>


    <!-- 워지윅 에디터 -->
  		<script type="importmap">
			{
				"imports": {
					"ckeditor5": "https://cdn.ckeditor.com/ckeditor5/43.0.0/ckeditor5.js",
					"ckeditor5/": "https://cdn.ckeditor.com/ckeditor5/43.0.0/"
				}
			}
		</script>
		<script type="module">
			import {
				ClassicEditor,
				Essentials,
				Paragraph,
				Bold,
				Italic,
				Font
			} from 'ckeditor5';
			ClassicEditor
				.create( document.querySelector( '#editor' ), {
					plugins: [ Essentials, Paragraph, Bold, Italic, Font ],
					toolbar: [
						'undo', 'redo', '|', 'bold', 'italic', '|',
						'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor'
					]
				} )
				.then( editor => {
					window.editor = editor;
				} )
				.catch( error => {
					console.error( error );
				} );
		</script>
		<!-- A friendly reminder to run on a server, remove this during the integration. -->
		<script>
			window.onload = function() {
				if ( window.location.protocol === 'file:' ) {
					alert( 'This sample requires an HTTP server. Please serve this file with a web server.' );
				}
			};
		</script>
      <!-- 워지윅 에디터 -->

   <script>


          $(document).ready(function(){

             var q_no = "${qna.q_no}";

            $("#update_btn").on("click",function(e){

                    e.preventDefault();
                    operForm.submit();

            });

            var operForm = $("#operForm");

            $("#list_btn").on("click",function(e){

                    e.preventDefault();
                    operForm.attr("action","/qna/main");

                    operForm.submit();
            });


             var formObj = $("#formObj");
             var obj;

             // 유효성 검사 변수
             var product_name = false;
             var product_price = false;
             var product_discount = false;
             var product_title = false;
             var product_content = false;
             var product_quantity = false;
             var product_image = false;

              // 상품등록 버튼 눌렀을때
                $("#product_register_btn1").on("click",function(e){

                       e.preventDefault();

                       var p_name = $("input[name='p_name']").val();
                       var p_price = $("input[name='p_price']").val();
                       var p_discount = $("input[name='p_discount']").val();
                       var p_title = $("input[name='p_title']").val();
                       var p_content = $("input[name='p_content']").val();
                       var p_quantity = $("input[name='p_quantity']").val();
                       var p_image = $("input[name='uploadFile']").val();

                      if (!p_name || p_name === "undefined") {
                            alert("상품 이름을 등록하세요.");
                       }else{
                            product_name = true;
                       }

                        if (!p_price || p_price === "undefined") {
                            alert("상품 가격을 등록하세요.");
                       }else{
                            product_price = true;
                       }

                      if (!p_discount || p_discount === "undefined") {
                            alert("할인율을 등록하세요. (1% ~ 99%)");
                       }else{
                            p_discount = true;
                       }

                      if (!p_title || p_title === "undefined") {
                            alert("상품 설명 제목을 입력하세요.");
                       }else{
                            product_title = true;
                       }

                      if (!p_content || p_content === "undefined") {
                            alert("상품 설명 내용을 등록하세요.");
                       }else{
                            product_content = true;
                       }

                      if (!p_quantity || p_quantity === "undefined") {
                            alert("상품 수량을 등록하세요.");
                       }else{
                            product_quantity = true;
                       }

                       if(!p_image || p_image === "undefined"){
                            alert("이미지를 등록하세요.")
                       }else{
                            product_image = true;
                       }

                    if(product_name && product_price && product_discount && product_title && product_content && product_quantity && product_image ){

                       var formObj = $("form[role='form']");
                       var str = "";
                       var uploadResult = $("#uploadResult");

                        str += "<input type='hidden' name='attachList[0].fileName' value='"+ obj.fileName +"'>";
                        str += "<input type='hidden' name='attachList[0].uuid' value='"+ obj.uuid +"'>";
                        str += "<input type='hidden' name='attachList[0].uploadPath' value='"+ obj.uploadPath +"'>";

                        uploadResult.append(str);

                        formObj.submit();

                    }
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
                   if(confirm("정말 삭1제하시겠습니까?")){
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
                 })

          });



   </script>

</body>

</html>