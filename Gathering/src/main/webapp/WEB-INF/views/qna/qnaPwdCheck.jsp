<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>One Page Wonder - Start Bootstrap Template</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
        rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />

</head>

<body id="page-top">
   <%@ include file="/WEB-INF/views/navibar.jsp" %>
    
            <!--메인구간 -->
            <div class="col-12">
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h2 style="padding-top:5%">게시글 비밀번호를 입력해주세요.</h2>
            		<div class="container my-3 mx-2">
						  <!--Q&A비밀번호 확인-->
						  <form action="/qnaPwdCheck?qna_seq=${qnaVO.qna_seq}" method="post">
						  <div class="row mb-2">
						 	  <label for="input_user_id" class="col-sm-2 col-form-label">비밀번호</label>
						    <div class="col-auto">
						        <input type="password" class="form-control" id="qnaPwd" name="qnaPwd" placeholder="비밀번호">
						    </div>
						    <div class="col-auto">
						        <button type="submit" class="btn btn-primary">확인</button>
						    </div>
						</div>
						</form>
						<span style="color:red">${message}</span>
					</div>
            </main>
        </div>

     <%@ include file="/WEB-INF/views/footer.jsp" %>
     
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>

</html>