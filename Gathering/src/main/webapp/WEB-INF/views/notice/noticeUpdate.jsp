<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
</style>
</head>

<body id="page-top">
	 <%@ include file="/WEB-INF/views/navibar.jsp" %>


	<!--메인구간 -->
	<form id="modifyForm" action="/notice/update_action" method="post">
		<input type="hidden" id="notice_seq" name="notice_seq"
			value="${noticeInfo.notice_seq }" /> <input type="hidden"
			id="notice_seq" name="notice_seq" value="${noticeInfo.user_id }" />
		<input type="hidden" id="notice_seq" name="notice_seq"
			value="${noticeInfo.regdate }" />

		<div class="col-10">
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<h2 style="padding-top: 5%">공지사항수정</h2>


				<!-- 공지사항 입력 -->


				<div class="mb-3">
					<!--공지사항 제목-->
					<div class="row mb-2">
						<label for="input_notice_title" class="col-sm-2 col-form-label">제목</label>

						<div class="col-7">
							<input type="text" class="form-control" id="title" name="title"
								value="${noticeInfo.title}">

						</div>
					</div>
					<hr>
					<!--공지사항 내용-->
					<div class="row mb-2">
						<label for="input_notice_content" class="col-sm-2 col-form-label">내용</label>

						<div class="col-7">
							<textarea class="form-control" id="content" name="content"
								rows="5" style="resize: none;">${noticeInfo.content}</textarea>
						</div>

					</div>
					<hr>
					<!--첨부파일-->
					<div class="row mb-2">
						<div class="form_section">
							<div class="form_section_title">
								<label>이미지</label>
							</div>
							<div class="form_section_content">
								<input type="file" multiple id="fileItem" name='uploadFile' multiple
									style="height: 30px;">
								<div id="uploadResult">
									
								</div>


							</div>
						</div>
					</div>
					<hr>
					<!--서밋버튼-->
					<div class="row">
						<div class="col text-center">


							<a class="btn btn-primary" id="modify_btn">수정 완료</a> <a
								class="btn btn-primary" id="cancel_btn">수정 취소</a>


						</div>
					</div>

				</div>
			</main>
		</div>
	</form>
	<form id="infoForm" action="/notice/update_action" method="get">
		<input type="hidden" id="notice_seq" name="notice_seq" value='<c:out value="${noticeInfo.notice_seq}"/>'>
		<!-- 정보 저장용 히든 -->
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		
		 
	</form>




	 <%@ include file="/WEB-INF/views/footer.jsp" %>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 수정확인 스크립트  -->
	<script>
		let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/notice/noticeList");
			form.submit();
		});
		
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {
			/* 이미지 존재시 삭제 */
			if($(".imgDeleteBtn").length > 0){
				deleteFile();
			}
			
			
			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			for (let i = 0; i < fileList.length; i++) {
				formData.append("uploadFile", fileList[i]);
			}
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				error : function(result) {
					alert("이미지 파일이 아닙니다.");
				}
			});

		});
		//위에는 일단 ajax 방식 끝난거 파일 객체 초기화 관련 

		//파일 첨부방식 관련 스크립트 위에가 실행되고 아래가 실행
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;

		}
		
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr){
			/* 전달받은 데이터 검증 */
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			
			let uploadResult = $("#uploadResult");
			
			let obj = uploadResultArr[0];
			
			let str = "";
			
			
			let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
			
			str += "<div id='result_card'>";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
			str += "</div>";
			
			uploadResult.append(str); 
		}
		
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			
			deleteFile();
			
		});
		/* 파일 삭제 메서드 */
		function deleteFile(){
			
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					targetDiv.remove();
					$("input[type='file']").val("");
					
				},
				error : function(result){
					console.log(result);
					
					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
	</script>

</body>

</html>