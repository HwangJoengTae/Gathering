<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<!-- Nav바 구간-->
	<%@ include file="/WEB-INF/views/navibar.jsp"%>


	<!--메인구간 -->
	<div class="col-10">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">




			<h2 style="padding-top: 5%">모임수정</h2>


			<!-- 모임생성폼 폼-->

			<form method="post" action="/group/updateGroupInfo"
				class="container row" style="float: none; margin: 100 auto;">

				<div class="mb-3">
					<!-- group_seq 히든 -->
					<input type="hidden" id="group_seq" name="group_seq"
						value="${group.group_seq}">

					<!--모임명-->
					<div class="row mb-2">
						<label for="group_name" class="col-sm-2 col-form-label">모임명</label>

						<div class="col-auto">
							<input type="text" class="form-control" id="group_name"
								name="group_name" value="${group.group_name}" readonly>
						</div>

					</div>
					<!--간단소개-->
					<div class="row mb-2">
						<label for="brief" class="col-sm-2 col-form-label">간단소개</label>
						<div class="col-auto">
							<input type="text" size="70" class="form-control" id="brief"
								name="brief" value="${group.brief}">
						</div>
					</div>
					<!--상세소개-->
					<div class="row mb-2">
						<label for="detail" class="col-sm-2 col-form-label">상세소개</label>
						<div class="col-auto">
							<textarea class="form-control" id="detail" name="detail"
								cols="70" rows="5" style="resize: none;">${group.detail}</textarea>
						</div>
					</div>


					<!--취미분야-->
					<div class="row mb-2">
						<label for="kind" class="col-sm-2 col-form-label">취미분야</label>
						<div class="col-auto">
							<select class="form-select" id="kind" name="kind">
								<option <c:if test="${group.kind eq '스포츠'}">selected</c:if>
									value="스포츠">스포츠</option>
								<option <c:if test="${group.kind eq '음악'}">selected</c:if>
									value="음악">음악</option>
								<option <c:if test="${group.kind eq '문화'}">selected</c:if>
									value="문화">문화</option>
								<option <c:if test="${group.kind eq '봉사활동'}">selected</c:if>
									value="봉사활동">봉사활동</option>
								<option <c:if test="${group.kind eq '반려동물'}">selected</c:if>
									value="반려동물">반려동물</option>
							</select>
						</div>
					</div>

					<!--주활동지역-->
					<div class="row mb-2">
						<label for="region" class="col-sm-2 col-form-label">주활동지역</label>
						<div class="col-auto">
							<select class="form-select" id="region" name="region">
								<option <c:if test="${group.region eq '서울'}">selected</c:if>
									value="서울">서울</option>
								<option <c:if test="${group.region eq '경기'}">selected</c:if>
									value="경기">경기</option>
								<option <c:if test="${group.region eq '인천'}">selected</c:if>
									value="인천">인천</option>
								<option <c:if test="${group.region eq '부산'}">selected</c:if>
									value="부산">부산</option>
								<option <c:if test="${group.region eq '제주'}">selected</c:if>
									value="제주">제주</option>
							</select>
						</div>
					</div>


					<!--정원설정-->
					<div class="row mb-2">
						<label for="member_limit" class="col-sm-2 col-form-label">정원설정</label>
						<div class="col-auto">
							<select class="form-select" id="member_limit" name="member_limit">
								<option
									<c:if test="${group.member_limit eq '10명'}">selected</c:if>
									value="10명">10명</option>
								<option
									<c:if test="${group.member_limit eq '30명'}">selected</c:if>
									value="30명">30명</option>
								<option
									<c:if test="${group.member_limit eq '50명'}">selected</c:if>
									value="50명">50명</option>
								<option
									<c:if test="${group.member_limit eq '제한없음'}">selected</c:if>
									value="제한없음">제한없음</option>
							</select>
						</div>
					</div>


					<!-- 생성 / 취소 -->
					<div class="row">
						<div class="col text-center">
							<input class="btn btn-primary" style="margin-right: 10px;"
								type="submit" value="수정">
							<button class="btn btn-primary" type="button"
								onclick="history.back()">취소</button>
						</div>
					</div>

				</div>

			</form>

		</main>
	</div>

	<!-- Footer-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>



</body>