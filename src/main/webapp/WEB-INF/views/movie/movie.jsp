<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HUMANCINEMA</title>
	<link rel="icon" href="/image/favicon.png">
	<link rel="stylesheet" href="/css/movie/movie.css">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.3.min.js" defer></script>
	<script type="text/javascript" src="/js/movie/movie.js" defer></script>
</head>
<body>
    <div id="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<h1>전체영화</h1>
		<div class="tab">
		    <div id="tab1">상영중</div>
		    <div id="tab2">상영예정</div>
	    </div> 
	    <div class="all">
			<div class="section1">
				<c:forEach var="movie" items="${movieList }" varStatus="status">
					<c:if test="${movie.opendate < formatedNow }">
						<div class="movie_article">
						<!-- 이미지부분 -->
							<div class="image">
								<img class="poster" src="${movie.poster_main }">
								<div class="explain">
									<form id="article_form" action="movieInfo.do" method="get">
										<h3>${movie.title }</h3>
										<input type="hidden" name="articleNO" value="${movie.articleNO }">
										<input class="detail" type="submit" value="상세보기">
									</form>
								</div>
							</div>
							<!-- 영화정보 -->
							<div class="info">
								<div class="title_long">${movie.title }</div>
								<div>${movie.age }</div>
								<div>
									<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
									<fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
								</div>
							</div>
							<!-- 버튼부분 -->
							<div class="movie_btn">
							<!-- 좋아요버튼 -->
								<c:if test="${memberList != null }">
									<div class="like_btn">
										<form action="like.do">
											<input class="like_num" type="hidden" name="like_num" value="${movie.like_num}">
											<input class="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
											<input class="command" type="hidden" name="command1" value="like_it">
											<input class="like_login${status.count }" type="hidden" name="like_login" value="1">
											<input class="like_btn${status.count }" type="button" value="♡ ${movie.like_num }">
										</form>
									</div>
								</c:if>
								<c:if test="${memberList == null }">
									<div class="like_btn">
										<form action="like.do">
											<input class="like_num" type="hidden" name="like_num" value="${movie.like_num}">
											<input class="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
											<input class="command" type="hidden" name="command1" value="like_it">
											<input class="like_login${status.count }" type="hidden" name="like_login" value="2">
											<input class="like_btn${status.count }" type="button" value="♡ ${movie.like_num }">
										</form>
									</div>
								</c:if>
								<!-- 예매버튼 -->
								<c:if test="${memberList != null }">
									<div class="booking_btn">
										<form action="booking.do">
											<input type="hidden" name="articleno" value="${movie.articleNO }">
											<input type="submit" value="예매">
										</form>
									</div>
								</c:if>
								<c:if test="${memberList == null }">
									<div class="booking_btn">
										<a href="login.do">
											<input type="hidden" class="booking_login_value2" value="1">
											<input class="booking_login2" type="button" value="예매">
										</a>
									</div>
								</c:if>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<div class="more"><a href="#" class="load">더보기 ▽ </a></div>
			</div>
			<div class="section2">
				<c:forEach var="movie" items="${movieList }" varStatus="status">
					<c:if test="${movie.opendate > formatedNow }">
						<div class="movie_article2">
						<!-- 이미지부분 -->
							<div class="image">
								<img class="poster" src="${movie.poster_main }">
								<div class="explain">
									<form id="article_form" action="movieInfo.do" method="get">
										<h3>${movie.title }</h3>
										<input type="hidden" name="articleNO" value="${movie.articleNO }">
										<input class="detail" type="submit" value="상세보기">
									</form>
								</div>
							</div>
							<!-- 영화정보 -->
							<div class="info">
								<div class="title_long">${movie.title }</div>
								<div>${movie.age }</div>
								<div>
									<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
									<fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
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
								<c:if test="${memberList != null }">
									<div class="booking_btn">
										<form action="booking.do">
											<input type="hidden" name="articleno" value="${movie.articleNO }">
											<input type="submit" value="예매">
										</form>
									</div>
								</c:if>
								<c:if test="${memberList == null }">
									<div class="booking_btn">
										<a href="login.do">
											<input type="hidden" class="booking_login_value2" value="1">
											<input class="booking_login2" type="button" value="예매">
										</a>
									</div>
								</c:if>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<div class="more2"><a href="#" class="load2">더보기 ▽ </a></div>
			</div>
		</div>
	</div>
</body>
</html>