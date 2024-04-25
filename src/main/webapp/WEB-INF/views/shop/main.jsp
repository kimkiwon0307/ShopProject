<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../common/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/shop/css/styles.css" rel="stylesheet" />

        <style>
            .login_success_area{
                margin-right:10px;
                }
        </style>

    </head>
    <body>

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">김기원 쇼핑몰</h1>
                    <p class="lead fw-normal text-white-50 mb-0">상품을 구매하자</p>
                </div>
            </div>
        </header>


        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                 <c:forEach items="${product}" var="product">

                    <div class="col mb-5">

                        <div class="card h-100"  style="border: none;">
                           <a class="move"  href='<c:out value="${product.p_id}"/>'>
                                <!-- Product image-->
                                <div class="result-${product.p_id}">

                                 </div>
                           </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                  <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><c:out value="${product.p_name}"/></h5>
                                    <!-- Product price-->
                                  <fmt:formatNumber value="${product.p_price}" pattern="#,###"/>원
                                </div>
                            </div>
                            <!-- 상품 번호 -->
                            <input type="hidden" value='<c:out value="${product.p_id}"/>' id="p_id">
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="move"  href='<c:out value="${product.p_id}"/>'>
                                            살펴보기
                                    </a>
                                </div>
                            </div>
                            -->
                        </div>
                    </div> <!--  카드한장  -->

                  </c:forEach>
                </div>

                <!-- 검색 영역 -->
                <div class="d-flex justify-content-center">
                    <form id="searchForm" action="/shop/main" method="get">
                        <div class="input-group">
                            <input type="text" name="keyword" class="form-control" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                            <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                            <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                            <div class="mt-2 ms-2">
                                <button class="btn btn-primary" type="submit">검 색</button>
                                <button class="btn btn-primary" id="resetBtn" type="button">초기화</button>
                           </div>
                        </div>
                    </form>
                </div>

        		<!--  Pagination -->
            	<nav aria-label="..."  class="custom-nav">
            		<ul class="pagination pagination-sm justify-content-center">
            				<c:if test="${pageMaker.prev}">
            					<li class="page-item">
            						<a class="page-link" href="${pageMaker.pageStart -1}">이전</a>
            					</li>

            				</c:if>

            				<c:forEach var="num" begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd }">
            				  <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
            				  	<a class="page-link" href="${num}">${num}</a>
            				  </li>
            				</c:forEach>

            				<c:if test="${pageMaker.next}">
            					<li class="page-item">
            						<a class="page-link" href="${pageMaker.pageEnd + 1}">다음</a>
            					</li>
            				</c:if>
            			</ul>
                  </nav>    <!-- 페이징 -->

         	        <form id="moveForm" action="/shop/main" method="get">
         				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
         				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
         				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
         			</form>




          </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/shop/js/scripts.js"></script>
        <!-- jquery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script>

             $(document).ready(function(){


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


                let moveForm = $('#moveForm');

                /* 페이지 이동 버튼 */
                $(".page-item a").on("click", function(e){

                    e.preventDefault();

                    moveForm.find("input[name='pageNum']").val($(this).attr("href"));

                    moveForm.submit();

                });

                	let searchForm = $('#searchForm');

                	/* 작거 검색 버튼 동작 */
                	$("#searchForm button").on("click", function(e){

                		e.preventDefault();

                		/* 검색 키워드 유효성 검사 */
                		if(!searchForm.find("input[name='keyword']").val()){
                			alert("키워드를 입력하십시오");
                			return false;
                		}
                		searchForm.find("input[name='pageNum']").val("1");

                		searchForm.submit();
                	});

                        $("#resetBtn").on("click",function(){
                            searchForm.find("input[name='keyword']").val('');
                            searchForm.submit();
                        });


                $(".move").on("click", function(e) {
                    e.preventDefault();

                    moveForm.append("<input type='hidden' name='p_id' value='"+$(this).attr("href") + "'>");
                    moveForm.attr("action", "/shop/get");
                    moveForm.submit();

                });





                 <c:forEach items="${product}" var="product">
                     //var uploadPath = '<c:out value="${product.attachUploadPath}"/>';

                   var uploadPath = "2024\\04\\25";
                   var uuid = '<c:out value="${product.attachUuid}"/>';
                   var filename = '<c:out value="${product.attachFilename}"/>';
                   var uploadResult = $(".result-${product.p_id}");
                   var fileCallPath = encodeURIComponent("C:\\upload2\\"+uploadPath+"/"+uuid+"_"+filename);
                   var imageTag = '<img src="/shop/display?fileName=' + fileCallPath + '" class="card-img-top" alt="..." >';

                    uploadResult.append(imageTag);

                </c:forEach>

            });//  $(document).ready(function()
        </script>



    </body>
</html>
