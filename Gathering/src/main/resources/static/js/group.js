/**
 * 
 */

 function groupNameCheck(){
    if(document.getElementById("group_name").value==""){
        alert("모임명을 입력해 주세요.");
        document.getElementById("group_name").focus();
        return false;
    }
    
    var url = "groupName_check_form?group_name=" + document.getElementById("group_name").value;
    window.open(url, "_black_", "toolbar=no, menubar=no, scrollbars=yes, width=500, height=250");
    
}

function nameok() {
    opener.document.getElementById("group_name").value=document.formm1.group_name.value;
    opener.document.getElementById("rename").value=document.formm1.group_name.value;
    self.close();
}

function createGroup(){
    if(document.getElementById("group_name").value==""){
        alert("모임명을 입력해 주세요");
        document.getElementById("group_name").focus();
        return false;
    } else if(document.getElementById("group_name").value != document.getElementById("rename").value){
        alert("중복체크를 해주세요");
        return false;
    } else if(document.getElementById("brief").value==""){
        alert("모임 간단소개를 입력해 주세요");
        document.getElementById("brief").focus();
        return false;
    } else if(document.getElementById("detail").value==""){
        alert("모임 상세소개를 입력해 주세요");
        document.getElementById("detail").focus();
        return false;
    } else {
        document.getElementById("createNewGroupForm").action="creatNewGroup";
        document.getElementById("createNewGroupForm").submit();
        alert("새로운 모임이 생성되었습니다. 회원들에게 보여질 간단소개와 사진을 등록해주세요.");
    }
  
}

function imageCheck(){
    if(document.getElementById("image").value==""){
        alert("사진을 등록해주세요")
        return false;
    } else {
        document.getElementById("joinCrewForm").action="joinForLeader";
        document.getElementById("joinCrewForm").submit();
    }
}

function imageCheckForCrew(){
    if(document.getElementById("image").value==""){
        alert("사진을 등록해주세요")
        return false;
    } else {
        document.getElementById("joinCrew").action="joinGroup";
        document.getElementById("joinCrew").submit();
    }
}


function deleteGroup(){
    if(document.getElementById("user_id").value==""){
        alert("아이디를 입력해 주세요.");
        document.getElementById("user_id").focus();
        return false;
    } else if(document.getElementById("password").value == ""){
        alert("비밀번호를 입력해 주세요.");
        document.getElementById("password").focus();
        return false;
    } else {
        document.getElementById("deleteGroupForm").action="deleteGroupForm";
        document.getElementById("deleteGroupForm").submit();
    }
}



