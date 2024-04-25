<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


    <title>Login Bootstrap 5</title>

   <style>
   html, body, .container{
  height: 100%;
}

.login-form {
  width: 400px;
  padding: 2rem 1rem 1rem;
}

form {
  padding: 1rem;
}
   </style>

</head>

<body>
    <div class="container">
        <div class="wrapper d-flex align-items-center justify-content-center h-100">
            <div class="card login-form">
                <div class="card-body">
                    <h5 class="card-title text-center"><a href="/album/list"> <i class="bi bi-house-door-fill"></i> </a></h5>
                     <a href="/member/join" style="float:right">회원가입</a>
                    <form action="/member/login" method="post" id="formObj">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">아이디</label>
                            <input type="text" class="form-control" name="member_id" id="checkId" aria-describedby="emailHelp" required>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" name="member_pwd" id="checkPwd"  required>
                        </div>
                        <button type="button" class="btn btn-primary w-100" id="loginBtn">로그인</button>

						<div class="sign-up mt-4">

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
	 <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

	<script>

		$(document).ready(function(){

			$("#loginBtn").on("click",function(e){

				var member_id = $("#checkId").val();
				var member_pw = $("#checkPwd").val();
				var formObj = $("#formObj");

				$.ajax({
					type: "post",
					url : "/member/login",
					data : {member_id: member_id, member_pw: member_pw},
					success : function(result){
						alert("로그인되었습니다.");
						self.location = "/shop/main";
					},
				    error: function(xhr, status, error) {
				        alert("사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.");
				    }
				}); // ajax

			})

		})

	</script>


</body>

</html>