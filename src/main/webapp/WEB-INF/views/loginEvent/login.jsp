<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
body {
background: whitesmoke;


}
input {
width: 500px;
height: 30px;
border-radius: 15px;
}
.event_login {
display: center;
text-align: center;

}
.btn {
 background-color: skyblue;
  color: white;
  border: none;
  
  width: 100px;
  height: 30px;
}
</style>
</head>

<body>
	<div class="event_login">
			<form action="/login" method="post">
				<h1>이벤트 로그인</h1>
				<input type="text" name="id" placeholder="아이디를 입력하세요."><br><br>
				<input type="password" name="pw" placeholder="패스워드를 입력하세요"><br><br>
				<button class="btn">로그인</button>
			
			</form>
	</div>
</body>
</html>