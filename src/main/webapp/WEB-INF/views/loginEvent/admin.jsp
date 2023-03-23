<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<h3>
	<c:out value="${id}님 환영합니다!"/>
		<div>
			<a href="/event1/event1.do">이동하기</a>
		</div>
	</h3>
	
</body>
</html>