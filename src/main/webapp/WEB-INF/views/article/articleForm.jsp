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
.table > thead > tr > th, .table > tbody > tr > th {
			background-color: #e6ecff;
			text-align: center;
		}
body {
background: whitesmoke;
text-align: center;

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



</style>
<h1>댓글쓰기</h1>
</head>
<body>
<form method="post" action="/replyForm2.do">
	<table class="table">
		<thead>
		<tr>
			<td>
	회원 ID : <input type="text" name="replyId" placeholder="아이디를 입력하세요"><br>			
			</td>
		</tr>
		<tr>
			<td>
	제목: <input type="text" name="replyTitle" placeholder="제목을 입력하세요"><br>			
			</td>
		</tr>
		<tr>
			<td>
		내용: <textarea name="content" rows="10" cols="65"placeholder="내용을 입력하세요"></textarea>
			</td>
		</tr>
		<tr>
			<td>
		<br><input type="submit" value="글쓰기"><br>
			</td>
		</tr>
	 <input type="hidden" name="parentNO" value="0" /><br>
	
	 <input type="hidden" name="id" value="${id }" /><br>

		</thead>
	</table>
</form>
</body>
</html>