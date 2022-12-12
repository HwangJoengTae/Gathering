<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">	
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />

<script type="text/javascript" src="../js/qna.js"></script>

</head>

<body id="page-top">
	<%@ include file="/WEB-INF/views/navibar.jsp"%>

	<!--사이드바 시작구간-->
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="/group/groupDetail?group_seq=${sudaVO.group_seq}"> <span
								data-feather="home"></span> 모임상세
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/group/groupNoticeListView?group_seq=${sudaVO.group_seq}">
								<span data-feather="file"></span> 모임공지
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/group/groupAlbum?group_seq=${sudaVO.group_seq}"> <span
								data-feather="shopping-cart"></span> 모임앨범
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/group/groupSuda?group_seq=${sudaVO.group_seq}"> <span
								data-feather="users"></span> 모임수다
						</a></li>
					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<!-- 메인구간 -->
				<form id="moveForm" method="get">
					<!-- 정보 저장용 히든 -->
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }"> <input
						type="hidden" name="group_seq" value="${sudaVO.group_seq}">
					<input type="hidden" name="keyword"
						value="${pageMaker.cri.keyword }"> <input type="hidden"
						name="type" value="${pageMaker.cri.type }">
				</form>

				<form method="get" id="moveForm" action="/group/groupSuda">
					<h2 style="padding-top: 5%">수다방</h2>
					
				
					<div class="row mb-2 align-items-center">
						<div class="col">
							
							<button type="button" class="btn btn-outline-dark">최신순</button>
							<button type="button"  class="btn btn-outline-dark">좋아요순</button>
							<button type="button" class="btn btn-outline-primary"
								style="float: right; margin-right: 10px"
								onclick="location.href='/group/sudaForm?group_seq=${sudaVO.group_seq}'">글쓰기</button>
						</div>
					</div>

					<div class="table-responsive">
						<table class="table table-hover table-striped table-sm">
							<thead>
								<tr>

									<th scope="col" style="text-align: center">번호</th>
									<th scope="col" style="width: 50%; text-align: center;">수다
										주제</th>
									<th scope="col" style="text-align: center">작성자</th>
									<th scope="col" style="text-align: center"> <i class="bi-heart-fill" style="font-size:1em; color: red; cursor: pointer;"></i></th>



								</tr>
							</thead>

							<tbody>
								<c:forEach items="${sudaList}" var="sudaVO">

									<!-- 클릭시 새창으로 띄워서 상세보기 -->
									<tr style="cursor: pointer"
										onclick="window.open('/sudaDetail?suda_seq=${sudaVO.suda_seq}&group_seq=${sudaVO.group_seq}','수다방','width=430, height=500, location=no, status=no, scrollbars=yes')">
										<td style="text-align: center">${sudaVO.suda_seq}</td>
										<td style="text-align: center">${sudaVO.content}
										 
										<small>&nbsp;&nbsp;<i class="bi bi-chat-square-dots"></i><b style="color:green;">&nbsp;[&nbsp;<c:out value="${sudaVO.reply_count}"/>&nbsp;]</b></small>
										
										</td>
										<td style="text-align: center">${sudaVO.user_id}</td>
										<td style="text-align: center">${sudaVO.like_cnt}</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


					<!--  검색버튼 구간 -->

					<div class="row mb-3 align-items-center justify-content-center">
						<div class="col-2" style="margin-left: 10%;">
							<select class="form-select form-select-md" name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
							</select>
						</div>
						<div class="col-2">
							<input type="text" class="form-control" name="keyword"
								value="${pageMaker.cri.keyword}">
						</div>
						<div class="col-2">
							<button class="btn btn-primary" type="button">검색</button>
						</div>
					</div>
					<!--페이징-->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage-1}" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="page-item"
									${pageMaker.cri.pageNum == num ? "active":"" }><a
									class="page-link" href="${num}">${num}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage + 1 }" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</form>

			</main>


		</div>

	</div>

	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


	<!-- 검색기능 자바스크립트 -->
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

	<!-- 페이지 등록 스크립트 -->
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
							moveForm.attr("action", "/group/groupSuda");
							moveForm.submit();
						});

		$(".pagination a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/group/groupSuda");
			moveForm.submit();

		});

		$(".col-2 button").on("click", function(e) {
			e.preventDefault();

			let type = $(".col-2 select").val();
			let keyword = $(".col-2 input[name='keyword']").val();

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
