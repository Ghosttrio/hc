<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지( 메뉴추가 )</title>
</head>
<body>
<h1>관리자페이지(메뉴추가)</h1>

<hr>
	<form method = "post" action = "StoreAdd.do" >
		아이디 : <input type = "text" name = "menu_id"><br>
		메뉴명 : <input type = "text" name = "name"><br>
		이미지 : <input type = "text" name = "image"><br>
		가격 : <input type = "text" name = "price"><br>
		<h3>메뉴타입</h3>
		
<<<<<<< HEAD
		    <input type="checkbox" name="menu_type" value = "10"> 스낵 <br>
		    <input type="checkbox" name="menu_type" value = "20" > 음료 <br>
		    <input type="checkbox" name="menu_type" value = "30"> 영화관람권 <br>
=======
		    <input type="radio" name="menu_type" value = "10"> 스낵 <br>
		    <input type="radio" name="menu_type" value = "20" > 음료 <br>
		    <input type="radio" name="menu_type" value = "30"> 영화관람권 <br>
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
		 
		<input type = "submit" value = "메뉴등록">
	</form>
</body>
</html>