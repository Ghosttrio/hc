<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan = "2">제품명</td>
			<td>수량</td>
			<td>가격<td>
			<td>총 금액</td>	
		</tr>
		<tr>
		<c:forEach var = "list" items = "${cartlist }">
			<td><img src = "${list.image }"></td>
			<td>${list.name }</td>
			<td>${list.price }</td>
			<td>${list.amount }</td>
			<td>!</td>
		</c:forEach>
		</tr>
	</table>
</body>
</html>