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
    #memberManage{
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
                <button  class="btn btn-success"> 회원 목록 </button>
             </div>
                 <div class="card-body">
                             <table class="table table-striped" >
                                   <thead>
                                     <tr style="text-align:center">
                                       <th scope="col">회원 아이디</th>
                                       <th scope="col">회원 이름</th>
                                       <th scope="col">이메일</th>
                                        <th scope="col">관리자 여부</th>
                                       <th scope="col">회원 가입일</th>
                                       <th scope="col">삭제</th>
                                     </tr>
                                   </thead>
                                  <tbody id="productList">
                                  <c:forEach items="${members}" var="member">
                                     <tr style="text-align:center">
                                       <td><c:out value="${member.member_id}"/></td>
                                       <td><c:out value="${member.member_name}"/></td>
                                       <td><c:out value="${member.member_mail}"/></td>
                                       <td><c:out value="${member.adminCk}"/></td>
                                       <td><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd"/></td>
                                       <td><button type="button" class="btn btn-warning d_Mbtn" data-member_id='<c:out value="${member.member_id}"/>'>삭제</button></td>
                                     </tr>
                                  </c:forEach>
                                   </tbody>
                                </table>
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


            $("#product_register_btn").on("click",function(){
                formObj.show();
            }); //$("#product_register_btn").on("click",function()

            $("#cancle_btn").on("click",function(){
                formObj.hide();
            }); //  $("#cancle_btn").on("click",function()


           $("#product_list_btn").on("click",function(){


           }); //     $("#product_list_btn").on("click",function(){



                let moveForm = $('#moveForm');

                /* 페이지 이동 버튼 */
                $(".page-item a").on("click", function(e){

                    e.preventDefault();

                    moveForm.find("input[name='pageNum']").val($(this).attr("href"));

                    moveForm.submit();

                });

                	let searchForm = $('#searchForm');


                	$("#searchForm button").on("click", function(e){

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

                           // 멤버 삭제 버튼
                        $(document).on("click", ".d_Mbtn", function() {
                               var formData = new FormData();
                               formData.append('member_id',  $(this).data("member_id"));

                               if(confirm("정말 삭제하시겠습니까?")){
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

          });



   </script>

</body>

</html>