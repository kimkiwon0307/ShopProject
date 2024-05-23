<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

    </style>
</head>

<body>
    <div class="container mt-5">
        <h1 class="mb-4">관리자 페이지</h1>

        <!-- 상품 목록 -->
        <div class="card">
            <div class="card-header">
              <button  class="btn btn-success" id="product_list_btn"> 상품 목록 </button>
            </div>
            <div class="card-body">
                <table class="table table-striped" >
                      <thead>
                        <tr style="text-align:center">
                          <th scope="col">상품 번호</th>
                          <th scope="col">상품 이름</th>
                          <th scope="col">가격</th>
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
                     <c:forEach items="${product}" var="product">
                        <tr style="text-align:center">
                          <td><c:out value="${product.p_id}"/></td>
                          <td><c:out value="${product.p_name}"/></td>
                          <td><c:out value="${product.p_price}"/></td>
                          <td><c:out value="${product.p_title}"/></td>
                          <td><c:out value="${product.p_content}"/></td>
                          <td><fmt:formatDate value="${product.p_date}" pattern="yyyy-MM-dd"/></td>
                          <td><fmt:formatDate value="${product.p_udate}" pattern="yyyy-MM-dd"/></td>
                          <td><c:out value="${product.p_quantity}"/></td>
                          <td><button type="button" class="btn btn-info u_btn" data-p_id='<c:out value="${product.p_id}"/>'>수정</button></td>
                          <td><button type="button" class="btn btn-warning d_btn" data-p_id='<c:out value="${product.p_id}"/>'>삭제</button></td>
                        </tr>
                     </c:forEach>
                      </tbody>
                   </table>
            </div>

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

        <!-- 상품 추가 폼 -->
        <div class="card mt-5">
            <div class="card-header">
              <button  class="btn btn-success" id="product_register_btn"> 상품 추가 </button>
            </div>
            <div class="card-body" id="product_register_card">
                <form role="form" method="post" action="/admin/productRegister" id="formObj" style="display:none">

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
                     <input type="text" class="form-control"name="p_name" placeholder="상품 이름을 입력하세요" required>
                   </div>

                   <div class="form-group" style="margin-bottom:20px;">
                     <label for="product_price"><span class="badge bg-primary">상품 가격</span></label>
                     <input type="number" class="form-control" name="p_price" placeholder="상품 가격을 입력하세요" required>
                   </div>

                    <div class="form-group" style="margin-bottom:20px;">
                      <label for="product_price"><span class="badge bg-primary">상품 할인율</span></label>
                      <input type="number" class="form-control" name="p_discount" placeholder="상품 할인율을 입력하세요. (1.00 ~ 99.00)" required>
                    </div>


                    <div class="form-group" style="margin-bottom:20px;">
                      <label for="product_price"><span class="badge bg-primary">등록 제목</span></label>
                      <input type="text" class="form-control" name="p_title"  placeholder="상품 등록 제목을 입력하세요" required>
                    </div>

                    <div class="form-group" style="margin-bottom:20px;">
                       <label for="product_price"><span class="badge bg-primary">등록 내용</span></label>
                       <input type="text" class="form-control"  name="p_content" placeholder="상품 판매 내용을 입력하세요." required>
                    </div>
                    <div class="form-group" style="margin-bottom:20px;">
                        <label for="product_price"><span class="badge bg-primary">상품 수량</span></label>
                        <input type="number" class="form-control" name="p_quantity" placeholder="상품 수량을 입력하세요." required>
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
                        <button type="submit" class="btn btn-primary" id="product_register_btn1">상품 등록</button>
                        <button type="button" class="btn btn-danger" id="cancle_btn">취소</button>
                </form>
            </div>
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
                    <div class="form-group">
                      <label for="product_name">상품 번호</label>
                      <input type="text" class="form-control" name="p_id" required>
                    </div>


                   <div class="form-group">
                     <label for="product_name">상품 이름</label>
                     <input type="text" class="form-control" name="p_name" placeholder="상품 이름을 입력하세요" required>
                   </div>
                   <div class="form-group">
                     <label for="product_price">상품 가격</label>
                     <input type="number" class="form-control" name="p_price" placeholder="상품 가격을 입력하세요" required>
                   </div>
                   <div class="form-group">
                     <label for="product_title">상품 등록 제목</label>
                     <input type="text" class="form-control" name="p_title" placeholder="상품 제목을 입력하세요" required>
                   </div>
                   <div class="form-group">
                     <label for="product_content">상품 등록 내용</label>
                     <input type="text" class="form-control" name="p_content" placeholder="상품 판매 내용" required>
                   </div>
                   <div class="form-group">
                     <label for="product_code">재고 수량</label>
                     <input type="text" class="form-control" name="p_quantity" placeholder="상품 수량" required>
                   </div>
                   <div class="form-group">
                     <label for="product_image">상품 이미지</label>
                     <!-- <input type="file" class="form-control" id="product_image" name="uploadFile" style="height: 30px;" multiple> -->
                      <input type="file" id="product_image_update" name="uploadFile2" style="height: 30px;" multiple>
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



        <br><br>
        <!-- 회원 목록 -->
         <div class="card">
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
                    alert("hi");

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

                // $("input[type='file']").on("change", function(e){
                 $("#product_image").on("change",function(e){

                        var formData = new FormData();
                		var fileInput = $('input[name="uploadFile"]');
                        var fileList = fileInput[0].files;
                        var fileObj = fileList[0];

                        alert(fileInput);

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
                           },error: function(){
                                alert("실패");
                           }
                        });

                        alert("통과");
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


                    $("#productModal").find("[name=p_id]").val(p_id);
                    $("#productModal").modal("show");



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