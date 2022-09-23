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
        <h1>모임명 중복확인</h1>
        <form method=post name=formm1 id="theform" style="margin-right:0 " action="groupName_check_form">
            모임명 <input type=text name="group_name" value="${group_name}">
            <input type=submit value="검색" class="submit"><br>
            <div style="margin-top: 20px">
                <c:if test="${message == 1}">
                    <script type="text/javascript">
                        opener.document.getElementById("group_name").value="";
                    </script>
                    이미 사용중인 모임명입니다.
                </c:if>
                <c:if test="${message==-1}">
                    사용 가능한 모임명입니다.
                    <input type="button" value="사용" onclick="nameok()">
                </c:if>
            </div>
        </form>
    </div>
    
    
<!-- group 스크립트 -->    
<script type="text/javascript" src="../js/group.js"></script>    
</body>

</html>