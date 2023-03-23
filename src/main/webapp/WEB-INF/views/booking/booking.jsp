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
    <title>예매탭</title>
    <style>
    	
      


        /* 선택상자 */
        .box{
            border: 1px solid red;
            height: 700px;
            margin-top : 30px;
        }
        .select_box{
            border:1px solid red;
            height: 600px;
            font-size: 0;
        }
        .btn0{
            height: 100%;
        }
        .select_box > div{
            display: inline-block;
            font-size: 20px;
            height: 100%;
            vertical-align:top;
        }
        .movie {
            width: 25%;
            
            background-color: lightblue;
        }
        .theater{
            width: 35%;
           
            background-color: lightgray;
        }
        .date {
            width: 10%;
            background-color: lightgreen;
        }
        .time{
            width: 30%;
            background-color: lightyellow;
        }
        
        .movie_btn{
        	width:100%;
        	height:30px;
        }
    </style>

	<script>
		window.onload = () => {

		}
	</script>
</head>
<body>
    <div class="wrap">
        <!-- 상단바 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 선택상자 -->
        <div class="box">
            <div class="select_box">
	            <!-- 영화 선택 -->
	            <c:choose>
	            	<c:when test="${showList==null || showList==''}">
	            		<div class="movie">
	            			<c:forEach var="movieList" items="${movieList }">
	            				<form action="t_movie.do">
	            					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
	            					<input class="movie_btn" type="submit" value="${movieList.title }">
	            				</form>
	            			</c:forEach>
	            		</div>
	            		<div class="theater">
	            		</div>
	            		<div class="date">
		                </div>
		                <div class="time">
		                </div>
		                <div class="btn0">
	            		</div>
	            	</c:when>
	            	<c:when test="${(showList != null || showList != '') && (articleNO!=null) && (theater_id==null)}">
	            		
	            		<div class="movie">
	            			<c:forEach var="movieList" items="${movieList }">
		            			<form action="t_movie.do">
		           					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
	           						<input class="movie_btn" type="submit" value="${movieList.title }">
	         					</form>
	            			</c:forEach>
	            		</div>
	            		
	            		<div class="theater">
	            			<c:forEach var="theaterList" items="${theaterList }">
	            				<form action="t_movie.do">
	            					<input type="hidden" name="articleNO" value="${articleNO }">
	            					<input type="hidden" name="theater_id" value="${theaterList.theater_id }">
	            					<input type="submit" value="${theaterList.theater_name }">
	            				</form>
	            			</c:forEach>
	            		</div>
	            		<div class="date">
		                </div>
		                <div class="time">
		                </div>
		                <div class="btn0">
	            		</div>
	            	</c:when>
	            	<c:when test="${(showList !=null || showList !='') && (theater_id!=null) && (articleNO!=null) && (showdate==null)}">
	            		<div class="movie">
	            			<c:forEach var="movieList" items="${movieList }">
	            				<form action="t_movie.do">
	            				
	            					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
	            					<input class="movie_btn" type="submit" value="${movieList.title }">
	            				</form>
	            			</c:forEach>
	            		</div>
	            		<div class="theater">
	            			<c:forEach var="theaterList" items="${theaterList }">
	            				<form action="t_movie.do">
	            					<input type="hidden" name="articleNO" value="${articleNO }">
	            					<input type="hidden" name="theater_id" value="${theaterList.theater_id }">
	            					<input type="submit" value="${theaterList.theater_name }">
	            				</form>
	            			</c:forEach>
	            		</div>
	            		<div class="date">
	            			<form action="t_movie.do">
	            				<input type="hidden" name="articleNO" value="${articleNO }">
	            				<input type="hidden" name="theater_id" value="${theater_id }">
								<input type="submit" name="showdate" value="1일">
								<input type="submit" name="showdate" value="2일">
								<input type="submit" name="showdate" value="3일">
								<input type="submit" name="showdate" value="4일">
							</form>
		                </div>
		                <div class="time">
		                </div>
	            	</c:when>
	            	<c:when test="${(showList !=null || showList !='') && (theater_id!=null) && (articleNO!=null) && (showdate!=null) && (showtime==null)}">
	            		<div class="movie">
	            			<c:forEach var="movieList" items="${movieList }">
	            				<form action="t_movie.do">
	            					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
	            					<input class="movie_btn" type="submit" value="${movieList.title }">
	            				</form>
	            			</c:forEach>
	            		</div>
	            		<div class="theater">
	            			<c:forEach var="theaterList" items="${theaterList }">
	            				<form action="t_movie.do">
	            					<input type="hidden" name="theater_id" value="${theaterList.theater_id }">
	            					<input type="submit" value="${theaterList.theater_name }">
	            				</form>
	            			</c:forEach>
	            		</div>
	            		<div class="date">
	            			<form action="t_movie.do">
								<input type="submit" name="showdate" value="1일">
								<input type="submit" name="showdate" value="2일">
								<input type="submit" name="showdate" value="3일">
								<input type="submit" name="showdate" value="4일">
							</form>
		                </div>
		                <div class="time">
		                	<c:forEach var="showList" items="${showList }">
			                	<form action="t_movie.do">
			                		<input type="hidden" name="showdate" value="${showdate }">
			                		<input type="hidden" name="articleNO" value="${articleNO }">
			                		<input type="hidden" name="theater_id" value="${theater_id }">
		          					<input type="submit" name="showtime" value="${showList.showtime }">
		          				</form>
	          				</c:forEach>
		                </div>
		                <div class="btn0">
		                </div>
	            	</c:when>
	            	<c:when test="${(showList !=null || showList !='') && (theater_id!=null) && (articleNO!=null) && (showdate!=null) && (showtime!=null)}">
		                
			                <div class="movie">
		            			<c:forEach var="movieList" items="${movieList }">
		            				<form action="t_movie.do">
		            					<input type="hidden" name="articleNO" value="${movieList.articleNO }">
		            					<input class="movie_btn" type="submit" value="${movieList.title }">
		            				</form>
		            			</c:forEach>
		            		</div>
		            		<div class="theater">
		            			<c:forEach var="theaterList" items="${theaterList }">
		            				<form action="t_movie.do">
		            					<input type="hidden" name="theater_id" value="${theaterList.theater_id }">
		            					<input type="submit" value="${theaterList.theater_name }">
		            				</form>
		            			</c:forEach>
		            		</div>
		            		<div class="date">
								<input type="submit" name="showdate" value="1일">
								<input type="submit" name="showdate" value="2일">
								<input type="submit" name="showdate" value="3일">
								<input type="submit" name="showdate" value="4일">
			                </div>
			                <div class="time">
			                	<c:forEach var="showList" items="${showList }">
				                	<form action="t_movie.do">
				                		<input type="hidden" name="showdate" value="${showdate }">
				                		<input type="hidden" name="articleNO" value="${articleNO }">
				                		<input type="hidden" name="theater_id" value="${theater_id }">
			          					<input type="submit" name="showtime" value="${showList.showtime }">
			          				</form>
		          				</c:forEach>
			                </div>
			                <div class="btn0">
				                <c:forEach var="movieList" items="${movieList }">
				                	<c:if test="${articleNO == movieList.articleNO }">
				                		<div>영화 : ${movieList.title }</div>
				                	</c:if>
				                </c:forEach>
				                <c:forEach var="theaterList" items="${theaterList }">
				                	<c:if test="${theater_id == theaterList.theater_id }">
				                		<div>영화관 : ${theaterList.theater_name }</div>
				                	</c:if>
				                </c:forEach>
				                <div>날짜 :  ${showdate }</div>
				                <div>시간 :  ${showtime }</div>
				                <form action="pay.do">
				                	<div>티켓 수량 선택</div>
				            		<div><input type="submit" value="결제하기"></div>
			            		</form>
		            		</div>
	            		
	           		</c:when>
	            </c:choose>
	            
            </div>
        </div>
    </div>
</body>
</html>