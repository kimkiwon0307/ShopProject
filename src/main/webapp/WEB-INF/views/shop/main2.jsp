<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <title>Hello, world!</title>

  </head>


<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height:75px; ">

  <div class="container-fluid" style="display:flex;">
  <div style="margin-left:100px; flex:1" >
    <a class="navbar-brand" href="#" >Kiwon's Shop</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>

    <div class="collapse navbar-collapse " id="navbarSupportedContent" style="flex:3; ">

      <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
        <li class="nav-item" >
          <a class="nav-link active" aria-current="page" href="#">Best 50</a>
        </li>
        <li class="nav-item" style="margin-left:20px;">
          <a class="nav-link" href="#">Outer</a>
        </li>
        <li class="nav-item"style="margin-left:20px;">
          <a class="nav-link" href="#">Top</a>
        </li>
        <li class="nav-item"style="margin-left:20px;">
          <a class="nav-link" href="#">Shirts</a>
        </li>
        <li class="nav-item"style="margin-left:20px;">
          <a class="nav-link" href="#">Pants</a>
        </li>
        <li class="nav-item"style="margin-left:20px;">
          <a class="nav-link" href="#">Suit</a>
        </li>
        <li class="nav-item"style="margin-left:20px;">
          <a class="nav-link" href="#">Shoes</a>
        </li>
        <li class="nav-item"style="margin-left:20px;">
             <a class="nav-link" href="#">Bag</a>
         </li>

      </ul>

        <div style="margin-right:100px;">
            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal">
                <i class="bi bi-search"></i>
            </button>

            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal">
                <i class="bi bi-person-fill"></i>
            </button>

            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal">
              <i class="bi bi-bag-plus-fill"></i>
            </button>
        </div>

      </div>
  </div>
</nav>




    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>