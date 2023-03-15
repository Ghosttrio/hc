<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지(수정)</title>
</head>
<body>
    <h1>관리자 페이지(수정)</h1>
    <h1>영화수정</h1>
    <c:forEach var="movieList" items="${movieList }" varStatus="status">
	   <form action="movieManager.do" method="GET">
	    타이틀 : <input type="text" value="${movieList.title }" name="title">
	   	타이틀(영문) :	<input type="text" value="${movieList.title_en }" name="title_en">
	   	관람연령 :	<input type="text" value="${movieList.age }" name="age">
	   	개봉일 : <input type="text" value="${movieList.opendate }" name="opendate">
		영화설명 : <input type="text" value="${movieList.explain }" name="explain">
		감독 : <input type="text" value="${movieList.director }" name="director">
	   	장르 : <input type="text" value="${movieList.genre }" name="genre">
	   	러닝타임 :	<input type="text" value="${movieList.runningtime }" name="runningtime">
	  	배우 : <input type="text" value="${movieList.actor }" name="actor">
	   	포스터(배경) : <input type="text" value="${movieList.poster_back }" name="poster_back">
	   	포스터(메인) :	<input type="text" value="${movieList.poster_main }" name="poster_main">
	   	
	   	
	    <input type="submit">
	    <input type="reset">
	    <input type="hidden" name="command" value="update">
	   </form>
    </c:forEach>
</body>
</html>