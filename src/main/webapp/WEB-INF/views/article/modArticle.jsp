<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>Insert title here</title>
<style>
body {
background: whitesmoke;


}
input {
	margin: 20px;
  width: 500px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
/*   background-color: rgb(233, 233, 233); */
}
.modmember{
	color: blue;
}
</style>
</head>
<body>
	<div class="modmember">
		<h1>댓글수정</h1>
	
	</div>
<form method="post"  action="/modArticle2.do">


	<input type="hidden" name="articleNO" value="${param.articleNO }"><br>
	아이디: <input type="text" name="replyId" value="${dto.replyId }" 				placeholder="수정할 아이디를 입력하세요"><br>
	제목: <input type="text" name="replyTitle" value="${dto.replyTitle }"
				placeholder="수정할 제목을 입력하세요"><br>
	내용: <input type="text" name="content" value="${dto.content }"	
				placeholder="수정할 내용을 입력하세요"> <br>
				<input type="submit" value="수정">
<%-- 	글 번호: <input type="text" name="articleNO" value="${dto.articleNO }"><br> --%>

	
</form>

</body>
</html>