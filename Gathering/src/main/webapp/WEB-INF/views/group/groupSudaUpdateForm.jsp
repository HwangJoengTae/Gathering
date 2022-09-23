<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


	<div class="table-responsive">
		
		<table class="table table-sm">


			<tbody>

					<tr>
					<td colspan="3">
						<form id="modifyForm" action="/sudaUpdate" method="post">
				
						<h1 style="text-align:center; margin:40px 40px;">
						<input type="hidden" name="suda_seq" value="${sudaInfo.suda_seq }">
						<input type="text" name="content" value="${sudaInfo.content}"></h1>
							<div class="row my-3 align-items-center justify-content-center">
								<div class="col-2" style="text-align: right;">
									<label for="comments" class="form-label"></label>
								</div>
								
							</div>
						</form>
					</td>
				</tr>
			</tbody>

		</table>


	</div>
	
	<div class="row my-3">
	
		<div class="col text-center">
		
			<button class="btn btn-outline-primary" id="modify_btn">수정 완료</button>
      		<button class="btn btn-outline-primary" id="cancel_btn">수정 취소</button>
		
		</div>
	</div>







	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!--  ajax -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");    // 페이지 데이터 수정 from



/* 수정 하기 버튼 */
$("#modify_btn").on("click", function(e){
    mForm.submit();
});

/* 취소 버튼 */
$("#cancel_btn").on("click", function(e){
	     
	 window.close();
});    
	</script>
</body>

</html>