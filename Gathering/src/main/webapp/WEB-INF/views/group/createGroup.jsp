<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

	<%@ include file="/WEB-INF/views/navibar.jsp"%>


	<!--메인구간 -->
	<div class="col-10">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">




			<h2 style="padding-top: 5%">모임생성</h2>


			<!-- 모임생성폼 폼-->

			<form id="createNewGroupForm" method="post"
				style="float: none; margin: 100 auto;">

				<div class="mb-3">
					<!--모임명-->
					<div class="row mb-2">
						<label for="group_name" class="col-sm-2 col-form-label">모임명</label>

						<div class="col-auto">
							<input type="text" class="form-control" id="group_name"
								name="group_name" maxlength="6" placeholder="모임명을 입력해 주세요.">
							<input type="hidden" id="rename" name="rename">
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-primary"
								onclick="groupNameCheck()">중복체크</button>
						</div>
					</div>
					<!--간단소개-->
					<div class="row mb-2">
						<label for="brief" class="col-sm-2 col-form-label">간단소개</label>
						<div class="col-auto">
							<input type="text" size="70" class="form-control" id="brief"
								name="brief" placeholder="간단소개를 작성해 주세요.">
						</div>
					</div>
					<!--상세소개-->
					<div class="row mb-2">
						<label for="detail" class="col-sm-2 col-form-label">상세소개</label>
						<div class="col-auto">
							<textarea class="form-control" id="detail" name="detail"
								cols="70" rows="5" placeholder="상세소개를 작성해 주세요."
								style="resize: none;"></textarea>
						</div>
					</div>
					<!--취미분야-->
					<div class="row mb-2">
						<label for="kind" class="col-sm-2 col-form-label">취미분야</label>
						<div class="col-auto">
							<select class="form-select" id="kind" name="kind">
								<option selected value="스포츠">스포츠</option>
								<option value="음악">음악</option>
								<option value="문화">문화</option>
								<option value="봉사활동">봉사활동</option>
								<option value="반려동물">반려동물</option>
							</select>
						</div>
					</div>
					<!--주활동지역-->
					<div class="row mb-2">
						<label for="region" class="col-sm-2 col-form-label">주활동지역</label>
						<div class="col-auto">
							<select class="form-select" id="region" name="region">
								<option selected value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="부산">부산</option>
								<option value="제주">제주</option>
							</select>
						</div>
					</div>
					<!--정원설정-->
					<div class="row mb-2">
						<label for="member_limit" class="col-sm-2 col-form-label">정원설정</label>
						<div class="col-auto">
							<select class="form-select" id="member_limit" name="member_limit">
								<option selected value="10명">10명</option>
								<option value="30명">30명</option>
								<option value="50명">50명</option>
								<option value="제한없음">제한없음</option>
							</select>
						</div>
					</div>

					<!-- 생성 / 취소 -->
					<div class="row">
						<div class="col text-center">
							<input class="btn btn-primary" style="margin-right: 10px;"
								type="button" value="생성" onclick="createGroup()">
							<button class="btn btn-primary" type="button"
								onclick="location.href='/main'">취소</button>
						</div>
					</div>
				</div>
			</form>

		</main>
	</div>

	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- group 스크립트 -->
	<script type="text/javascript" src="../js/group.js" charset="UTF-8"></script>



</body>