<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
textarea {
width: 500px;
 
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
}
.reply_top{
	color: blue;
}

</style>
</head>
<body>
<div class="reply_top">
	<h1 >답글쓰기</h1>
</div>
<form method="post" action="/replyForm2.do">

	글쓴이 ID :<input type="text" name="replyId" value="관리자" readonly/><br>
	제목: <input type="text" name="replyTitle" placeholder="제목을 입력하세요"><br>
	내용:
	<textarea name="content" rows="10" cols="65" placeholder="내용을 입력하세요"></textarea>
	<input type="hidden" name="parentNO" value="${parentNO }">
	<input type="hidden" name="id" value="${id }">
	<br><input type="submit" value="글쓰기"><br>
</form>
</body>
</html>