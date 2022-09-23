<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container ">
            <a class="navbar-brand" href="/main">게더링(Gathering)</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>

            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ">
                    <li class="nav-item"><a class="nav-link" href="/group/createGroup">모임 만들기</a></li>
                    <li class="nav-item"><a class="nav-link" href="/group/groupList">활동중인 모임</a></li>
                    <li class="nav-item"><a class="nav-link" href="/qna/qnaList">Q&A 게시판</a></li>
                    <li class="nav-item"><a class="nav-link" href="/notice/noticeList">공지사항</a></li>
                </ul>
                <c:choose>
                <c:when test="${empty sessionScope.user}">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/user/join">Sign Up</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/login">Log In</a></li>
                </ul>
                </c:when>
                <c:otherwise>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/mypage/interestGroupList">MyPage(${sessionScope.user.name})</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </ul>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</html>