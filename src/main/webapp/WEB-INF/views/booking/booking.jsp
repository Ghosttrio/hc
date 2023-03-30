<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="showList" value="${showList }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HUMANCINEMA</title>
	<link rel="icon" href="/image/favicon.png">
	<link rel="stylesheet" href="/css/booking/booking.css?v=3">
</head>
<body>
    <div id="wrap">
        <!-- 상단바 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <h1>예매</h1>
        <!-- 선택상자 -->
        <div class="box">
            <div class="select_box">
	            <!-- 영화 선택 -->
	            <c:choose>
	            	<c:when test="${showList==null || showList==''}">
	            		<div class="movie">
	            			<div class="movie_title">영화목록</div>
	            			<c:forEach var="movieList" items="${movieList }">
	            				<form action="t_movie.do">
	            					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
	            					<input class="movie_btn" type="submit" value="${movieList.title }">
	            				</form>
	            			</c:forEach>
	            		</div>
	            		<div class="theater">
	            			<div class="theater_title">극장목록</div>
	            		</div>
	            		<div class="date">
	            			<div class="date_title">날짜</div>
		                </div>
		                <div class="time">
		                	<div class="time_title">시간</div>
		                </div>
		                <div class="btn0">
	            		</div>
	            	</c:when>
	            	<c:when test="${(showList != null || showList != '') && (articleNO!=null) && (theater_id==null)}">
	            		<div class="movie">
	            			<div class="movie_title">영화목록</div>
	            			<c:forEach var="movieList" items="${movieList }">
	            				<c:if test="${movieList.articleNO == articleNO }">
			            			<form action="t_movie.do">
			           					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
		           						<input class="movie_btn" type="submit" value="${movieList.title }">
		         					</form>
								</c:if>
	            			</c:forEach>
	            		</div>
	            		<div class="theater">
							<div class="theater_title">극장목록</div>
							<c:forEach var="theaterList" items="${theaterList }" varStatus="status">
								<c:forEach var="showList" items="${showList }">
									<c:if test="${showList.articleNO == articleNO}">
										<c:if test="${showList.theater_id == theaterList.theater_id }">
											<form action="t_movie.do">
												<input type="hidden" name="articleNO" value="${articleNO }">
												<input type="hidden" name="theater_id" value="${theaterList.theater_id }">
												<input class="theater_btn" type="submit" value="${theaterList.theater_name }">
											</form>
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>
	            		</div>
	            		<div class="date">
	            			<div class="date_title">날짜</div>
		                </div>
		                <div class="time">
		                	<div class="time_title">시간</div>
		                </div>
		                <div class="btn0">
	            		</div>
	            	</c:when>
	            	<c:when test="${(showList !=null || showList !='') && (theater_id!=null) && (articleNO!=null) && (showdate==null)}">
	            		<div class="movie">
	            			<div class="movie_title">영화목록</div>
	            			<c:forEach var="movieList" items="${movieList }">
	            				<c:if test="${movieList.articleNO == articleNO }">
			            			<form action="t_movie.do">
			           					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
		           						<input class="movie_btn" type="submit" value="${movieList.title }">
		         					</form>
								</c:if>
	            			</c:forEach>
	            		</div>
	            		<div class="theater">
							<div class="theater_title">극장목록</div>
							<c:forEach var="theaterList" items="${theaterList }">
								<c:if test="${theaterList.theater_id == theater_id }">
									<form action="t_movie.do">
										<input type="hidden" name="articleNO" value="${articleNO }">
										<input type="hidden" name="theater_id" value="${theaterList.theater_id }">
										<input class="theater_btn" type="submit" value="${theaterList.theater_name }">
									</form>
								</c:if>
							</c:forEach>
	            		</div>
	            		<div class="date">
							<div class="date_title">날짜</div>
							<c:forEach var="showList" items="${showList }">
								<c:if test="${showList.articleNO == articleNO}">
									<c:forEach var="theaterList" items="${theaterList }">
										<c:if test="${theaterList.theater_id == theater_id }">
											<form action="t_movie.do">
												<input type="hidden" name="articleNO" value="${articleNO }">
												<input type="hidden" name="theater_id" value="${theater_id }">
												<input class="date_btn" type="submit" name="showdate" value="${showList.showdate }">
											</form>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
		                </div>
		                <div class="time">
		                	<div class="time_title">시간</div>
		                </div>
	            	</c:when>
	            	<c:when test="${(showList !=null || showList !='') && (theater_id!=null) && (articleNO!=null) && (showdate!=null) && (showtime==null)}">
	            		<div class="movie">
	            			<div class="movie_title">영화목록</div>
	            			<c:forEach var="movieList" items="${movieList }">
	            				<c:if test="${movieList.articleNO == articleNO }">
			            			<form action="t_movie.do">
			           					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
		           						<input class="movie_btn" type="submit" value="${movieList.title }">
		         					</form>
								</c:if>
	            			</c:forEach>
	            		</div>
	            		<div class="theater">
							<div class="theater_title">극장목록</div>
							<c:forEach var="theaterList" items="${theaterList }">
								<c:if test="${theaterList.theater_id == theater_id }">
									<form action="t_movie.do">
										<input type="hidden" name="articleNO" value="${articleNO }">
										<input type="hidden" name="theater_id" value="${theaterList.theater_id }">
										<input class="theater_btn" type="submit" value="${theaterList.theater_name }">
									</form>
								</c:if>
							</c:forEach>
	            		</div>
	            		<div class="date">
							<div class="date_title">날짜</div>
							<c:forEach var="showList" items="${showList }">
								<form action="t_movie.do">
									<input type="hidden" name="articleNO" value="${articleNO }">
									<input type="hidden" name="theater_id" value="${theater_id }">
									<input class="date_btn" type="submit" name="showdate" value="${showList.showdate }">
								</form>
							</c:forEach>
		                </div>
		                <div class="time">
							<div class="time_title">시간</div>
							<c:forEach var="showList" items="${showList }">
								<form action="t_movie.do">
									<input type="hidden" name="showdate" value="${showdate }">
									<input type="hidden" name="articleNO" value="${articleNO }">
									<input type="hidden" name="theater_id" value="${theater_id }">
									<input class="time_btn" type="submit" name="showtime" value="${showList.showtime }">
								</form>
							</c:forEach>
		                </div>
		                <div class="btn0">
		                </div>
	            	</c:when>
	            	<c:when test="${(showList !=null || showList !='') && (theater_id!=null) && (articleNO!=null) && (showdate!=null) && (showtime!=null)}">
						<div class="movie">
							<div class="movie_title">영화목록</div>
	            			<c:forEach var="movieList" items="${movieList }">
	            				<c:if test="${movieList.articleNO == articleNO }">
			            			<form action="t_movie.do">
			           					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
		           						<input class="movie_btn" type="submit" value="${movieList.title }">
		         					</form>
								</c:if>
	            			</c:forEach>
	            		</div>
	            		<div class="theater">
							<div class="theater_title">극장목록</div>
							<c:forEach var="showList" items="${showList }">
								<c:if test="${showList.articleNO == articleNO}">
									<c:forEach var="theaterList" items="${theaterList }">
										<c:if test="${showList.theater_id == theaterList.theater_id }">
											<form action="t_movie.do">
												<input type="hidden" name="articleNO" value="${articleNO }">
												<input type="hidden" name="theater_id" value="${theaterList.theater_id }">
												<input class="theater_btn" type="submit" value="${theaterList.theater_name }">
											</form>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
	            		</div>
	            		<div class="date">
							<div class="date_title">날짜</div>
							<c:forEach var="showList" items="${showList }">
								<form action="t_movie.do">
									<input type="hidden" name="articleNO" value="${articleNO }">
									<input type="hidden" name="theater_id" value="${theater_id }">
									<input class="date_btn" type="submit" name="showdate" value="${showList.showdate }">
								</form>
							</c:forEach>
		                </div>
		                <div class="time">
							<div class="time_title">시간</div>
							<c:forEach var="showList" items="${showList }">
								<form action="t_movie.do">
									<input type="hidden" name="showdate" value="${showdate }">
									<input type="hidden" name="articleNO" value="${articleNO }">
									<input type="hidden" name="theater_id" value="${theater_id }">
									<input class="time_btn" type="submit" name="showtime" value="${showList.showtime }">
								</form>
							</c:forEach>
		                </div>
						<div class="btn0">
							<div class="pay">
								<c:forEach var="movieList" items="${movieList }">
									<c:if test="${articleNO == movieList.articleNO }">
										<div><img src="${movieList.poster_main }" width=100px height=160px></div>
										<div class="ticket_title">${movieList.title }</div>
									</c:if>
								</c:forEach>
								<div class="ticket_info">
									<c:forEach var="theaterList" items="${theaterList }">
										<c:if test="${theater_id == theaterList.theater_id }">
											<div>영화관 : ${theaterList.theater_name }</div>
										</c:if>
									</c:forEach>
									<div>날짜 :  ${showdate }</div>
									<div>시간 :  ${showtime }</div>
								</div>
								<div>
									<form action="pay.do">
										<input type="hidden" name="articleNO" value="${articleNO }">
										<input type="hidden" name="theater_id" value="${theater_id }">
										<input type="hidden" name="showdate" value="${showdate }">
										<input type="hidden" name="showtime" value="${showtime }">
										<div><input id="pay_btn" type="submit" value="결제하기"></div>
									</form>
								</div>
							</div>
						</div>
	           		</c:when>
	            </c:choose>
            </div>
        </div>
    </div>
</body>
</html>