<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
   .carousel-item img {
             width: 100%; /* 이미지의 가로 너비를 100%로 설정하여 부모 요소에 맞춥니다. */
             height: auto; /* 이미지의 세로 높이를 자동으로 조정합니다. */
         }
    </style>
</head>
<body>

   <div style="text-align:center; margin-top:60px;">
           <h2 class="display-6"></h2>
            <br> 매일 매일 업데이트되는 신상
        </div>
    <br><br>


<div class="container mt-3">
    <div class="row">
        <!-- 첫 번째 열: 이미지 슬라이드와 상품 정보 -->
        <div class="col-lg-6">
            <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" id="uploadResult">

                    </div>
                  <!--
                    <div class="carousel-item">
                        <img src="https://atimg.sonyunara.com/files/attrangs/goods/155186/64c218a716986.jpg" class="d-block w-100" alt="Slide 2" style="width:800px; height:800px;">
                    </div>
                     다른 슬라이드 이미지를 추가하려면 여기에 추가하면 됩니다. -->
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

        </div>

        <!-- 두 번째 열: 댓글 창 -->
        <div class="col-lg-6">
             <div class="card mt-3" style="border:none">
                <div class="card-body">
                    <p class="card-text text-muted mb-3">상품번호: <c:out value="${product.p_id}"/></p>
                    <h2 class="card-title mb-3"><c:out value="${product.p_title}"/></h2>
                    <p class="card-text fw-bold mb-3">가격: <fmt:formatNumber value="${product.p_price}" pattern="#,###"/>원</p>
                    <p class="card-text mb-3"><c:out value="${product.p_content}"/></p>
                    <hr>
                    <p>수량:</p>
                    <select id="quantitySelect" class="form-select" aria-label="Default select example">
                      <option value="1" selected>1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                    </select>
                    <br>
                    <p id="selectedValue"> 총 금액 : <fmt:formatNumber value="${product.p_price}" pattern="#,###"/> 원 </p>
                    <br>
                   <c:if test="${member != null }" >
                    <div class="btn-group" style="float:right">
                     <button type="button" class="btn btn-lg btn-success" >구매하기</button>
                     <button type="button" class="btn btn-secondary btn-lg" style="margin-left:2px;" id="bucket_btn">장바구니</button>
                    </div>
                   </c:if>
                    <c:if test="${member == null }" >
                            <h1>로그인해야 구매 가능합니다.</h1>
                      </c:if>
                </div>
             </div>
        </div>
    </div>
    <br>
    <div class="card">
           <div class="card-body">
           <h3 class="card-title mb-3">리뷰</h3>
           <c:if test="${member != null }" >
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰 작성하기 </button>
           </c:if>
           <c:if test="${member == null }" >
               <p>로그인 후 작성 가능합니다. </p>
           </c:if>
   </div>

           <div class="card-body" id="review_body">1

          </div>
    </div>

</div>



<!-- 모달 창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/reply/insert" method="post">
          <div class="mb-3">
            <label for="p_id" class="form-label">상품 ID:</label>
            <input type="text" class="form-control" id="p_id" name="p_id" value="<c:out value="${product.p_id}"/>" readOnly>
          </div>
          <div class="mb-3">
            <label for="r_replyer" class="form-label">작성자:</label>
            <input type="text" class="form-control" id="r_replyer" name="r_replyer" value="${member.member_id}" readOnly>
          </div>
          <div class="mb-3">
            <label for="r_reply" class="form-label">내용:</label>
            <textarea class="form-control" id="r_reply" name="r_reply" >${r_reply}</textarea>
          </div>
           <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reply_btn">작성</button>
           </div>
        </form>
      </div>
    </div>
  </div>
</div>
  <!-- Footer-->
        <footer class="py-5 bg-dark" style="margin-top:20px;">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script>

    $(document).ready(function(){

        var p_id = '<c:out value="${product.p_id}"/>';
        var uploadResult = $("#uploadResult");


        $.getJSON("/shop/getAttachList", {p_id : p_id}, function(arr){

                var str ="";
                var obj = arr[0];

                var fileCallPath = encodeURIComponent("C:\\upload2\\"+obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
		        str += "<img src='/shop/display?fileName=" + fileCallPath + "' class='d-block w-100' alt='Slide 2'>";
		        str += "</div>";

		        uploadResult.html(str);
        });

        //리뷰 달기
        $("#reply_btn").on("click", function(e) {
                e.preventDefault();

                var formData = new FormData();
                formData.append('p_id', $('#p_id').val());
                formData.append('r_replyer', $('#r_replyer').val());
                formData.append('r_reply', $('#r_reply').val());

                $.ajax({
                    type: "POST",
                    url: "/reply/insert",
                    data: formData,
                    processData: false,  // 데이터를 문자열로 변환하지 않음
                    contentType: false,  // 컨텐츠 타입을 설정하지 않음
                    success: function(response) {
                        console.log("전송 성공!");
                        console.log("서버 응답:", response);
                        alert("댓글이 등록되었습니다.");
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        console.error("전송 실패:", error);

                    }
                });

        });

        // 리뷰 목록
        $.getJSON("/reply/list?p_id=" + p_id , function(data) {

            var str ="";
            var review_body = $("#review_body");


             for (var i = 0; i < data.length; i++) {
                str += "<p>" + data[i].r_reply + "</p>";
                str += "<div class='d-flex justify-content-between'>";
                str += "<div class='d-flex flex-row align-items-center'>";
                str += "<img src='https://cdn.pixabay.com/photo/2012/04/16/11/39/plumber-35611_1280.png' alt='avatar' width='25' height='25' />";
                str += "<p class='small mb-0 ms-2'>" + data[i].r_replyer + "</p>";
                str += "</div>";
                str += "<div class='col'></div>"; // 오른쪽 여백을 위한 빈 컬럼
                str += "<div class='col-auto'>";

                str += '<c:if test="${member.member_id == null}" >';
                str += "<button class='btn btn-danger dRplyBtn' style='float:right' data-r_no='" + data[i].r_no + "'> 삭제 </button>";
                str += "<button class='btn btn-info uRplyBtn' data-r_no='"+data[i].r_no +"'style='margin-right: 5px''> 수정 </button>";
                str += '</c:if>';
                str += "</div>";
                str += "</div>";
                str += "<hr>";
                str += "</br></br>";
               }
            review_body.html(str);
        });

        // 수정 버튼 누르면 발동
        $(document).on("click",".uRplyBtn", function(){
            console.log("수정버튼");

            var newReply = prompt("수정할 내용을 입력하세요:"); // 사용자로부터 새로운 내용 입력 받기

            var formData = new FormData();
            formData.append('r_no', $(this).data('r_no'));
            formData.append('r_reply', newReply);


             $.ajax({
                    type: "PUT",
                    url: "/reply/update",
                    data: formData,
                    processData: false,  // 데이터를 문자열로 변환하지 않음
                    contentType: false,  // 컨텐츠 타입을 설정하지 않음
                    success: function(response) {
                        console.log("전송 성공!");
                        console.log("서버 응답:", response);
                        alert("댓글이 수정되었습니다.");
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        console.error("전송 실패:", error);
                    }
                }); // ajax

        });// 수정 버튼

           // 수정 버튼 누르면 발동
                $(document).on("click",".dRplyBtn", function(){
                    console.log("삭제버튼");

                    if(confirm("삭제합니까?")){

                    var formData = new FormData();
                    formData.append('r_no', $(this).data('r_no'));

                     $.ajax({
                            type: "DELETE",
                            url: "/reply/delete",
                            data: formData,
                            processData: false,  // 데이터를 문자열로 변환하지 않음
                            contentType: false,  // 컨텐츠 타입을 설정하지 않음
                            success: function(response) {
                                console.log("전송 성공!");
                                console.log("서버 응답:", response);
                                alert("댓글이 삭제되었습니다.");
                                location.reload();
                            },
                            error: function(xhr, status, error) {
                                console.error("전송 실패:", error);
                            }
                        }); // ajax
                        }else {
                            return;
                        }
                });// 수정 버튼


        // 옵션 선택이 변경될 때마다 선택된 값을 가져와서 표시
            $("#quantitySelect").change(function() {

                var price = <c:out value="${product.p_price}"/>;

                var selectedValue = $(this).val();
                $("#selectedValue").text("총 금액 : " +addCommas(selectedValue * price) + "원");
                // 선택된 값을 다른 작업에 활용할 수도 있습니다.
            });

            // ex) 1000 -> 1,000
            function addCommas(number) {
                return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }

         // 장바구니 버튼 눌렀을때.
         $("#bucket_btn").on("click",function(){

                var price =  <c:out value="${product.p_price}"/>; // 상품 가격
                var quantity = $("#quantitySelect").val(); // 상품 갯수
                var finalPrice = price * quantity; // 상품 가격 * 상품 갯수 = 최종금액
                var p_id = '<c:out value="${product.p_id}"/>'; // 상품 번호

                var formData = new FormData();
                formData.append("price",finalPrice);
                formData.append("p_id",p_id);
                formData.append("quantity",quantity);

                var data = {
                    price: finalPrice,
                    p_id: p_id,
                    quantity: quantity
                };


                $.ajax({
                    type: "POST",
                    url: "/bucket/insert",
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function(response) {
                         console.log("전송 성공!");
                         console.log("서버 응답:", response);
                         alert("장바구니에 담겼습니다.");
                         location.reload();
                    },
                    error: function(xhr, status, error) {
                         console.error("전송 실패:", error);
                    }
                }); // ajax
         });



    });

</script>


</body>
</html>
