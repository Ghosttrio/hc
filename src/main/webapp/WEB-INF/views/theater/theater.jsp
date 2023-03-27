<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.area_btn form {
		display:inline-block;
		width:33%;
	}
	.area_btn input {
		width:400px;
		height:50px;
	}
</style>

</head>
<body>
	<div id="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<h1>극장</h1>
		<div class="area_btn">
			<form action="theaterList.do">
				<input type="hidden" name="area_id" value="id_seoul">
		        <input type="submit" value="서울">
	        </form>
	        <form action="theaterList.do">
	        	<input type="hidden" name="area_id" value="id_cheonan">
		        <input type="submit" value="천안">
	        </form>
	        <form action="theaterList.do">
	        	<input type="hidden" name="area_id" value="id_cheongjo">
		        <input type="submit" value="청주">
	        </form>
        </div>
        <h2>상영시간표</h2>
        <c:forEach var="showList" items="${showList }">
        	<h2>${showList.showdate }</h2>
        </c:forEach>
        <c:forEach var="theaterList" items="${theaterList }">
	        <c:if test="${theaterList.area_id == area_id }">
	        	<!-- 상영정보 -->
	        	<c:forEach var="showList" items="${showList }">
	        		<c:if test="${theaterList.theater_id == showList.theater_id }">
		        		<div>상영날짜: ${showList.showdate }</div>
		        		<div>상영시간: ${showList.showtime }</div>
	        		</c:if>
	        		<!-- 영화정보 -->
	        		<c:forEach var="movieList" items="${movieList }">
	        			<c:if test="${showList.articleNO == movieList.articleNO }">
			        		<div>영화포스터: <img src="${movieList.poster_main }" width=100px height=50px></div>
			        		<div>영화제목: ${movieList.title }</div>
			        		<div>관람이용나이: ${movieList.age }</div>
			        		<div>러닝타임: ${movieList.runningtime }</div>
		        		</c:if>
		        	</c:forEach>
	       		</c:forEach>
	        </c:if>
        </c:forEach>
	</div>
</body>
</html>