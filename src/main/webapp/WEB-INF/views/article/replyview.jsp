<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="vo" items="${ listArticles}">
	<table class="listArticles" bgcolor="lightblue" border=1 >

					
					
					<tr>
						<td>
						
							글쓴이 ID: ${vo.replyId }
							
						</td>
					</tr>
					<tr>
						<td>
							제목: ${vo.replyTitle }
						</td>
					</tr>
					<tr>
						<td>
							내용: ${vo.content }
						</td>
					</tr>
	</table>
</c:forEach>
	
</body>
</html>