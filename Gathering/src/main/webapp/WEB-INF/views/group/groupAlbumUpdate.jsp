<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="../css/crew_write.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/roadmap_common.css">

<!-- 구글 아이콘 링크 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- 다음주소 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- summernote -->
<link rel="stylesheet"
	href="../css/board_summernote/summernote-lite.css">
<script src="../js/board_summernote/summernote-lite.js"></script>
<script src="../js/board_summernote/lang/summernote-ko-KR.js"></script>
<!-- <script src="../js/board_write_summernote.js"></script> -->
<!-- //summernote -->


<script type="text/javascript">
	$(function() {

		$("#summernote").summernote(
				{

					height : 10, // 에디터 높이
					minHeight : null, // 에디터 최소 높이
					maxHeight : null, // 에디터 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정

					//  추가 부분
					toolbar : [
							// [groupName, [list of button]]
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							[ 'color', [ 'forecolor', 'color' ] ],
							[ 'table', [ 'table' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							[ 'insert', [ 'picture', 'link', 'video' ] ],

					],
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체',
							'바탕체' ],
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72' ],

					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							for (var i = files.length - 1; i >= 0; i--) {
								sendFile(files[i], this);
							}
						}// onimagesUpload
					}
				// callback

				}); //summernote
	}); //function

	//파일 업로드 실행 메소드
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : 'summerUpload',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) { //성공 시 url이 입력됨.
				$(el).summernote('editor.insertImage', img_name);
			}
		});

	}//sendFile
</script>
<!---등록 자바스크립트 -->

</head>
<body>
	<section>
		<div class="wrap">
			<div class="t-left">
				
			</div>

		</div>

		<div class="wrap">
			<!-- form -->
			<form id="modifyForm" action="/albumupdate" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="group_album_seq" value="${albumInfo.group_album_seq}">
				<h2><input type="text" name="title" value="${albumInfo.title}"></h2>
				<div class="main1">
					<input type="hidden" id="c_expose" name="c_expose">
					<div class="chart">
						<span style="color: red; margin-top: 20px;">제목을 수정해주세요</span>
				
						<div>
						<div ></div><img class="card-img-top" src="/upload/${albumInfo.filename}"></div>
							<textarea id="summernote" name="titles" rows="1" cols="1"
								spellcheck="false"></textarea>
						</div>
						<table>
							<tr>
								<td class="info"><span class="material-icons">upload_file</span>파일첨부</td>
								<td style="width: 200px;"><input type="file" name="file1"
									id="file1"></td>
							</tr>

						</table>
					
					</div>
			</form>
				</div>
				<div class="col text-center">
			
		
        		<button class="btn btn-outline-primary" id="modify_btn">수정 완료</button>
      		    <button class="btn btn-outline-primary" id="cancel_btn">수정 취소</button>
				</div>
				


		
	</section>
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