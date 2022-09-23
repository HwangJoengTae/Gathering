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
	<!--메인시작구간-->
	<div class="container-fluid">
		<!--요안에 다 담겨야됨 -->
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/mypage/interestGroupList"> <span
								data-feather="home"></span> 관심있는 모임
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mypage/joinedGroup"> <span data-feather="file"></span>
								내가 가입한 모임
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mypage/ownedGroup"> <span data-feather="shopping-cart"></span>
								내가 만든 모임
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mypage/myInfo"> <span data-feather="users"></span> 내
								정보 관리
						</a></li>
					</ul>
				</div>
			</nav>

			<!--메인구간 -->

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<form id="moveForm" method="get">
					<!-- 정보 저장용 히든 -->
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }"> <input
						type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
					<input type="hidden" name="type" value="${pageMaker.cri.type }">
				</form>

				<h2 style="padding-top: 5%">내가 만든 모임</h2>

				<!--모임 만들기 버튼-->
				<div class="row mb-5">
					<div class="col">
						<button type="button" class="btn btn-primary" style="float: right"
							onclick="location.href='/group/createGroup'">모임만들기</button>
					</div>
				</div>


				<c:if test="${empty groupList}">
					<h5 style="text-align: center">내가 가입한 모임리스트가 없습니다. 모임에 가입해보세요</h5>
				</c:if>
				<!--모임리스트-->

				<div class="row g-4 py-5 row-cols-1 row-cols-lg-3">

					<!-- <<<<<<<모임<<<<<<<< -->
					<c:forEach items="${groupList}" var="group">
						<div class="feature col-lg-3 border rounded py-4 m-2"
							style="cursor: pointer"
							onclick="location.href='/group/groupDetail?group_seq=${group.group_seq}'">
							<!--누르면 모임상세로-->
							<div class="form-check">
								<!-- 관심있는 모임에서 체크버튼있는 자리 -->
							</div>
							<h2>${group.group_name}</h2>
							<p>${group.brief}</p>
							<div class="text-muted">${group.region}</div>
							<div class="col-4 text-muted ">${group.kind}</div>
							<div class="col-4 text-muted ">${group.member_limit}</div>
						</div>
					</c:forEach>
					<!-- >>>>>>>카드>>>>>>>> -->

				</div>



			</main>
		</div>
	</div>

	<!-- Footer-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



	<script>
		$(document).ready(function() {

			var msg = "${msg}";

			if (msg != "") {
				alert(msg);
			}

		});

		function fn_search() {
			$("#listForm").submit();
			return false;
		}
	</script>
	<script>
		let moveForm = $("#moveForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();

							moveForm
									.append("<input type='hidden' name='group_seq' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/qna/qnaView");
							moveForm.submit();
						});

		$(".pagination a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/mypage/ownedGroup");
			moveForm.submit();

		});

		$(".col-2 button").on("click", function(e) {
			e.preventDefault();

			let type = $(".col-4 select").val();
			let keyword = $(".col-4 input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>


</body>

</html>
