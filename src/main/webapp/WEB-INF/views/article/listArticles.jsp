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
<a href="/myapp/views/aricle/articleForm.jsp">글쓰기</a>
<table border=1>
<c:forEach var="vo" items="${ listArticles}">
<tr>
	<td>
		${vo.level }
	</td>
	<td style="padding-left: ${(vo.level-1) * 20 }px">
		<a href="/myapp/event1/viewArticle.do?articleNO=${vo.articleNO }">${vo.title }</a>
	</td>
	<td>
		${vo.content }
	</td>
</tr>
</c:forEach>
</table>

</body>
</html>