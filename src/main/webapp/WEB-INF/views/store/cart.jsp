<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD

=======
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
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
</body>
</html>