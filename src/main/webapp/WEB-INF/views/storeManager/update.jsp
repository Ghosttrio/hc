<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자페이지(메뉴수정)</h1>
<hr>
	
		<form method ="post" action = "StoreUpdate.do" >
		<!-- 	<input type="hidden" name="_method" value="PUT" > -->
				아이디 : <input type = "text" name = "menu_id" value = "${storeDTO.menu_id }" readonly><br>
				메뉴명 : <input type = "text" name = "name" value = "${storeDTO.name }"><br>
				이미지 : <input type = "text" name = "image" value = "${storeDTO.image }"><br>
				가격 : <input type = "text" name = "price" value = "${storeDTO.price }"><br>
				<h3>메뉴타입</h3>
					<input type="checkbox" name="menu_type" value = "10"> 스낵 <br>
				    <input type="checkbox" name="menu_type" value = "20" > 음료 <br>
				    <input type="checkbox" name="menu_type" value = "30"> 영화관람권 <br>
				 
				<input type = "submit" value = "메뉴수정">
		</form>
	
</body>
</html>