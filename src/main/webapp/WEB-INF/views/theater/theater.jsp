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
		<h1>����</h1>
		<div class="area_btn">
			<form action="theaterList.do">
				<input type="hidden" name="area_id" value="id_seoul">
		        <input type="submit" value="����">
	        </form>
	        <form action="theaterList.do">
	        	<input type="hidden" name="area_id" value="id_cheonan">
		        <input type="submit" value="õ��">
	        </form>
	        <form action="theaterList.do">
	        	<input type="hidden" name="area_id" value="id_cheongjo">
		        <input type="submit" value="û��">
	        </form>
        </div>
        <h2>�󿵽ð�ǥ</h2>
        <c:forEach var="showList" items="${showList }">
        	<h2>${showList.showdate }</h2>
        </c:forEach>
        <c:forEach var="theaterList" items="${theaterList }">
	        <c:if test="${theaterList.area_id == area_id }">
	        	<!-- ������ -->
	        	<c:forEach var="showList" items="${showList }">
	        		<c:if test="${theaterList.theater_id == showList.theater_id }">
		        		<div>�󿵳�¥: ${showList.showdate }</div>
		        		<div>�󿵽ð�: ${showList.showtime }</div>
	        		</c:if>
	        		<!-- ��ȭ���� -->
	        		<c:forEach var="movieList" items="${movieList }">
	        			<c:if test="${showList.articleNO == movieList.articleNO }">
			        		<div>��ȭ������: <img src="${movieList.poster_main }" width=100px height=50px></div>
			        		<div>��ȭ����: ${movieList.title }</div>
			        		<div>�����̿볪��: ${movieList.age }</div>
			        		<div>����Ÿ��: ${movieList.runningtime }</div>
		        		</c:if>
		        	</c:forEach>
	       		</c:forEach>
	        </c:if>
        </c:forEach>
	</div>
</body>
</html>