<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<!--  ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<style>
c {
	color: #000;
	display: inline-block;
	margin: 0;
	text-transform: uppercase;
}

c:after {
	display: block;
	content: '';
	border-bottom: solid 3px #ea2129;
	transform: scaleX(0);
	transition: transform 250ms ease-in-out;
}

c:hover:after {
	transform: scaleX(1);
}
</style>

</head>

<body id="page-top">
	<!-- 메인구간 -->
    		<form id="moveForm" method="get">
				<!-- 정보 저장용 히든 -->
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="type" value="${pageMaker.cri.type }">
				<input type="hidden" name="group_seq" value="${albumVO.group_seq }">
				
			</form>
	
	<!-- Nav바 구간-->
	<%@ include file="/WEB-INF/views/navibar.jsp"%>


	<!-- 시작구간-->
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/group/groupDetail?group_seq=${albumVO.group_seq}"> <span data-feather="home"></span>
								모임상세
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/group/groupNoticeListView?group_seq=${albumVO.group_seq}"> <span
								data-feather="file"></span> 모임공지
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/group/groupAlbum?group_seq=${albumVO.group_seq}"> <span data-feather="shopping-cart"></span>
								모임앨범
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/group/groupSuda?group_seq=${albumVO.group_seq}"> <span
								data-feather="users"></span> 모임수다
						</a></li>
					</ul>
				</div>
			</nav>
	


			<!--메인구간 -->
		
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		
				<h2 style="padding-top: 5%">${group.group_name} 앨범 </h2>

				<!-- 사진등록 버튼 -->
				<div class="row mb-2">
					<div class="col">
						<c:if test="${user !=null }">
							<button type="button" class="btn btn-outline-primary"
								id="album_button" style="float: right">사진등록</button>
						</c:if>
					</div>
				</div>

				<!--섹션 시작-->

		<section class="py-2">

			<div class="container px-4 px-lg-5 mt-5">
						<!--container -->

				<div
							class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

					<c:forEach items="${albumList}" var="album">
								
								<!--사진카드-->
						<div class="col mb-5">
								
								<h5>${album.title}</h5>
							<div class="card h-100">
								<img class="card-img-top" src="/upload/${album.filename}">
								<!-- 이미지 -->
							
								<div class="card-body p-3">
									<!-- 댓글 -->
									<div class="text-center">
										
										<button type="button" class="btn btn-outline-primary" class="fromCenter" 
											onclick="window.open('/group/albumDetail?group_album_seq=${album.group_album_seq}&group_seq=${album.group_seq}','ㅋㅋ','width=20,heigth=20')">댓글 입력</button>
											
									</div>
											

								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

						<!--  검색버튼 구간 -->
			             
                    <div class="row mb-3 align-items-center justify-content-center">
                        <div class="col-2" style="margin-left: 10%;">
                            <select class="form-select form-select-md" name="type">
                                <option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
								
                            </select>
                        </div>
                        <div class="col-2">
                            <input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
                        </div>
                        <div class="col-2">
                            <button class="btn btn-primary" type="button">검색</button>
                        </div>
                    </div>
				
				
                <!--페이징-->
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                    <c:if test="${pageMaker.prev}">
                      <li class="page-item">
                        <a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      </c:if>
                      <c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
                      <li class="page-item" ${pageMaker.cri.pageNum == num ? "active":"" }><a class="page-link" href="${num}">${num}</a></li>
                      </c:forEach>
                      <c:if test="${pageMaker.next}">
                      <li class="page-item">
                        <a class="page-link" href="${pageMaker.endPage + 1 }" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                      </c:if>
                    </ul>
               
                </nav>
						
		</section>
	
	</main>
</form>		
	</div>
			
</div>
	
		
		
	
		
	
				



	<%@ include file="/WEB-INF/views/footer.jsp"%>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!--  ajax -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		//사진등록 눌렀을때
		$("#album_button")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							const group_seq = '${albumVO.group_seq}';

							let popUrl = "/groupAlbumForm/" + "?group_seq="
									+ group_seq;
							console.log(popUrl);
							let popOption = "width = 490px, height=390px, top=300px, left=300px, scrollbars=yes";

							window.open(popUrl, "앨범 쓰기", popOption);

		});//사진 등록버튼
					
		let moveForm = $("#moveForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();

							moveForm
									.append("<input type='hidden' name='group_seq' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/group/groupAlbum");
							moveForm.submit();
						});

		$(".pagination a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/group/groupAlbum");
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