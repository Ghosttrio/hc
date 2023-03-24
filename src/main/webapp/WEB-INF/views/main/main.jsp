<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HUMANCINEMA</title>
    <link rel="icon" href="${path }resources/image/favicon.png">
	<link rel="stylesheet" href="${path }resources/css/main.css">
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script src="${path }resources/js/main.js"></script>
</head>
<body>
    <div id="wrap">
    	<!-- 헤더영역 -->
    	<jsp:include page="../common/header_main.jsp"></jsp:include>
    	<!-- 메인이미지 -->
    	<div class="main_image">
	    	<c:forEach var="movie" items="${movieList }" begin="0" end="0" varStatus="status">
	    		<img src="${path }resources/image/qq.jpg">
	    	</c:forEach>
    	</div>
       	<h2>무비차트</h2>
       	<!-- 무비차트영역 -->
        <article id="article1">
        	<c:forEach var="movie" items="${movieList }" begin="0" end="3" varStatus="status">
	        	<div class="movie_article">
	        	<!-- 이미지부분 -->
	    	    	<div class="image">
					    <img class="poster" src="${movie.poster_main }">
				        <div class="explain">
				        	<form id="article_form" action="movieInfo.do" method="get">
				        		<h1>${movie.title }</h1>
					          	<input type="hidden" name="articleNO" value="${movie.articleNO }">
					       		<input id="detail" type="submit" value="상세보기">
					       		<div class="movie_rate">
					       			관람평 ${movie.rate }
				       			</div>
				    		</form>
				     	</div>
				 	</div>
	    	    	
	    	    	<!-- 버튼부분 -->
	    	    	<div class="movie_btn">
	    	    	<!-- 좋아요버튼 -->
	    	    		<div class="like_btn">
		    	    		<form action="like.do">
			    	    		<input class="like_num" type="hidden" name="like_num" value="${movie.like_num}">
							  	<input class="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
							  	<input class="command" type="hidden" name="command1" value="like_it">
							  	<input class="like_btn${status.count }" type="button" value="♡ ${movie.like_num }">
		    	    		</form>
	    	    		</div>
	    	    		<!-- 예매버튼 -->
	    	    		<div class="booking_btn">
		    	    		<form action="booking.do">
			    	    		<input type="hidden" name="articleno" value="${movie.articleNO }">
			    	    		<input type="submit" value="예매">
		    	    		</form>
	    	    		</div>
					  
	    	    	</div>
	   	    	</div>
    	    </c:forEach>
        </article>
    </div>
</body>
</html>