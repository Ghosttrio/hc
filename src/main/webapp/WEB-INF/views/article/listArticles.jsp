<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
 .Article_table { 
 margin  
 } 
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<h1>이벤트 참여 목록</h1>	
</head>
<body>

<h1>
<a href="/event1/event1.do">홈으로 돌아가기</a>
</h1>

<div class="Article_table" style="margin-top:7px;"> 

	<c:forEach var="vo" items="${ listArticles}">
			<table border=1>
					<tr>
						<td>
							글 번호 :${vo.articleNO }
						</td>
					</tr>	
					<tr>
						
						<td style="padding-left: ${(vo.level-1) * 20 }px">
							<a href="/viewArticle.do?articleNO=${vo.articleNO }">
							글쓴이 ID :${vo.replyId }
							</a>
						</td>
					</tr>
					<tr>
						<td>
						제목 :${vo.replyTitle }
						</td>
					</tr>
					<tr>
						<td>
							내용: ${vo.content }
						</td>
					</tr>
			</table>
					<br>
	</c:forEach>
</div>

</body>
</html>