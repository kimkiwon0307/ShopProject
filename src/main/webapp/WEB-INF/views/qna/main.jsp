<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!DOCTYPE html>
<html lang="en">

  <head>
        <meta charset="utf-8">
        <title>kiwon's shop mall </title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/shop/main/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="/shop/main/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="/shop/main/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
        <!-- Template Stylesheet -->
        <link href="/shop/main/css/style.css" rel="stylesheet">

         <link href="https://cdn.datatables.net/2.1.3/css/dataTables.bootstrap5.css" rel="stylesheet">
    </head>


<body>



  <!-- Navbar start -->
        <div class="container-fluid fixed-top">

            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/shop/main" class="navbar-brand"><h1 class="text-primary display-6">kiwon's mall</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="/shop/main" class="nav-item nav-link active">SHOP</a>
                            <a href="/qna/main" class="nav-item nav-link active">Q & A</a>
                            <a href="/qna/main" class="nav-item nav-link active">CHAT</a>
                        </div>


                        <div class="d-flex m-3 me-0">
                            <c:if test="${member != null }" >
                            <a href="/bucket/main?member_id=${member.member_id}" class="position-relative me-4 my-auto">

                            </a>
                            </c:if>
                                  <ul class="navbar-nav ms-auto mb-2 mb-lg-0 profile-menu">
                                        <li class="nav-item dropdown">

                                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="fas fa-user fa-2x"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                          <c:if test="${member == null }" >
                                            <li><a class="dropdown-item" href="/member/login"> 로그인</a></li>
                                            <li><a class="dropdown-item" href="/member/join"> 회원가입</a></li>
                                           </c:if>
                                             <c:if test = "${member.adminCk == 1 }">
                                                   <li><a class="dropdown-item" href="/admin/main"> 관리자 페이지 </a></li>
                                            </c:if>
                                            <li><hr class="dropdown-divider"></li>
                                            <c:if test="${member != null }" >
                                              <li><a class="dropdown-item"><i class="bi bi-cash-coin"></i> 충전 금액 : ${member.money} 원</a></li>
                                              <li><a class="dropdown-item"><i class="bi bi-coin"></i> 충전 포인트 : ${member.point} 원</a></li>
                                             <li>  <a class="dropdown-item" href="/member/profile?member_id=${member.member_id}"><i class="bi bi-file-earmark-person" ></i> 내정보</a></li>
                                             <li><a class="dropdown-item" id="logout_btn"><i class="fas fa-sign-out-alt fa-fw"></i> 로그아웃</a></li>
                                            </c:if>
                                          </ul>
                                        </li>
                                     </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

    <div class="container mt-5">

        <h1 class="mb-4">상품 관리</h1>

                <!-- Begin Page Content -->
                <div class="container-fluid">



                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">질의응답(Q&A)</h6>
                           <c:if test="${member != null }" >
                            <button class="btn btn-success" style="float:right;" id="registerBtn">글 작성</button>
                            </c:if>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                               <table id="example" class="table table-striped" style="width:100%">
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>상태</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center;">
                                      <c:forEach items="${list}" var="list">
                                        <tr>
                                            <td><c:out value="${list.q_no}"/></td>
                                            <td>
                                                <a href="/qna/get?q_no=${list.q_no}">
                                                <c:out value="${list.q_title}"/></a></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${list.q_status == false}">
                                                        답변대기
                                                    </c:when>
                                                    <c:otherwise>
                                                        답변완료
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><c:out value="${list.q_writer}"/></td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.q_date}"/></td>
                                            <td><c:out value="${list.q_count}"/></td>
                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
        </div>

       <!-- Footer Start -->
        <div class="container">
          <footer class="py-3 my-4">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
              <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
              <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
              <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
              <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
              <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
            </ul>
            <p class="text-center text-body-secondary">&copy; 2024 Company, Inc</p>
          </footer>
        </div>
          <!-- Footer End -->


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

   <!-- Bootstrap JS 및 필요한 기타 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function(){

            $("#registerBtn").on("click",function(){

                    location.href="/qna/register";
            });

        })
    </script>

</body>

</html>