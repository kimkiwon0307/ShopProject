<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

<head>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- Template Stylesheet -->

   <link href="/member/join.css" rel="stylesheet">
   <link href="/shop/main/css/style.css" rel="stylesheet">

 <title>회원가입</title>
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

      <h2>회원가입</h2>

       <div class="input-group" style="margin-bottom:20px;">
             <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
            <input type="text"  class="form-control" id="id_check" placeholder="아이디"  name='member_id' >

        	<!-- 아이디 중복검사 -->
        	<span  class="input-group" id="s_nick_check_success">사용 가능한 닉네임 입니다.</span>
	    	<span  class="input-group" id="s_nick_check_fail">존재하는 닉네임 입니다.</span>
      </div>

      <div class="input-group" style="margin-bottom:20px;">
        <span class="input-group-text"><i class="bi bi-key"></i></span>
        <input type="password" class="form-control" placeholder="비밀번호" id="member_password"  name= 'member_pw' >
        <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
        <input type="password"  class="form-control" id="pw_check" placeholder="비밀번호 확인" >
     	<span  class="input-group" id="s_pwd_check_success">비밀번호가 같습니다.</span>
	 	<span  class="input-group" id="s_pwd_check_fail">비밀번호는 최소 8자 이상, 하나 이상의 문자, 숫자, 특수문자를 포함해야 합니다.</span>
      </div>


       <div class="input-group" style="margin-bottom:20px;">
             <span class="input-group-text"><i class="bi bi-vector-pen"></i></span>
            <input type="text" class="form-control" id="name_check" name="member_name" placeholder="이름" >
            <span  class="input-group" id="s_name_check_success">유효한 이름입니다.</span>
            <span  class="input-group" id="s_name_check_fail"> 이름은 한글 또는 영문 2자 이상 10자 이하로 입력해주세요. </span>

      </div>

    <!-- 이메일 -->
     <div class="input-group" style="margin-bottom:20px;">
           <span class="input-group-text"><i class="bi bi-mailbox"></i></span>
           <input type="email" id="mail_chk" class="form-control" placeholder="이메일"  name='member_mail' >
            <button class="btn btn-outline-secondary" type="button" id="email_chk_btn" >인증번호 전송</button>
           <span  class="input-group" id="s_mail_check_success">유효한 메일입니다.</span>
            <span  class="input-group" id="s_mail_check_fail"> 이메일 형식에 맞지 않습니다. </span>

      </div>

     <div class="input-group" style="margin-bottom:20px;">
             <span class="input-group-text"><i class="bi bi-mailbox2"></i></span>
              <input type="text" class="form-control" id="check_mailNum" placeholder="인증번호" name=''   >
              <span  class="input-group" id="s_mailNum_check_success">인증되었습니다.</span>
              <span  class="input-group" id="s_mailNum_check_fail">인증번호가 다릅니다. </span>
     </div>

    <!-- 주소 -->
    <div class="input-group" style="margin-bottom:20px;">
       <span class="input-group-text"><i class="bi bi-building"></i></span>
       <input type="text" class="form-control" placeholder="지역번호" aria-label="Recipient's username" aria-describedby="button-addon2"   id='address_input_1' name='member_Addr1'  >
       <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="execution_daum_address()" >주소찾기</button>
     </div>

      <div class="input-group" style="margin-bottom:20px;">
       <span class="input-group-text"><i class="bi bi-building"></i></span>
         <input type="text" class="form-control" placeholder="주소" id='address_input_2'name='member_Addr2' >
      </div>

      <div class="input-group" style="margin-bottom:20px;">
       <span class="input-group-text"><i class="bi bi-building"></i></span>
         <input type="text" class="form-control" placeholder="상세 주소" id='address_input_3'name='member_Addr3'  >
      </div>
     <!-- 주소 END -->r


      <button type="button" class="btn btn-info" id="joinBtn" style="margin-bottom:20px;">회원가입</button>
      <button type="button" class="btn btn-danger" id="loginBtn">로그인</button>
    </form>
  </div>

 <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    $(document).ready(function() {
        var id_chk = false;
        var pw_chk = false;
        var name_chk = false;
        var email_chk = false;
        var address_chk = true;

        // 유효성 검사
        $('#joinBtn').on("click", function(e) {
            e.preventDefault();

            // 모든 조건 만족 시 폼 제출
            if (id_chk && pw_chk && name_chk && email_chk && address_chk) {
                var member_id = $("input[name=member_id]").val();
                alert(member_id + "님 환영합니다.");
                $("#joinForm").submit();
            } else {
                alert("틀린 부분 및 빈 값을 입력해주세요.");
            }
        });

        // 아이디 중복검사 start
        $('#id_check').on("propertychange change keyup paste input", function() {

            var member_id = $('#id_check').val();  // 입력받은 아이디
            var memberId_pattern = /^[a-zA-Z]{2,10}$/;
            var data = { member_id: member_id };   // ajax로 전달할 data로 담는다.

            if ($(this).val() != 0 && memberId_pattern.test(member_id)) {    // 값이 있을때만 실행한다.
                $.ajax({
                    type: "post",
                    url: "/member/m_id_check",
                    data: data,
                    success: function(result) {
                        console.log(result);
                        if (result != 'fail') {
                            $("#s_nick_check_fail").css("display", "none");
                            $("#s_nick_check_success").css("display", "inline-block");
                            $("#signUp_btn").attr("type", "submit");
                            id_chk = true;
                        } else {
                            $("#s_nick_check_fail").css("display", "inline-block");
                            $("#s_nick_check_success").css("display", "none");
                            $("#signUp_btn").attr("type", "button");
                        }
                    }
                });
            } else {
                $("#s_nick_check_fail").css("display", "none");
                $("#s_nick_check_success").css("display", "none");
            }
        }); // 아이디 중복검사 end

        // 비밀번호 유효성 검사 start
        $('#member_password').on("propertychange change keyup paste input", function() {
            var pw = $(this).val();
            var pw_check = $('#pw_check').val();
            var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;

            if (pw != 0) {
                if (pw && pw === pw_check && passwordPattern.test(pw)) {
                    $("#s_pwd_check_fail").css("display", "none");
                    $("#s_pwd_check_success").css("display", "inline-block");
                    pw_chk = true;
                } else {
                    $("#s_pwd_check_fail").css("display", "inline-block");
                    $("#s_pwd_check_success").css("display", "none");
                }
            } else {
                $("#s_pwd_check_fail").css("display", "none");
                $("#s_pwd_check_success").css("display", "none");
            }
        }); // 비밀번호 유효성 검사 end

        // 비밀번호 확인 유효성 검사 start
        $('#pw_check').on("propertychange change keyup paste input", function() {
            var pw = $("#member_password").val();
            var pw_check = $(this).val();
            var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;

            if (pw_check != 0) {
                if (pw && pw === pw_check && passwordPattern.test(pw_check)) {
                    $("#s_pwd_check_fail").css("display", "none");
                    $("#s_pwd_check_success").css("display", "inline-block");
                    pw_chk = true;
                } else {
                    $("#s_pwd_check_fail").css("display", "inline-block");
                    $("#s_pwd_check_success").css("display", "none");
                }
            } else {
                $("#s_pwd_check_fail").css("display", "none");
                $("#s_pwd_check_success").css("display", "none");
            }
        });// 비밀번호 확인 유효성 검사 end

        // 이름 형식 유효 검사 start
        $('#name_check').on("propertychange change keyup paste input", function() {
            var name = $(this).val();
            var namePattern = /^[a-zA-Z\uac00-\ud7af]{2,10}$/;

            if (name != 0) {
                if (name && namePattern.test(name)) {
                    $("#s_name_check_fail").css("display", "none");
                    $("#s_name_check_success").css("display", "inline-block");
                    name_chk = true;
                } else {
                    $("#s_name_check_fail").css("display", "inline-block");
                    $("#s_name_check_success").css("display", "none");
                }
            } else {
                $("#s_name_check_fail").css("display", "none");
                $("#s_name_check_success").css("display", "none");
            }
        }); // 이름 형식 유효 검사 end

        // 이메일 형식 유효 검사 start
        $('#mail_chk').on("propertychange change keyup paste input", function() {
            var email = $(this).val();
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (email != 0) {
                if (email && emailPattern.test(email)) {
                    $("#s_mail_check_fail").css("display", "none");
                    $("#s_mail_check_success").css("display", "inline-block");
                    email_chk = true;
                } else {
                    $("#s_mail_check_fail").css("display", "inline-block");
                    $("#s_mail_check_success").css("display", "none");
                }
            } else {
                $("#s_mail_check_fail").css("display", "none");
                $("#s_mail_check_success").css("display", "none");
            }
        });  // 이메일 형식 유효 검사 end

        // 이메일 인증번호 발송 start
        $("#email_chk_btn").on("click", function() {
            var email = $("#mail_chk").val();
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (!emailPattern.test(email)) {
                alert("이메일 형식을 입력해주세요.");
                return;
            }

            $.ajax({
                type: "GET",
                url: "/member/mailCheck?email=" + email,
                success: function(data) {
                    alert("인증번호를 전송하였습니다.");
                    num = data;
                },
                error: function(data) {
                    alert("인증번호 전송에 실패하였습니다.");
                }
            });
        }); // 이메일 인증번호 발송 end

        // 이메일 인증번호 확인
        $('#check_mailNum').on("propertychange change keyup paste input", function() {
            var check_mailNum = $('#check_mailNum').val();

            if (check_mailNum == num) {
                $("#s_mailNum_check_fail").css("display", "none");
                $("#s_mailNum_check_success").css("display", "inline-block");
                $("#check_mailNum").prop("disabled", true);
                $("#email_chk_btn").prop("disabled", true);
            } else if (check_mailNum === "") {
                $("#s_mailNum_check_fail").css("display", "none");
                $("#s_mailNum_check_success").css("display", "none");
            } else {
                $("#s_mailNum_check_fail").css("display", "inline-block");
            }
        });
    });

   // 다음 주소 API start
    function execution_daum_address() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    addr += extraAddr;
                } else {
                    addr += ' ';
                }

                $("#address_input_1").val(data.zonecode);
                $("#address_input_2").val(addr);
                $("#address_input_3").attr("readonly", false);
                $("#address_input_3").focus();
            }
        }).open();
    } // 다음 주소 API end

    // 로그인 버튼 이벤트
    $("#loginBtn").on("click", function() {
        location.href = "/member/login";
    });
</script>
