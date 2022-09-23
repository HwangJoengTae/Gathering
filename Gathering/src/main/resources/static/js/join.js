function idcheck(){
    if(document.getElementById("user_id").value==""){
        alert("아이디를 입력해 주세요.");
        document.getElementById("user_id").focus();
        return false;
    }
    
    var url = "id_check_form?user_id=" + document.getElementById("user_id").value;
    window.open(url, "_black_", "toolbar=no, menubar=no, scrollbars=yes, width=500, height=250");
    
}



function idok() {
    opener.document.getElementById("user_id").value=document.formm.user_id.value;
    opener.document.getElementById("reid").value=document.formm.user_id.value;
    self.close();
}



function go_save(){
    if(document.getElementById("user_id").value==""){
        alert("아이디를 입력해 주세요.");
        document.getElementById("user_id").focus();
        return false;
    } else if(document.getElementById("user_id").value != document.getElementById("reid").value){
        alert("아이디 중복체크를 해주세요");
        return false;
    } else if(document.getElementById("password").value==""){
        alert("비밀번호를 입력해 주세요.");
        document.getElementById("password").focus();
        return false;
    } else if(document.getElementById("password").value != document.getElementById("password_check").value){
        alert("비밀번호가 일치하지 않습니다, 다시 입력해 주세요.");
        document.getElementById("password_check").focus();
        return false;
    } else if(document.getElementById("name").value==""){
        alert("이름을 입력해 주세요");
        document.getElementById("name").focus();
        return false;
    } else if(document.getElementById("nickname").value==""){
        alert("닉네임을 입력해 주세요");
        document.getElementById("nickname").focus();
        return false;
    } else if(document.getElementById("year").value=="" || document.getElementById("date").value==""){
        alert("생년월일을 입력해주세요");
        document.getElementById("year").focus();
        return false;
    } else if(document.getElementById("email1").value=="" || document.getElementById("email2").value==""){
        alert("이메일을 바르게 입력해 주세요");
        document.getElementById("email1").focus();
        return false;
    } else if(document.getElementById("phone1").value=="" || document.getElementById("phone2").value=="" || document.getElementById("phone3").value==""){
        alert("전화번호를 바르게 입력해주세요");
        return false;
    } else if(document.getElementById("address").value==""){
        alert("주소를 입력해주세요");
        return false;
    } else {
        document.getElementById("email").value=document.getElementById("email1").value + "@" + document.getElementById("email2").value;
        document.getElementById("phone").value=document.getElementById("phone1").value + document.getElementById("phone2").value + document.getElementById("phone3").value;

        document.getElementById("joinForm").action="joinForm";
        document.getElementById("joinForm").submit();
        alert("회원가입이 완료 되었습니다. 로그인 해주세요");
    }


}

