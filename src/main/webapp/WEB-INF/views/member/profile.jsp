<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="/member/profile.css" rel="stylesheet">

   <style>


   </style>
  <title>프로필</title>
</head>

<body>
  <div class="signup-container">

    <form class="signup-form" action="/member/join" method="post" id="joinForm">
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

      <h2>내 정보</h2>

       <div class="input-group" style="margin-bottom:20px;">
             <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
            <input type="text"  class="form-control" id="id_check" placeholder="아이디"  name='member_id' value="${Member.member_id}" disabled style="background-color: aliceblue;">
        	<span  class="input-group" id="s_nick_check_success">사용 가능한 닉네임 입니다.</span>
	    	<span  class="input-group" id="s_nick_check_fail">존재하는 닉네임 입니다.</span>
      </div>


       <div class="input-group" style="margin-bottom:20px;">
             <span class="input-group-text"><i class="bi bi-vector-pen"></i></span>
            <input type="text" class="form-control" id="nameCk" name="member_name" placeholder="이름" value="${Member.member_name}"disabled style="background-color: aliceblue;">

      </div>

     <div class="input-group" style="margin-bottom:20px;">
           <span class="input-group-text"><i class="bi bi-mailbox"></i></span>
           <input type="email" id="mail_chk" class="form-control" placeholder="이메일"  name='member_mail'  value="${Member.member_mail}"disabled style="background-color: aliceblue;">
      </div>


    <div class="input-group" style="margin-bottom:20px;">
       <span class="input-group-text"><i class="bi bi-building"></i></span>
       <input type="text" class="form-control" placeholder="지역번호" aria-label="Recipient's username" aria-describedby="button-addon2"   id='address_input_1' name='member_Addr1'
        value="${Member.member_Addr1}" disabled style="background-color: aliceblue;">

     </div>

      <div class="input-group" style="margin-bottom:20px;">
       <span class="input-group-text"><i class="bi bi-building"></i></span>
         <input type="text" class="form-control" placeholder="주소" id='address_input_2'name='member_Addr2' value="${Member.member_Addr2}" disabled style="background-color: aliceblue;">
      </div>

      <div class="input-group" style="margin-bottom:20px;">
       <span class="input-group-text"><i class="bi bi-building"></i></span>
         <input type="text" class="form-control" placeholder="상세 주소" id='address_input_3'name='member_Addr3' value="${Member.member_Addr3}" disabled style="background-color: aliceblue;">
      </div>

      <button type="button" class="btn btn-info" id="joinBtn" style="margin-bottom:20px;">수정</button>
      <button type="button" class="btn btn-danger" id="homeBtn">홈 화면</button>
    </form>
  </div>

 <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>

	$(document).ready(function(){

        var member_id = "${Member.member_id}";

	    $('#joinBtn').on("click",function(e){

	         e.preventDefault();
	         location.href="/member/update?member_id="+ member_id;
        });


        $("#homeBtn").on("click",function(e){
             e.preventDefault();
            location.href="/shop/main";
        });

    });
    </script>


</body>

</html>