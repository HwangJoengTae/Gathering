/**
 * 
 */

 function login(){
    if(document.getElementById("user_id").value==""){
        alert("아이디를 입력하세요");
        document.getElementById("user_id").focus();
        return false;
    } else if (document.getElementById("password").value==""){
        alert("비밀번호를 입력하세요");
        document.getElementById("password").value.focus();
        return false;
    } else {
        document.getElementById("loginForm").action="loginForm";
        document.getElementById("loginForm").submit();
    }
}

function findUserInfoView(){
	var url = "findUserInfoView"
	window.open(url, "_blank_", "toolbar=no, menubar=no, scrollbars=yes, width=500, height=500")
}


function findId(){
    if(document.getElementById("email").value==""){
        alert("이메일을 입력해 주세요");
        document.getElementById("email").focus();
        return false;
    } else if (document.getElementById("password").value==""){
        alert("비밀번호를 입력해 주세요");
        document.getElementById("password").focus();
        return false;
    } else {
        document.getElementById("findId").action="findId";
        document.getElementById("findId").submit();
    }
}

function findPassword(){
    if(document.getElementById("user_id").value==""){
        alert("아이디를 입력해 주세요");
        document.getElementById("user_id").focus();
        return false;
    } else if (document.getElementById("email1").value==""){
        alert("이메일을 입력해 주세요");
        document.getElementById("email1").focus();
        return false;
    } else {
        document.getElementById("findPassword").action="findPassword";
        document.getElementById("findPassword").submit();
    }
}