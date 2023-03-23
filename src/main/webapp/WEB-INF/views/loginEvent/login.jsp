<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<form action="/login" method="post">
		<h1>이벤트 로그인</h1>
		<input type="text" name="id" placeholder="아이디를 입력하세요."><br>
		<input type="password" name="pw" placeholder="패스워드를 입력하세요">
		<button>로그인</button>
	
	</form>
</body>
</html>