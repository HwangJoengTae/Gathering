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
	<!-- Nav바 구간-->
	<%@ include file="/WEB-INF/views/navibar.jsp"%>

	<!--메인구간 -->
	<div class="col-10">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

			<h2 style="padding-top: 5%">
				<strong>${group.group_name}</strong> 가입신청
			</h2>

			<!-- 입력 폼 -->
			<form id="joinCrew" method="post" action="joinGroup"
				enctype="multipart/form-data" class="container row mt-3">

				<div class="mb-3">
					<!-- 히든 -->
					<input type="hidden" id="group_seq" name="group_seq"
						value="${group.group_seq}"> <input type="hidden"
						id="user_id" name="user_id" value="${user.user_id}">


					<!--자기소개-->
					<div class="row mb-2">
						<label for="crew_brief" class="col-sm-2 col-form-label">자기소개</label>
						<div class="col-7">
							<textarea class="form-control" id="crew_brief" name="crew_brief"
								rows="3" style="resize: none;"></textarea>
						</div>
					</div>

					<!--첨부파일-->
					<div class="row mb-3">
						<label for="image" class="col-sm-2 col-form-label">프로필사진</label>
						<div class="col-7">
							<input class="form-control" type="file" id="image" name="image"
								multiple>
						</div>
					</div>

					<!--서밋버튼-->
					<div class="row">
						<div class="col text-center">
							<input class="btn btn-primary" style="margin-right: 10px;"
								type="button" value="가입" onclick="imageCheckForCrew()">
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
	<!-- group 스크립트 -->
	<script type="text/javascript" src="../js/group.js" charset="UTF-8"></script>
</body>

</html>