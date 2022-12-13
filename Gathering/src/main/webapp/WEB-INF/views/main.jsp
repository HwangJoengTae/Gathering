<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>모임</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
        rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">	
    
</head>

<body id="page-top">

    
    <%@ include file="/WEB-INF/views/navibar.jsp" %>
      			   
      			    <!-- Page content-->
        <div class="container mt-3">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4 table-responsive">
                            <div class="card-body">
                            <h2 class="card-title">수다방 인기글</h2>
                           
                            <c:forEach items="${list}" var="list" begin="0" end="10">
                           		<div class="row">
                           		<div class="col-lg-3 btn btn-danger mt-1" style="border:1px solid black;">${list.group_name}</div>
                           		<div class="col-lg-7 mt-2 ">${list.content}</div>
                           		<div class="col-lg-1 mt-2"><i class="bi-heart-fill" style="font-size:1em; color: red; cursor: pointer;"></i>${list.likenum}</div>
                           		</div>       		                           		
                           		
                            </c:forEach>   
                            
                           
                            
                        </div>
                    </div>
                    <!-- Nested row for non-featured blog posts-->
                    <div class="row">
                        <div class="row g-4 pb-5 pt-2 row-cols-1 row-cols-lg-2">
                            <!-- Blog post-->
                            <c:forEach items="${list}" var="list">
                            <div>      		
                           		<h2 class="col-lg-7 mt-1">${list.group_name}</h2>
                           		<hr>
                           		<div class="row">
                           		<div class="col-lg-7 mt-2 ">${list.content}</div>
                           		<div class="col-lg-3 mt-2 "><i class="bi-heart-fill" style="font-size:1em; color: red; cursor: pointer;"></i>${list.likenum}</div>
                           		</div>
                           	</div>       		     
                            </c:forEach>
                        </div>
                    </div>
                  </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- 검색 구간-->
                    <div class="card mb-4">
                        <div class="card-header">웹 검색</div>
                        <div class="card-body">
                            <script async src="https://cse.google.com/cse.js?cx=c7c79f64c43f44401"></script>
							<div class="gcse-search"></div>
                        </div>
                    </div>
                   <!-- 채팅창 -->
                    <div class="card mb-4">
                        <div class="card-header">채팅창 이동</div>
                        <div class="btn btn-primary" style="cursor: pointer" onclick="window.open('/chat.action','채팅창','width=600, height=600, location=no, status=no, scrollbars=yes')">채팅창 열기 </div>
                        
                    </div>
                    <!-- 웹소켓 -->
                    <div class="card mb-4">
                        <div class="card-header">배너</div>
                        <img src="images/모임1.png">
                    </div>
                </div>
            </div>
        </div>

    
   
    <%@ include file="/WEB-INF/views/footer.jsp" %>
   
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>

</html>