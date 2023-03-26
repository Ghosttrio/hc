<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>No</th>
		<td>${dto.notice_seq.nextval}</td>
	</tr>	
	<tr>
		<th>구분</th>	
		<td>${dto.d2}</td>
	</tr>	
	<tr>
		<th>작성자</th>	
		<td>${dto.writer}</td>
	</tr>	
	<tr>
		<th>제목</th>	
		<td>${dto.title}</td>
	</tr>	
	<tr>
		<th>내용</th>	
		<td>${dto.content}</td>
	</tr>	
	<tr>
		<th>등록일</th>	
		<td>${dto.writeDate}</td>
	</tr>
	<tr>
		<th>조회수</th>	
		<td>${dto.cnt}</td>		
</table>
	<a href="" class="on">목록</a>
	<a href="/update" class="on">삭제</a>
	<a href="/addwrite">등록</a>

</body>
</html>