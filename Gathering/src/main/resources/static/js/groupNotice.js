/**
 * 
 */
 
 
 //작성 빈칸 체크 
 function groupNotice_save() {
	
		if(document.getElementById("title").value=="") {
				alert("제목을 입력해 주세요.");
				document.getElementById("title").focus();
				return false;
				
		}else if (document.getElementById("content").value=="") {
				alert("상세내용을 작성해 주세요.");
				document.getElementById("content").focus();
				return false;
		
		}else if (document.getElementById("type").value =="정모" && document.getElementById("jungmo_date").value=="") {
				alert("일시를 선택해 주세요.");
				document.getElementById("jungmo_date").focus();
				return false;
		
			}else if (document.getElementById("type").value =="정모" && document.getElementById("jungmo_place").value=="") {
				alert("주소를 입력해  주세요.");
				document.getElementById("jungmo_place").focus();
				return false;
											
		}else {
				document.getElementById("formm").action="/groupNoticeInsertAction";
				document.getElementById("formm").submit();
		}
	}
	
	
//업뎃  빈칸 체크 
 function groupNotice_update() {
	
		if(document.getElementById("title").value=="") {
				alert("제목을 입력해 주세요.");
				document.getElementById("title").focus();
				return false;
				
		}else if (document.getElementById("content").value=="") {
				alert("상세내용을 작성해 주세요.");
				document.getElementById("content").focus();
				return false;
		
		}else if (document.getElementById("type").value =="정모" && document.getElementById("jungmo_date").value=="") {
				alert("일시를 선택해 주세요.");
				document.getElementById("jungmo_date").focus();
				return false;
		
			}else if (document.getElementById("type").value =="정모" && document.getElementById("jungmo_place").value=="") {
				alert("주소를 입력해  주세요.");
				document.getElementById("jungmo_place").focus();
				return false;
											
		}else {
				document.getElementById("formm").action="/groupNoticeUpdateAction";
				document.getElementById("formm").submit();
		}
	}	
	
	
function onActive() {
	
		var input1 = document.getElementById("jungmo_date");
		var input2 = document.getElementById("address");
	
		if(document.getElementById("type").value =="일반") {	
			input1.value = null;
			input2.value = null;
			document.getElementById("jungmo_date").disabled = true;
			document.getElementById("address").disabled = true;
			return false;
	}else if (document.getElementById("type").value =="정모") {	
			input1.value = null;
			input2.value = null;
			document.getElementById("jungmo_date").disabled = false;
			document.getElementById("address").disabled = false;
			return false;
	}
}

//업뎃용
function onActiveUpdate() {
	
		var input1 = document.getElementById("jungmo_date");
		var input2 = document.getElementById("address");
	
		if(document.getElementById("type").value =="일반") {	
			input1.value = null;
			input2.value = null;
			document.getElementById("jungmo_date").disabled = true;
			document.getElementById("address").disabled = true;
			return false;
	}else if (document.getElementById("type").value =="정모") {	
			input1.value = null;
			input2.value = null;
			document.getElementById("jungmo_date").disabled = false;
			document.getElementById("address").disabled = false;
			return false;
	}
}
	
	
	
	
/*	
 //Qna 업데이트 빈칸 체크 
function qna_update() {
	
		if(document.getElementById("title").value=="") {
				alert("제목을 입력해 주세요.");
				document.getElementById("title").focus();
				return false;
				
		}else if (document.getElementById("content").value=="") {
				alert("상세내용을 작성해 주세요.");
				document.getElementById("content").focus();
				return false;
		
		}else if (document.formm.security[1].checked == true && document.getElementById("password").value=="") {
				alert("비밀번호를 입력해 주세요.");
				document.getElementById("password").focus();
				return false;
				
		}else {
				document.getElementById("formm").action="/qna_update";
				document.getElementById("formm").submit();
		}
	}	
	
//Qna 공개 or 비공개 비밀번호 활성화 여부 	
 function onActive() {
	
		var input = document.getElementById("password");
	
		if(document.formm.security[0].checked == true) {	
			input.value = null;
			document.getElementById("password").disabled = true;
			return false;
	}else if (document.formm.security[1].checked == true) {	
			input.value = null;
			document.getElementById("password").disabled = false;
			return false;
	}
}

		

/*Qna 비공개 비밀번호 체크페이지 팝업
	function pwdCheck() {
	
		var url = "/qnaPwdCheckView";
		window.open(url, "_blank_", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=350");

}
*/

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	