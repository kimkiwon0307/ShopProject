<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>
    <div class="container">
        <br><br>
        <h1 class="text-center"><b>장바구니</b></h1>

        <br><br>
        <ul class="list-group d-flex justify-content-center">
           <c:if test="${empty list}">
                <h1 class="text-center"> 장바구니가 비었습니다. </h1> <br><br>
           </c:if>
            <c:forEach items="${list}" var="item">
                 <li class="list-group-item">
                    <div class="d-flex align-items-center justify-content-center">
                        <div class="result-${item.b_id}" style="width:300px; height:300px;"></div>
                        <div class="me-3 text-center" style="width: 200px;">
                            <p><strong>${item.p_name}</strong></p>
                        </div>
                        <div class="me-3 text-center" style="width: 100px;">
                            <p><strong>수량:</strong> ${item.quantity}</p>
                        </div>
                        <div class="me-3 text-center" style="width: 150px;">
                            <p><strong>가격:</strong>  <fmt:formatNumber value="${item.price}" pattern="#,###"/></p>

                        </div>
                        <div class="me-3 text-center" style="width: 150px;">
                            <button type="button" class="btn btn-danger d_btn" data-b_id='<c:out value="${item.b_id}"/>' >삭제</button>
                        </div>
                    </div>
                </li>
            </c:forEach>


        </ul>
    </div>

      <!-- Footer-->
            <footer class="py-5 bg-dark" style="margin-top : 20px;">
                <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
            </footer>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
       $(document).ready(function(){

                // 상품 이미지 출력
                 <c:forEach items="${list}" var="list">
                        var uploadPath ='<c:out value="${list.uploadPath}"/>';
                        var uuid = '<c:out value="${list.uuid}"/>';
                        var filename = '<c:out value="${list.fileName}"/>';
                        var uploadResult = $(".result-${list.b_id}");
                        var fileCallPath = encodeURIComponent("C:\\upload2\\"+uploadPath+"/"+uuid+"_"+filename)
                        var imageTag = '<img src="/shop/display?fileName=' + fileCallPath + '" class="card-img-top" alt="..."  style="height:300px;">';

                        uploadResult.append(imageTag);
                </c:forEach>

                    $(document).on("click", ".d_btn", function() {

                        var b_id = $(this).data("b_id");

                        var formData = new FormData();
                         formData.append('b_id',  b_id);

                            if(confirm("정말 삭제하시겠습니까?")){
                               $.ajax({
                                   url: '/bucket/delete',
                                   type: 'DELETE',
                                   data: formData,
                                   processData: false,  // 데이터를 문자열로 변환하지 않음
                                   contentType: false,  // 컨텐츠 타입을 설정하지 않음
                                   success: function(response) {
                                        console.log("전송 성공!");
                                        console.log("서버 응답:", response);
                                        alert("상품이 삭제되었습니다.");
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