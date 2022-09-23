<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>아이디 중복 체크</title>
    <link href="CSS/subpage.css" rel="stylesheet">
    <style type="text/css"></style>
</head>

<body>
    <div id="wrap">
        <h1>ID 중복확인</h1>
        <form method=post name=formm id="theform" style="margin-right:0 " action="id_check_form">
            User ID <input type=text name="user_id" value="${user_id}">
            <input type=submit value="검색" class="submit"><br>
            <div style="margin-top: 20px">
                <c:if test="${message == 1}">
                    <script type="text/javascript">
                        opener.document.getElementById("user_id").value="";
                    </script>
                    ${user_id}는 이미 사용중인 아이디입니다.
                </c:if>
                <c:if test="${message==-1}">
                    ${user_id}는 사용 가능한 ID입니다.
                    <input type="button" value="사용" onclick="idok()">
                </c:if>
            </div>
        </form>
    </div>
    
    
<!-- join 스크립트 -->    
<script type="text/javascript" src="../js/join.js"></script>    
</body>

</html>