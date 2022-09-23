<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<style>
.active {
	background-color: #cdd5ec;
}
</style>


</head>

<body id="page-top">
	<%@ include file="/WEB-INF/views/navibar.jsp" %>


	<!--메인구간 -->

	<form id="moveForm" method="get">
		<!-- 정보 저장용 히든 -->
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
	


		<div class="col-10">
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<h2 style="padding-top: 5%">공지사항</h2>

				<div class="row mb-2 align-items-center-between my-3">
					<div class="col-5" id="product_order_list">
						
							


						
					</div>

					<div class="col">
						<!-- 유저타입이 (0 관리자?) 일때만 등록 버튼 생김 -->
						<c:choose>
							<c:when test="${user.user_type==0 }">
								<button type="button" class="btn btn-outline-primary"
									style="float: right; margin-right: 10px"
									onclick="location='/notice/noticeForm';">등록</button>
							</c:when>
						</c:choose>
					</div>

				</div>


				<!-- 테이블 데이터 시작구간 -->
				<div class="table-responsive">
					<table class="table table-hover table-striped table-sm">
						<thead>
							<tr>
								<th scope="col" style="text-align: center">번호</th>
								<th scope="col" style="width: 50%; text-align: center;">제목</th>
								<th scope="col" style="text-align: center">작성일</th>
								<th scope="col" style="text-align: center">조회수</th>

							</tr>	
						</thead>
						<tbody class="listData">
							<c:forEach var="list" items="${noticeList}">
								<tr style="cursor:pointer" onclick="location.href='/notice/noticeDetail?notice_seq=${list.notice_seq}'">
									<td style="text-align: center">
									${list.notice_seq}</td>
									<td scope="col" style="text-align: center"> ${list.title}</td>
									<td scope="col" style="text-align: center">	<fmt:formatDate value="${list.regdate}" type="date"/></td>
									<td scope="col" style="text-align: center">${list.cnt}</td>
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
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
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
               
               </main>
               
		</div>

	


	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<!-- Ajax -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- 검색기능 자바스크립트 -->
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

	<!-- 페이지 등록 수정 스크립트 -->
	<script>
		let moveForm = $("#moveForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();

							moveForm
									.append("<input type='hidden' name='notice_seq' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/notice/noticeDetail");
							moveForm.submit();
						});

		$(".pagination a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/notice/noticeList");
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