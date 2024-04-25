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
                        <img src="https://atimg.sonyunara.com/files/attrangs/goods/155186/64c218a716986.jpg" class="d-block w-100" alt="Slide 2">
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

            div class="card mt-3">
                <div class="card-body">
                    <h2 class="card-title mb-3"><c:out value="${product.p_title}"/></h2>
                    <p class="card-text text-muted mb-3"><c:out value="${product.p_id}"/></p>
                    <p class="card-text fw-bold mb-3">가격: <c:out value="${product.p_price}"/> 원</p>
                    <p class="card-text mb-3"><c:out value="${product.p_content}"/></p>
                    <button type="button" class="btn btn-primary">장바구니 담기</button>
                </div>
            </div>


        </div>
    </div>
</div>

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




    });

</script>


</body>
</html>
