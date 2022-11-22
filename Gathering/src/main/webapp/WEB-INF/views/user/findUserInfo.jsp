<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	<style>
        ul.tabs {
            margin: 0;
            padding: 0;
            float: left;
            list-style: none;
            height: 32px;
            /*--Set height of tabs--*/
            border-bottom: 1px solid #999;
            border-left: 1px solid #999;
            width: 100%;
        }

        ul.tabs li {
            float: left;
            margin: 0;
            padding: 0;
            height: 31px;
            /*--Subtract 1px from the height of the unordered list--*/
            line-height: 31px;
            /*--Vertically aligns the text within the tab--*/
            border: 1px solid #999;
            border-left: none;
            margin-bottom: -1px;
            /*--Pull the list item down 1px--*/
            overflow: hidden;
            position: relative;
            background: #ee0979;
        }

        ul.tabs li a {
            text-decoration: none;
            color: #fff;
            display: block;
            font-size: 1.2em;
            padding: 0 20px;
            /*--Gives the bevel look with a 1px white border inside the list item--*/
            border: 1px solid #fff;
            outline: none;
        }

        ul.tabs li a:hover {
            background: #ca0867;
        }

        html ul.tabs li.active,
        html ul.tabs li.active a:hover {
            /*--Makes sure that the active tab does not listen to the hover properties--*/
            background: #a00752;
            /*--Makes the active tab look like it's connected with its content--*/
            border-bottom: 1px solid #fff;
        }


        .tab_container {
            border: 1px solid #999;
            border-top: none;
            overflow: hidden;
            clear: both;
            float: left;
            width: 100%;
            background: #fff;
        }

        .tab_content {
            padding: 20px;
            font-size: 1.2em;
        }
    </style>


</head>

<body id="page-top">
    
    
            <!--메인구간 -->
            <div class="col-10">
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

             <!--탭 메뉴 영역 -->
            <ul class="tabs mt-5 ">
                <li><a href="#tab1">아이디 찾기</a></li>
                <li><a href="#tab2">비밀번호 찾기</a></li>
            </ul>
			

            <!--탭 콘텐츠 영역 -->
            
				<c:choose>
				<c:when test="${a ==1}">
					<div class="tab_container">
					<div id="tab2" class="tab_content text-center">
	                    <!--Content-->
	                    <h1>비밀번호 찾기</h1>
	                    아이디,이메일을 통해 아이디를 찾을 수 있습니다. <br/>
	                    <form id="findPassword" method="post">
	                    <input type="text" name="user_id" id="user_id" class="form-control mt-4" placeholder="ID">
	                    <input type="text" name="email" id="email1" class="form-control mt-4" placeholder="이메일">
	                    <input type="button" class="form-control mt-4 btn btn-primary" value="찾기" onclick="findPassword()">
	                    </form>
	                    <div style="text-align: center; color:red"><span>${message1}</span></div>
	           		</div>
	           		<div id="tab1" class="tab_content text-center">
	                    <!--Content-->
	                    <h1>아이디 찾기</h1>
	                    이메일과 비밀번호를 통해 아이디를 찾을 수 있습니다. <br />
	                    <form id="findId" method="post">
	                    <input type="text" name="email" id="email" class="form-control mt-4" placeholder="이메일">
	                    <input type="password" name="password" id="password" class="form-control mt-4" placeholder="비밀번호">
	                    <input type="button" class="form-control mt-4 btn btn-primary" value="찾기" onclick="findId()">
	                    </form>
	                    <div style="text-align: center; color:red"><span>${message}</span><strong>${userId}</strong></div>
	                </div>
	                </div>
				</c:when>
				<c:otherwise>
					<div class="tab_container">
	                <div id="tab1" class="tab_content text-center">
	                    <!--Content-->
	                    <h1>아이디 찾기</h1>
	                    이메일과 비밀번호를 통해 아이디를 찾을 수 있습니다. <br />
	                    <form id="findId" method="post">
	                    <input type="text" name="email" id="email" class="form-control mt-4" placeholder="이메일">
	                    <input type="password" name="password" id="password" class="form-control mt-4" placeholder="비밀번호">
	                    <input type="button" class="form-control mt-4 btn btn-primary" value="찾기" onclick="findId()">
	                    </form>
	                    <div style="text-align: center; color:red"><span>${message}</span><strong>${userId}</strong></div>
	                </div>
	
	                <div id="tab2" class="tab_content text-center">
	                    <!--Content-->
	                    <h1>비밀번호 찾기</h1>
	                    아이디,이메일을 통해 아이디를 찾을 수 있습니다. <br/>
	                    <form id="findPassword" method="post">
	                    <input type="text" name="user_id" id="user_id" class="form-control mt-4" placeholder="ID">
	                    <input type="text" name="email" id="email1" class="form-control mt-4" placeholder="이메일">
	                    <input type="button" class="form-control mt-4 btn btn-primary" value="찾기" onclick="findPassword()">
	                    </form>
	                    <div style="text-align: center; color:red"><span>${message1}</span></div>
	           		</div>
	           		</div>
	           	</c:otherwise>	
				</c:choose>
            
            </main>
        </div>
        

     
   
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--Jquery 적용-->
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <!--스크립트 부분-->
    <script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
    <script>
        $(document).ready(function () {

           
            $(".tab_content").hide(); 
            $("ul.tabs li:first").addClass("active").show(); 
            $(".tab_content:first").show(); 

           	
          	$("ul.tabs li").click(function () {

            $("ul.tabs li").removeClass("active"); 
            $(this).addClass("active"); 
            $(".tab_content").hide(); 

            var activeTab = $(this).find("a").attr("href"); 
            $(activeTab).fadeIn(); 
            return false;
            });

        });
    </script>
    
    <!-- login 스크립트 -->
	<script type="text/javascript" src="../js/login.js" charset="UTF-8"></script>
</body>

</html>