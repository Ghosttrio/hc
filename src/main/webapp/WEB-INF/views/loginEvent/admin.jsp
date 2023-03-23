<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>

@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    text-align: center;
    padding: 100px;
    background: whitesmoke;
    display: table-cell;
}
button {
    margin: 20px;
   
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 25px 50px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-skin {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.w-btn-skin-outline:hover {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.adminlogin{
	width: 350%;
	height: 500%;
	color: blue;
	text-align: center;
	display: block;
}



</style>


</head>
<body>

<div class="adminlogin">
	<h1>
	<c:out value="${id}님 환영합니다!"/>
	</h1>


	
    <button class="w-btn w-btn-skin" type="button">
        <a href="/event1/event1.do">
				<h1>홈으로 이동하기</h1>
			</a>
    </button>
</div>	
	
		
</body>
</html>