<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HUMANCINEMA</title>
	<link rel="icon" href="/image/favicon.png">
	<link  href="/css/common/header.css" rel="stylesheet" type="text/css" />
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="/js/common/header.js" defer></script>
</head>
<body>
	<header>
	    <div class="logo"><a href="main.do"><img src="/image/LOGO3.jpg" width="300px" height="100px"></a></div>
	    <c:set var="member" value="${memberList }" />
	    <c:choose>
		    <c:when test="${member == '' || member == null}">
			    <div class="login">
			        <div><a href="login.do">로그인</a></div>
			        <div><a href="signup.do">회원가입</a></div>
			    </div>
		    </c:when>
		    <c:when test="${member != '' && member !=null}">
	    		<div class="login2">
	    			<div>${memberList.member_id} 님</div>
	    			<a href="logout.do">
		    			로그아웃
		    		</a>
    			</div>
		    </c:when>
	    </c:choose>
	    <div class="tab_h">
	        <div><a href="movie.do">영화</a></div>
	        <div><a href="booking.do">예매</a></div>
	        <div class="search">
	        	<form action="movieInfo.do">
		        	<input id="schoolInput" type="text" data-cate="high" onkeyup="search(this);" placeholder="영화를 입력하세요">
		        	<div id="schoolList"></div>
	        		<h1 id="selected"></h1>
        		</form>
	        </div>
	    </div>
	</header>
</body>
</html>