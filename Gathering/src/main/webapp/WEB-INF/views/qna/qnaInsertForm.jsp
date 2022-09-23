<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="css/styles.css" rel="stylesheet" />

	<script type="text/javascript" src="../js/qna.js"></script>

</head>

<body id="page-top">
     <%@ include file="/WEB-INF/views/navibar.jsp" %>
    
    
    <div class="container-fluid">
        <div class="row">
        
        <!--사이드바 시작구간-->
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column"> 
                        <li class="nav-item">
                            <a class="nav-link"  href="/qna/frequentlyQna">
                                <span data-feather="file"></span>
                                자주 묻는 질문
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"  href="/qna/myQnaList">
                                <span data-feather="shopping-cart"></span>
                                나의 질문
                            </a>
                        </li>       
                    </ul>
                </div>
            </nav>
            
            <!--메인구간 -->
            
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h2 style="padding-top:5%">1:1 질문하기 </h2>
                <!-- 입력 폼-->
                <form class="container row" id="formm" name="formm" style="float: none; margin:100 auto;" action="/qna_insert" method="post">
                
                        <!--질문제목--> 
                        <div class="row mb-2">
                            <label for="input_crew_notice_title" class="col-sm-2 col-form-label">제목</label>
                            <div class="col-auto">
                                <input type="text" size="70" class="form-control" name="title" 
                                    id="title" placeholder="제목을 입력해 주세요.">
                            </div>
                        </div>

                        <!--상세내용-->
                        <div class="row mb-2">
                            <label for="input_crew_notice_detail" class="col-sm-2 col-form-label">상세내용</label>
                            <div class="col-auto">
                                <textarea type="text" class="form-control" id="content" name="content" cols="70"
                                    rows="5" placeholder="상세소개를 작성해 주세요." style="resize:none;"></textarea>
                            </div>
                        </div>
          
                        <!--공개여부-->
                        <div class="row mb-2">
                            <label for="input_gender" class="col-sm-2 col-form-label">공개여부</label>
                            <div class="col-auto">
                                <div class="row" style="padding-left:10px;">
                                    <div class="form-check col-auto py-2"> 
                                        <input class="form-check-input" type="radio" name="security"
                                            id="security1" value="공개" onclick="onActive()"   />공개
                                    </div>

                                    <div class="form-check col-auto py-2">             	
                                        <input class="form-check-input" type="radio" name="security"
                                            id="security2" value="비공개" onclick="onActive()" checked/>비공개                          
                                    </div>         
                                </div>
                            </div>
                        </div>

                        <!--비밀번호-->
                        
                        <div class="row mb-2">
                            <label for="input_password" class="col-sm-2 col-form-label">비밀번호</label>
                            <div class="col-auto">
                                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" >
                            </div>
                        </div>
                     
                        <!--버튼-->
                        
                        <div class="row">
                            <div class="col text-center">
                                <button class="btn btn-primary" type="button" id="qna_insert" onclick="qna_save()" >등록</button>
                                <button class="btn btn-primary" type="button" onclick="location.href='/qna/qnaList'">취소</button>
                            </div>
                        </div>
                </form>
            </main>
        </div>
    </div>
    
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  
  
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>


</body>

</html>