<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 추가페이지</title>
</head>
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
</style>
<body>
<h1>이벤트 등록하기</h1>
<form method="post" action="/addEventView.do">
	 ID : <input type="text" name="id" value="id"><br>
	title: <input type="text" name="title"><br>
	첫번째 이미지:  <input type="text" name="firstimage"><br>
	두번째 이미지:  <input type="text" name="secondimage"><br>
	이벤트 날짜:  <input type="text" name="eventday"><br>
	<input type="submit" value="추가"><br>
</form>
</body>
</html>