<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
   
    
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
    
    <!--사이드바-->
    <div class="container-fluid">
       
        <div class="row">
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/mypage/interestGroupList">
                                <span data-feather="home"></span>
                                관심있는 모임
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/mypage/joinedGroup">
                                <span data-feather="file"></span>
                               내가 가입한 모임
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/mypage/ownedGroup">
                                <span data-feather="shopping-cart"></span>
                                내가 만든 모임
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/mypage/myInfo">
                                <span data-feather="users"></span>
                                내 정보 관리
                            </a>
                        </li>
                    </ul>

                </div>
            </nav>

            <!--메인구간 -->
           
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

                <h2 style="padding-top:5%">회원정보수정</h2>

            
            <!-- 회원가입 폼-->
            
            <form action="userUpdateForm" id="userUpdateForm" method="post" class="container row" style="float: none; margin:100 auto;">
            
                <div class="mb-3">
                    <!--회원ID-->
                    <div class="row mb-2">
                         <label for="input_user_id" class="col-sm-2 col-form-label">회원ID</label>
                    
                        <div class="col-auto">
                        	<input type="hidden" id="user_id" name="user_id" value="${sessionScope.user.user_id}">
                            <strong>${sessionScope.user.user_id}</strong>
                        </div>
                        
                    </div>
                    <!--비밀번호-->
                    <div class="row mb-2">
                        <label for="password" class="col-sm-2 col-form-label">비밀번호변경</label>
                        <div class="col-auto">
                            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                        </div>
                    </div>
                    <!--비밀번호확인-->
                    <div class="row mb-2">
                        <label for="password_check" class="col-sm-2 col-form-label">비밀번호확인</label>
                        <div class="col-auto">
                            <input type="password" class="form-control" id="password_check" name="password_check" placeholder="비밀번호확인">
                        </div>
                    </div>
                    <!--이름-->
                    <div class="row mb-2">
                        <label for="name" class="col-sm-2 col-form-label">이름</label>
                        <div class="col-auto">
                        	<input type="hidden" id="name" name="name" value="${sessionScope.user.name}">
                           <strong> ${sessionScope.user.name} </strong>
                        </div>
                    </div>
                    <!--닉네임-->
                    <div class="row mb-2">
                        <label for="nickname" class="col-sm-2 col-form-label">닉네임</label>
                        <div class="col-auto">
                        	<input type="hidden" id="nickname" name="nickname" value="${sessionScope.user.nickname}">
                            <strong>${sessionScope.user.nickname}</strong>
                        </div>
                    </div>
                    <!--성별-->
                    <div class="row mb-2">
                        
                        <label for="gender" class="col-sm-2 col-form-label">성별</label>
                        <div class="col-auto">
                            <div class="row" style="padding-left:10px;">
                            	<c:set var="gender" value="${sessionScope.user.gender}"/>
                                <div class="form-check col-auto py-2">
                                    <input class="form-check-input" type="radio" name="gender" id="gender" value="1" <c:if test="${gender eq '1'}">checked</c:if>>남자
                                </div>
                                <div class="form-check col-auto py-2">
                                    <input class="form-check-input" type="radio" name="gender" id="gender" value="2" <c:if test="${gender eq '2'}">checked</c:if>>여자
                                </div>
                                <div class="form-check col-auto py-2">    
                                    <input class="form-check-input" type="radio" name="gender" id="gender" value="0" <c:if test="${gender eq '0'}">checked</c:if>>선택안함
                                </div>
                            </div>
                        </div>        
                    </div>
                    
                    <!--생년월일-->
                    <div class="row mb-2">
                        <label for="birthday" class="col-sm-2 col-form-label">생년월일</label>
                        <div class="col-auto">
                        	<input type="hidden" id="birthday" name="birthday" value="${sessionScope.user.birthday}">
                            <fmt:parseDate value="${sessionScope.user.birthday}" pattern="yyyy-MM-dd" var="date"/>
                            <fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일"/>
                        </div>
                        
                           
                    </div>
                    <!--이메일-->
                    <div class="row mb-2">
                        <label for="input_email" class="col-sm-2 col-form-label">이메일</label>
                        <div class="col-auto">
                        	<c:set var="email" value="${sessionScope.user.email}"/>
                            <input type="text" class="form-control" id="email1" value="${fn:substring(email,0,fn:indexOf(email,'@'))}" autocomplete="off">
                        </div>
                        @
                        <div class="col-auto">
                            <input type="text" class="form-control" id="email2" value="${fn:substring(email,fn:indexOf(email,'@')+1,fn:length(email))}" autocomplete="off">
                        </div>
                        <div class="col-auto">
                            <select class="form-select" id="email3">
                                <option selected value="">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="nate.com">nate.com</option> 
                                <option value="gmail.com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                              </select>
                        </div>
                            <input type="hidden" name="email" id="email">
                    </div>     
                    
                    <!--전화번호-->
                    <div class="row mb-2">
                        <label for="phone1" class="col-sm-2 col-form-label">전화번호</label>
                        <c:set var="phoneNumber" value="${sessionScope.user.phone}"/>
                        <div class="col-1">
                            <input type="text" class="form-control" id="phone1" maxlength="3" value="${fn:substring(phoneNumber,0,3)}" autocomplete="off">
                        </div>
                        
                        <div class="col-1">
                            <input type="text" class="form-control" id="phone2" maxlength="4" value="${fn:substring(phoneNumber,3,7)}" autocomplete="off">
                        </div>
                        <div class="col-1">
                            <input type="text" class="form-control" id="phone3" maxlength="4" value="${fn:substring(phoneNumber,7,11)}" autocomplete="off">
                        </div>
                        	<input type="hidden" name="phone" id="phone">
                    </div> 
                    
                    <!--주소-->
                    <div class="row mb-2">
                        <label for="address" class="col-sm-2 col-form-label">주소</label>
                        <div class="col-auto">
                            <input type="text" name="address" class="form-control" id="address" size="50" value="${sessionScope.user.address}" readonly>
                        </div>
                        <div class="col-auto">
                            <input class="btn btn-primary" type="button" value="주소찾기" onclick="kakaopost()">
                        </div>
                    </div>    

                    <!-- 유저타입 1 -->
                    <input type="hidden" name="user_type" value="1">
                            
                    <!--아래 버튼-->
                    <div class="row">
                        <div class="col text-center">
                            <input class="btn btn-primary" style="margin-right: 10px;" type="button" value="수정하기" onclick="go_update()">
                            <button class="btn btn-primary" style="margin-right: 10px;" type="button" onclick="location.href='/mypage/deleteUser'">회원탈퇴</button>
                            <button class="btn btn-primary" type="button" onclick="history.back()">취소</button>
                        </div>
                    </div>

                </div>
                            
            </form>
            

            </main>
        
        </div>
    </div>

    <%@ include file="/WEB-INF/views/footer.jsp" %>
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!--카카오 지도,주소-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a81e3b1d414024f75344e4e8fc907b8&libraries=services"></script>
    <!-- 우편찾기 함수 -->
    <script>
        function kakaopost() {
            new daum.Postcode({
                oncomplete: function (data) {
                    
                    document.querySelector("#address").value = data.address
                }
            }).open();
        }
    </script>
    
    <!-- maypage 스크립트 -->
	<script type="text/javascript" src="../js/mypage.js" charset="UTF-8"></script>
    
    <!-- 이메일 입력 jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$("#email3").change(function(){
			$("#email2").val($("#email3").val());
		});
	</script>
</body>

</html>