/**
 * 
 */
 
 
 //Qna 작성 빈칸 체크 
 function qna_save() {
	
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
				document.getElementById("formm").action="/qna_insert";
				document.getElementById("formm").submit();
		}
	}
	
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

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	