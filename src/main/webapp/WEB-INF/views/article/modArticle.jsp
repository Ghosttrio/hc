<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>ȸ������</h1>
<form method="post" action="/modArticle2.do">

	���̵�: <input type="text" name="replyId" value="${dto.replyId }"><br>
	����: <input type="text" name="replyTitle" value="${dto.replyTitle }"><br>
	����: <input type="text" name="content" value="${dto.content }"><br>
<%-- 	�� ��ȣ: <input type="text" name="articleNO" value="${dto.articleNO }"><br> --%>
	
	<input type="submit" value="����">
</form>

</body>
</html>