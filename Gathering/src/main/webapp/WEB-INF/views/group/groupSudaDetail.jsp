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
<title>수다방</title>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css">
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
	
	
	
	<h1 style="text-align:center; margin:40px 40px;">${sudaInfo.content}</h1>
	<!-- 이미좋아요를 눌렀다면 -->
	<c:if test="${like > 0 }"> 
	<button id=LikeBtn class="btn btn-outline-danger bi bi-heart-fill bt-3" ></button>
	
	</c:if>
	<!--  좋아요를 눌르지 않았다면  -->
	<c:if test="${like <= 0 }"> 
	<button id=LikeBtn class="btn btn-light bi bi-heart bt-3"></button>
	</c:if>
	
	<b>좋아요</b> 
	<b class="ms-1"> <c:choose>
						 <c:when test="${getLike.likenum==null }">0개</c:when>
						 <c:when test="${getLike.likenum>=1}">${getLike.likenum}개</c:when>
					 </c:choose>
	
	</b>
	
	<div class="table-responsive mt-3" >
		
		<table class="table table-sm" >


			<tbody>

				<tr>
					<th>
						<form id="commentListForm" name="commentListForm" method="post">
							<div id="commentList">
								
							</div>
						</form>
					</th>
				</tr>
					

				<tr>
					<td colspan="3">
						<form name="commentForm" id="commentForm" method="post">
							<div class="row my-3 align-items-center justify-content-center">
								<div class="col-2" style="text-align: right;">
									<label for="comments" class="form-label"></label>
								</div>

								<div class="col-6">
									<input type="hidden" name="suda_seq"
										value="${sudaInfo.suda_seq}" />
									<textarea class="form-control" id="content" name="content"
										rows="4" style="resize: none;"></textarea>
										
								</div>
								<div class="col-2">
									<input class="btn btn-primary"
										onClick="save_comment('${sudaInfo.suda_seq}')"
										type="button" value="등록" id="insert"> <input
										type="hidden" id="suda_seq" name="suda_seq "
										value="${sudaInfo.suda_seq}" />
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
		<c:if test="${sessionScope.user.user_id eq sudaInfo.user_id }">
			<div class="mb-3"><a href="javascript:void(0);" class="btn btn-outline-primary"
				onclick="UpdateFormConfirm(); " style="float: center">사용자:수정</a>
			<a href="javascript:void(0);" class="btn btn-outline-primary"
				onclick="deleteConfirm(); " style="float: center">사용자:삭제</a>
			</div>	
		</c:if>
		<c:forEach items="${crewList}"  var="crewListVo" varStatus="status">
  		<c:if test="${crewListVo.type eq 1  && sessionScope.user.user_id eq crewListVo.user_id}">
			<div><a href="javascript:void(0);" class="btn btn-outline-primary"
				onclick="UpdateFormConfirm(); " style="float: center">관리자:수정</a>
			<a href="javascript:void(0);" class="btn btn-outline-primary"
				onclick="deleteConfirm(); " style="float: center">관리자:삭제</a>
			</div>
		</c:if>
		</c:forEach>
		
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

	<script type="text/javascript">
	//문의사항상세 로딩시에 해당 댓글목록 조회하여 출력
	$(document).ready(function() {
		var likeval = ${like};
		
		let suda_seq = ${sudaInfo.suda_seq};
		let user_id = '${user.user_id}';
		
		console.log("수다 넘버 : " + suda_seq);
		console.log("유저 이름 : " + user_id);
		
		if(likeval > 0){
			console.log(likeval + " 좋아요 누름 ");
			$('#LikeBtn').html("");
			$('#LikeBtn').click(function() {
				$.ajax({
					type :'post',
					url : '/likeDown',
					contentType: 'application/json',
					data : JSON.stringify(
							{
								'suda_seq' : suda_seq,
								'user_id' : user_id
							}		
						),
					success : function(data) {
						alert('좋아요 취소!');
						location.reload();
					}, error : function(){
						alert('에러');
					}
				})// 아작스 끝
			})

		}else{
			console.log(likeval + " 좋아요 안누름")
			console.log(user_id);
			$('#LikeBtn').click(function() {
				$.ajax({
					type :'post',
					url : '/likeUp',
					contentType: 'application/json',
					data : JSON.stringify(
							{
								'suda_seq' : suda_seq,
								'user_id' : user_id
							}		
						),
					success : function(data) {
						alert('좋아요!');
						location.reload();
					},error : function(){
						alert('에러');
					}// 에러끝 
		   		})// 아작스 끝
			  })// click function 끝
	 	   	}//esle 끝 
		
		getCommentList();
		
		

	});

	/*
	 ** 댓글리스트
	 */
	function getCommentList() {

		$
				.ajax({
					type : 'GET',
					url : '/Suda_commnets_list',
					dataType : 'json',
					data : $("#commentForm").serialize(), //아이디가 #아래인 폼을 읽어서 그안의 파라메타id들을 읽어서 위에 url로 보내겠다.
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success : function(data) {

						var commentList = data.commentList;
						showHTML(commentList);
					},
					error : function() {
						alert("댓글 목록을 조회하지 못했습니다.")
					}
				});
	}

	function showHTML(commentList) {
		var html = "";
		var p_html = "";

		if (commentList.length > 0) {
			// 댓글의 각 항목별로 HTML 생성
			$
					.each(
							commentList,
							function(index, item) {
								html += "<div>";
								html += "<div id=\"comment_item\"> ("
										+ item.user_id
										+ "</b>) : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ";
								html += item.content + "</div>";
								html += "<span id=\"write_date\">"
										+ displayTime(item.regDate)
										+ "</span><br>";
								html += "</div>";
							});

		} else { // 조회된 댓글이 없을 경우
			html += "<div>";
			html += "<h5>등록된 답변이 없습니다.</h5>";
			html += "</div>";
		}
		// 댓글 목록 출력
		$("#commentList").html(html);

	}

	//댓글 등록 시간 설정
	function displayTime(timeValue) {
		var today = new Date();

		// 현재시간에서 댓글등록시간을 빼줌
		var timeGap = today.getTime() - timeValue;

		// timeValue를 Date객체로 변환
		var dateObj = new Date(timeValue);

		// timeGap이 24시간 이내인지 판단
		if (timeGap < (1000 * 60 * 60 * 24)) { // 시, 분, 초를 구함
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			//return hh + ':' + mi + ':' + ss;
			return [ (hh > 9 ? '' : '0') + hh, ':',
					(mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ]
					.join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();

			//return yy + "-" + mm + "-" + dd;
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}

	function save_comment(suda_seq) {
		$.ajax({
			type : 'POST',
			url : '/Suda_comments_insert',
			data : $("#commentForm").serialize(), //아이디가 #아래인 폼을 읽어서 그안의 파라메타id들을 읽어서 위에 url로 보내겠다.
			success : function(data) {
				if (data == 'success') { //  등록 성공
					getCommentList(); // 
					$("#content").val("");
				} else if (data == 'fail') {
					alert("댓글등록이 실패하였습니다. 다시 시도해 주세요.");
				} else if (data == 'not_logedin') {
					alert("댓글등록은 로그인이 필요합니다.");
				}
			},
			error : function(request, status, error) {
				alert("error:" + error);
			}
		});
	}

		function UpdateFormConfirm() {

			
				location.href = "/sudaUpdateForm?suda_seq=${sudaInfo.suda_seq}";
			

		}
	
		
		
	
		
	</script>

</body>

</html>