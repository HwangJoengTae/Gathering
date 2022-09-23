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
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

		<h2 style="padding-top: 5%">정말 탈퇴하시겠습니까??</h2>

		<!-- 회원가입 폼-->

		<form id="userDeleteForm" method="post" class="container row"
			style="float: none; margin: 100 auto;">

			<div class="mb-3">

				<!--회원ID-->
				<div class="row mb-2">
					<label for="user_id" class="col-sm-2 col-form-label">회원ID</label>

					<div class="col-auto">
						<input type="text" class="form-control" id="user_id"
							name="user_id" placeholder="회원ID">
					</div>
				</div>

				<!--비밀번호-->
				<div class="row mb-2">
					<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-auto">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="비밀번호">
					</div>
				</div>

				<!-- 결과메세지 -->
				<div style="text-align: center; color: red">
					<span>${message}</span>
				</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col text-center">
						<input class="btn btn-primary" style="margin-right: 10px;"
							type="button" value="탈퇴" onclick="deleteUser()">
						<button class="btn btn-primary" type="button"
							onclick="history.back()">취소</button>
					</div>
				</div>

			</div>

		</form>

	</main>

	<!-- Footer-->
	<footer class="py-5 bg-light">
		<div class="container px-5">
			<p class="m-0 text-center text-black small">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- maypage 스크립트 -->
	<script type="text/javascript" src="../js/mypage.js" charset="UTF-8"></script>

</body>

</html>
