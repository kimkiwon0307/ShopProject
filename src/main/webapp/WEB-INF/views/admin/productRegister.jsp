<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="../common/adminHeader.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰 관리자 페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    #productRegister{
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

               <form role="form" method="post" action="/admin/productRegister" id="formObj" >

                      <div class="form-group" style="margin-bottom:20px;">
                            <label for="product_name"><span class="badge bg-primary">분류</span></label>
                            <select class="form-select" name="p_categoryCode">
                              <option value="1" class="bg-secondary text-light">1.상의</option>
                              <option value="2" class="bg-secondary text-light">2.하의</option>
                              <option value="3" class="bg-secondary text-light">3.아우터</option>
                              <option value="4" class="bg-secondary text-light">4.원피스</option>
                              <option value="5" class="bg-secondary text-light">5.속옷</option>
                            </select>
                      </div>


                     <div class="form-group" style="margin-bottom:20px;">
                           <label for="product_name"><span class="badge bg-primary">상품 이름</span></label>
                           <input type="text" class="form-control" name="p_name" placeholder="상품 이름을 입력하세요"/>
                       </div>

                   <div class="form-group" style="margin-bottom:20px;">
                     <label for="product_price"><span class="badge bg-primary">상품 가격</span></label>
                     <input type="number" class="form-control" name="p_price" placeholder="상품 가격을 입력하세요" >
                   </div>

                    <div class="form-group" style="margin-bottom:20px;">
                      <label for="product_price"><span class="badge bg-primary">상품 할인율</span></label>
                      <input type="number" class="form-control" name="p_discount" placeholder="상품 할인율을 입력하세요. (1.00 ~ 99.00)" >
                    </div>


                    <div class="form-group" style="margin-bottom:20px;">
                      <label for="product_price"><span class="badge bg-primary">등록 제목</span></label>
                      <input type="text" class="form-control" name="p_title"  placeholder="상품 등록 제목을 입력하세요" >
                    </div>

                    <div class="form-group" style="margin-bottom:20px;">
                       <label for="product_price"><span class="badge bg-primary">등록 내용</span></label>
                       <input type="text" class="form-control"  name="p_content" placeholder="상품 판매 내용을 입력하세요." >
                    </div>
                    <div class="form-group" style="margin-bottom:20px;">
                        <label for="product_price"><span class="badge bg-primary">상품 수량</span></label>
                        <input type="number" class="form-control" name="p_quantity" placeholder="상품 수량을 입력하세요." >
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
                        <button type="submit" class="btn btn-primary" id="product_register_btn1">상품 등록</button>
                        <button type="button" class="btn btn-danger" id="cancle_btn">취소</button>
                </div>
                </form>
            </div>
        </div>
    </div>

      <!-- Footer-->
            <footer class="py-5 bg-dark" style="margin-top : 20px;">
                <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
            </footer>
    <!-- Bootstrap JS 및 필요한 기타 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

   <script>
          $(document).ready(function(){

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