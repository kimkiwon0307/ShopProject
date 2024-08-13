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

                           // 멤버 삭제 버튼
                        $(document).on("click", ".d_Mbtn", function() {
                               var formData = new FormData();
                               formData.append('member_id',  $(this).data("member_id"));

                               var member_id = $(this).data("member_id");

                               if(confirm(member_id + " 회원을 삭제하시겠습니까?")){
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