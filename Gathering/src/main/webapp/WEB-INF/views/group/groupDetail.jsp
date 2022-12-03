<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>One Page Wonder - Start Bootstrap Template</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />

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
                            <a class="nav-link active" aria-current="page" href="/group/groupDetail?group_seq=${group.group_seq}">
                                <span data-feather="home"></span>
                                모임상세
                            </a>
                        </li>
                        <li class="nav-item">
                             <a class="nav-link" href="/group/groupNoticeListView?group_seq=${group.group_seq}">
                                <span data-feather="file"></span>
                                모임공지
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/group/groupAlbum?group_seq=${group.group_seq}">
                                <span data-feather="shopping-cart"></span>
                                모임앨범
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/group/groupSuda?group_seq=${group.group_seq}">
                                <span data-feather="users"></span>
                                모임수다
                            </a>
                        </li>
                    </ul>

					
                </div>

			
            </nav>

            <!--메인구간 -->

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                
                <h2 style="padding-top:5%">${group.group_name}</h2>

                
                <div class="row mb-2">
                    <div class="col">
                    	
                    	<c:choose>
	                    	<c:when test="${result == 1}">
	                        	<button type="button" class="btn btn-outline-primary" style="float:right" onclick="location.href='/group/joinGroup?group_seq=${group.group_seq}'">가입하기</button>
	                        </c:when>
	                        <c:otherwise>
	                        	<c:if test="${joinedCrew.type eq '2'}">
	                        	<button type="button" class="btn btn-outline-primary" style="float:right" onclick="location.href='/group/outGroup?group_seq=${group.group_seq}'">탈퇴하기</button>
	                        	</c:if>
	                        </c:otherwise>
                        </c:choose>
                        
                        <c:if test="${result == 1}">

							<c:choose>
								<c:when test="${check eq 'checked'}">
									<button type="button" class="btn btn-outline-primary"
										style="float: right; margin-right: 10px"
										onclick="location.href='/group/deleteInterest?group_seq=${group.group_seq}'">찜삭제</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-outline-primary"
										style="float: right; margin-right: 10px"
										onclick="location.href='/group/addInterest?group_seq=${group.group_seq}'">찜하기</button>
								</c:otherwise>
							</c:choose>
						</c:if>
					</div>
				</div>




				<!--해당 공지리스트 양식으로 한줄 요약-->
				<div class="table-responsive">


					<!-- 모임공지 상세 내용-->

					<div class="col-8" style="padding-top: 10px; line-height: 3;">
						<p>${group.region}<br>${group.kind}</p>
						<hr>
						<p>${group.brief}</p>
						<hr>

						<p>${group.detail}</p>
						<br>
						<hr>


						<!--클릭하면 해당 공지 상세로 이동하게-->
						<h4>정모현황</h4>
						<table class="table table-hover">
							<tbody>
								<c:forEach items="${jungmoList}" var="jungmo">
									<tr style="cursor: pointer"
										onclick="location.href='/group/groupNoticeViewAction?group_notice_seq=${jungmo.group_notice_seq}&group_seq=${jungmo.group_seq}'">
										<td>${fn:substring(jungmo.jungmo_date,0,10)}</td>
										<td>${fn:substring(jungmo.jungmo_date,11,16)}</td>
										<td>${jungmo.title}</td>
										<td>${jungmo.jungmo_place}</td>
										<td></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>

						<h4>모임멤버</h4>
						<table class="table">

							<tbody>
								<c:forEach items="${crewList}" var="crew">
									<tr>
										<td><img class="img-fluid rounded-circle"
											src="/images/${crew.crew_image}"
											style="width: 70px; height: 70px; margin-right: 10px">${crew.nickname}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>




					<div class="col-12">
						<c:if test="${joinedCrew.type eq '1'}">
							<button type="button" class="btn btn-primary"
								onclick="location.href='/group/updateGroupInfo?group_seq=${group.group_seq}'">모임수정</button>
							<!--모임장만-->
							<button type="button" class="btn btn-primary"
								onclick="location.href='/group/deleteGroupInfo?group_seq=${group.group_seq}'">모임삭제</button>
							<!--모임장만-->
						</c:if>
					</div>

				</div>

			</main>

		</div>
	</div>

	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- group 스크립트 -->
	<script type="text/javascript" src="../js/group.js" charset="UTF-8"></script>



</body>

</html>