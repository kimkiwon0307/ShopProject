<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/loginHeader.jsp"%>

        <div class="wrapper d-flex align-items-center justify-content-center h-100">
            <div class="card login-form">
                <div class="card-body">
                    <h5 class="card-title text-center"><a href="/shop/main"> <i class="bi bi-house-door-fill"></i> </a></h5>
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

                        <br><br>
                        <hr>

						<div class="sign-up mt-4">
      <div class="row">
              <div class="col-12">
                <p class="mt-4 mb-4">소셜 로그인</p>
                <div class="d-flex gap-2 gap-sm-3 justify-content-centerX">
                  <a href="#!" class="btn btn-outline-danger bsb-btn-circle bsb-btn-circle-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                      <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                    </svg>
                  </a>

                </div>
              </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
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