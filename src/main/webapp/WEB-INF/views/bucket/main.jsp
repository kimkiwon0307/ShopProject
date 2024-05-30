<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../common/header.jsp"%>
    <div style="height:50px;">
    </div>
    <div class="container">
      <table class="table " style="margin: auto; text-align: center;">
          <c:if test="${empty list}">
              <tr>
                  <td colspan="5">
                      <h1 class="text-center">장바구니가 비었습니다.</h1>
                      <br><br>
                  </td>
              </tr>
          </c:if>

          <tr>
            <td>이미지</td>
            <td>상품명</td>
            <td>수량</td>
            <td>가격</td>
            <td>삭제</td>
          </tr>
          <c:forEach items="${list}" var="item">
              <tr>
                  <td style="width: 300px; height: 300px; text-align: center;  text-align: center;">
                      <div class="result-${item.b_id}" style="width: 100%; height: 100%;"></div>
                  </td>
                  <td style="width: 180px;">
                      <h5 class="fw-bold mb-3">${item.p_name}</h5>
                  </td>
                  <td style="width: 180px;">
                      <h5 class="fw-bold mb-3"> ${item.quantity}</h5>
                  </td>
                  <td style="width: 200px;">
                      <h5 class="fw-bold mb-3" style="text-decoration: line-through;">
                          정가 : <fmt:formatNumber value="${item.p_price * item.quantity}" pattern="#,###"/>원
                      </h5>
                      <h5 class="fw-bold mb-3">
                          할인율 : <fmt:formatNumber value="${item.p_discount}" pattern="#,###"/> %
                      </h5>
                      <c:set var="discountedPrice" value="${item.p_price - (item.p_price * (item.p_discount / 100.0))}" />
                      <h5 class="fw-bold mb-3">
                          판매가 : <fmt:formatNumber value="${discountedPrice * item.quantity}" type="number" maxFractionDigits="0" />원
                      </h5>
                  </td>
                  <td style="width: 150px;">
                      <button type="button" class="btn btn-danger d_btn" data-b_id='<c:out value="${item.b_id}"/>'><i class="bi bi-trash"></i></button>
                  </td>
              </tr>
          </c:forEach>
      </table>

        <div>
            <button type="button" class="btn btn-info buyBtn" style="float:right; margin-top:10px;"> 구매하기 </button>
        </div>
    </div>

    <br>
    <br>
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
                        //var fileCallPath = encodeURIComponent("//tmp//img//"+uploadPath+"/"+uuid+"_"+filename)
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

                     $(".buyBtn").on("click",function(){

                        alert("구매되었습니다.");

                        self.location="/shop/main";
                     })

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