<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>

  <style>
  body, html {
    height: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

.signup-container {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f4f4f4;
}

.signup-form {
    width: 400px;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

    margin: auto;
}

.signup-form h2 {
    margin: 0 0 20px;
}

.signup-form input {
    width: calc(100% - 24px);
    height: 40px;
    margin-top: 20px;
    padding: 0 8px;
    border: 1px solid #ddd;
    border-radius: 20px;
    outline: none;
    transition: border-color 0.3s ease;
}

.signup-form input:hover {
    border-color: #007bff;
}

#joinBtn, #loginBtn{
    width: calc(100%);
    height: 40px;
    border: none;
    background-color: #007bff;
    color: white;
    border-radius: 20px;
    cursor: pointer;ф
    margin-left: -10px;
    transition: background-color 0.3s ease;
}

.signup-form button:hover {
    background-color: #0056b3;
}
#s_nick_check_success,#s_pwd_check_success,#s_mail_check_success{
	color:green;
	display:none;
}
#s_nick_check_fail,#s_pwd_check_fail, #s_mail_check_fail{
	color:red;
	display:none;
}

form button{
	margin-top:20px;
}

  </style>
</head>

<body>
  <div class="signup-container">

    <form class="signup-form" action="/member/join" method="post">
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
      <h2>회원가입</h2>
      <input type="text" id="id_check" placeholder="아이디"  name='member_id' required>
      	<span  class="input-group" id="s_nick_check_success">사용 가능한 닉네임 입니다.</span>
	 	<span  class="input-group" id="s_nick_check_fail">존재하는 닉네임 입니다.</span>


      <input type="password" placeholder="비밀번호" id="member_password"  name= 'member_pw' required>
      <input type="password"  id="pw_check" placeholder="비밀번호 확인" required>
     	 <span  class="input-group" id="s_pwd_check_success">비밀번호가 같습니다.</span>
	 	 <span  class="input-group" id="s_pwd_check_fail">비밀번호가 다릅니다.</span>


       <input type="text" name="member_name" placeholder="이름" >


        <div class="input-group mb-3">
           <input type="email" id="mail_chk" class="form-control" placeholder="이메일"  name='member_mail' required>
           <button class="btn btn-outline-secondary" type="button" id="email_chcK_btn"  >인증번호 전송</button>

              <input type="text" id="check_mailNum" placeholder="인증번호" name=''   required>
              <span  class="input-group" id="s_mail_check_success">인증번호가 같습니다.</span>
              <span  class="input-group" id="s_mail_check_fail">인증번호가 다릅니다. </span>
         </div>

     <div class="input-group mb-3">
       <input type="text" class="form-control" placeholder="주소1" aria-label="Recipient's username" aria-describedby="button-addon2"   id='address_input_1' name='member_Addr1'  required>
       <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="execution_daum_address()" >주소찾기</button>
     </div>

         <input type="text" placeholder="주소2" id='address_input_2'name='member_Addr2'  readonly="readonly" required>
         <input type="text" placeholder="주소3" id='address_input_3'name='member_Addr3'  readonly="readonly" required>


      <button type="submit" id="joinBtn">회원가입</button>
      <button type="button" class="btn btn-danger" id="loginBtn">로그인</button>
    </form>
  </div>

 <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>

	$(document).ready(function(){

		// 아이디 중복검사
		$('#id_check').on("propertychange change keyup paste input", function(){


			var member_id = $('#id_check').val();
			var data = {member_id : member_id};


			if($(this).val() != 0){

			$.ajax({

				type: "post",
				url : "/member/m_id_check",
				data : data,
				success : function(result){
				console.log(result);
					if(result != 'fail'){
						$("#s_nick_check_fail").css("display","none");
						$("#s_nick_check_success").css("display","inline-block");
						$("#signUp_btn").attr("type","submit");
					}else{
						$("#s_nick_check_fail").css("display","inline-block");
						$("#s_nick_check_success").css("display","none");
						$("#signUp_btn").attr("type","button");
					}
				}
			}); // ajax
		   }else {
			   $("#s_nick_check_fail").css("display","none");
			   $("#s_nick_check_success").css("display","none");
		   }
		}); // 아이디 중복검사

        // 비밀번호 체크
        $('#pw_check').on("propertychange change keyup paste input", function(){

            var pw = $("#member_password").val();
            var pw_check = $(this).val();

            if (pw == pw_check) {
            	$("#s_pwd_check_fail").css("display","none");
            	$("#s_pwd_check_success").css("display","inline-block");
            }else {
                $("#s_pwd_check_fail").css("display","inline-block");
                $("#s_pwd_check_success").css("display","none");
            }
        }); // 비밀번호 체크


     var num;

    // 이메일 인증번호
    $("#email_chcK_btn").on("click",function(){

        var email = $("#mail_chk").val();

        $.ajax({
            type:"GET",
            url:"/member/mailCheck?email=" + email,
            success:function(data){
                console.log("data:" + data);
                num = data;
            }
        });

     }); // 이메일 인증번호

      // 인증번호 일치 불일치
     $('#check_mailNum').on("property change change keyup paste input", function(){

                var check_mailNum = $('#check_mailNum').val();

                if(check_mailNum == num){
                    	$("#s_mail_check_fail").css("display","none");
                    	$("#s_mail_check_success").css("display","inline-block");
                    	$("#check_mailNum").prop("disabled",true);

                }else{
                   	$("#s_mail_check_fail").css("display","inline-block");
                   	$("#s_mail_check_success").css("display","none");
                }
        });    // 인증번호 일치 불일치
    }); //$(document).ready(function(){



    // 다음 주소 연동
   function execution_daum_address(){

          new daum.Postcode({
               oncomplete: function(data) {
                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                   var addr = ''; // 주소 변수
                   var extraAddr = ''; // 참고항목 변수

                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                       addr = data.roadAddress;
                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
                       addr = data.jibunAddress;
                   }

                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                   if(data.userSelectedType === 'R'){
                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraAddr !== ''){
                           extraAddr = ' (' + extraAddr + ')';
                       }
                       // 조합된 참고항목을 해당 필드에 넣는다.
                       //document.getElementById("sample6_extraAddress").value = extraAddr;

                        addr += extraAddr;

                   } else {
                       // document.getElementById("sample6_extraAddress").value = '';
                        addr += ' ';
                   }

                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  // document.getElementById('sample6_postcode').value = data.zonecode;
                  // document.getElementById("sample6_address").value = addr;
                    $("#address_input_1").val(data.zonecode);
                    $("#address_input_2").val(addr);


                   // 커서를 상세주소 필드로 이동한다.
                  // document.getElementById("sample6_detailAddress").focus();
                    $("#address_input_3").attr("readonly",false);
                    $("#address_input_3").focus();
               }
           }).open();
   }// 다음 주소 연동

        $("#loginBtn").on("click",function(){

            location.href="/member/login";

        });


    </script>


</body>

</html>