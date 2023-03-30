<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>


<!-- 댓글 리스트 -->
<c:set var="articlesList" value="${articlesMap.articlesList }" />
<!-- 총 댓글 수 -->
<c:set var="totArticles" value="${articlesMap.totArticles }" />
<!-- 섹션 -->
<c:set var="section" value="${articlesMap.section }" />
<!-- 페이지 번호 -->
<c:set var="pageNum" value="${articlesMap.pageNum }" />

<c:set var = "total" value = "0" />
<c:forEach var="result" items="${articlesList}" varStatus="status">     
	<c:set var= "total" value="${total + result.comment_rate}"/>
</c:forEach>
<c:set var = "total1" value = "0" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HUMANCINEMA</title>
	<link rel="icon" href="/image/favicon.png">
	<link rel="stylesheet" href="/css/movie/movieInfo.css">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script src="/js/movie/movieInfo.js" defer></script>
</head>
<body>
    <div id="wrap">
	    <jsp:include page="../common/header.jsp"></jsp:include>
	    <input id="idcheck" type="hidden" value="${memberList }">
	    <!-- articleNO에 맞는 영화리스트  -->
        <!-- 영화이미지 div -->
        <c:forEach var="movie" items="${movieList }" varStatus="status">
        	<!-- 상단부분 -->
	        <div id="info">
        		<div id="back"><img src="${movie.poster_back }"></div>
	            <div id="left">
	                <div id="title1">${movie.title}</div>
	                <div id="title2">${movie.title_en}</div>
	                <form action="like.do">
	    	    		<input class="like_num" type="hidden" name="like_num" value="${movie.like_num}">
					  	<input class="articleNO1" type="hidden" name="articleNO1" value="${movie.articleNO}">
					  	<input class="command" type="hidden" name="command1" value="like_it">
					  	<input class="like_btn" type="button" value="♡ ${movie.like_num }">
    	    		</form>
				  	<c:if test="${total == 0 or total == null}">
				  		<div class="rate">평점 : 0</div>
				  	</c:if>
				  	<c:if test="${total != 0 and total != null}">
				  		<div class="rate">평점 : ${String.format("%.1f", (total / totArticles))}</div>
				  	</c:if>
	            </div>
	            <div id="right">
	                <div class="poster"><img src="${movie.poster_main}" width="290" height="404"></div>
	                <c:if test="${memberList != null }">
	    	    		<form action="booking.do">
		                	<input type="hidden" name="articleNO" value="${articleNO }">
		                	<input class="btn1" type="submit" value="예매">
		                </form>
    	    		</c:if>
    	    		<c:if test="${memberList == null }">
	    	    		<form action="login.do">
		    	    		<input type="hidden" class="booking_login_value2" value="1">
		    	    		<input class="btn1" type="submit" value="예매">
	    	    		</form>
    	    		</c:if>    
	            </div>
        	</div>
        	<div id="info2">
            	<h2>영화정보</h2>
            	<div class="article">
              		${movie.explain}
            	</div>
            	<div class="article">
                	<br>
                	감독 : ${movie.director} / 장르 : ${movie.genre} / ${movie.runningtime} 등급 : ${movie.age}이상관람가 
                	<br>
	                <div>
						<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
						 개봉일 : <fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
				    </div>
                	<br>
                	출연진 : ${movie.actor}
            	</div>
            	<div class="more"><a href="#" id="load">더보기 ▽ </a></div>
        	</div>
        	<!-- 댓글영역 -->
			<div id="comment">
	           	<div class="c_total">${movie.title}에 대한 ${totArticles }개의 이야기가 있어요!</div>
		            <div class="comment_wrap1">
		            	<h3>관람평쓰기</h3>
		            	<c:if test="${memberList != null }">
							<form method="get" action="reply.do">
								<input type="hidden" name="articleNO" value="${movie.articleNO }">
								<input type="hidden" name="comment_id" value="${memberList.member_id }">
								<input type="hidden" name="totArticles" value="${totArticles }">
								<input class="b" type="text" name = "comment_text" placeholder="  관람평을 입력해주세요">
								<input class="c" type="number" min="0" max="10" name = "comment_rate" placeholder="평점">
			    	    		<input class="comment_btn" type="submit" value="관람평쓰기">
		    	    		</form>
	    	    		</c:if>
	    	    		<c:if test="${memberList == null }">
		    	    		<form action="login.do">
								<input class="b" type="text" name = "comment_text" placeholder="  관람평을 입력해주세요">
								<input class="c" type="number" min="0" max="10" name = "comment_rate" placeholder="평점">
		    	    			<input type="hidden" class="comment_login_value" value="1">
		    	    			<input class="comment_login" type="button" value="관람평쓰기">
		    	    		</form>
	    	    		</c:if>
					</div>
					<br>
					<h3>댓글목록</h3>
					<c:forEach var="comment" items="${articlesList }" end="${articlesList.size() }" varStatus="status">
						<input class="endValue" type="hidden" value="${status.end + 1}">
						<input class="lvl" type="hidden" value="${comment.lvl}">
						<input class="current" type="hidden" value="${comment.lvl}">
						<c:set var="current" value="${status.current }" />
						<c:choose>
							<c:when test="${comment.lvl ==1}">
								<div class="comment_wrap2">
									<div class="comment_box">
										<div class="comment_id">${comment.comment_id } │ </div>
										<div class="comment_rate">${comment.comment_rate}점</div>
										<div class="comment_text">${comment.comment_text}</div>
										<c:if test="${memberList == comment.comment_id}">
											<div class="comment_manager">
												<form action="reply_del.do">
													<input type="hidden" name="articleNO" value="${movie.articleNO }">
													<input type="hidden" name="commentNO" value="${comment.commentNO }">
													<input class="comment_delete" type="submit" value="삭제">
												</form>
											</div>
										</c:if>
									</div>
									<div class="recomment">
										<c:if test="${memberList != null }">
											<form action="reply2.do">
												<div class="recomment_l"><h3>ㄴ</h3></div>
												<input type="hidden" name="articleNO" value="${movie.articleNO }">
												<input type="hidden" name="recommentNO" value="${comment.commentNO }">
												<input type="hidden" name="recomment_id" value="${memberList.member_id }">
												<input class="recomment_text" type="text" name = "recomment_text" placeholder="대댓글입력">
												<input class="recomment_btn" type="submit" value="대댓글입력">
											</form>
										</c:if>
										<c:if test="${memberList == null }">
											<form method="get" action="login.do">
												<div class="recomment_l"><h3>ㄴ</h3></div>
												<input type="hidden" class="recomment_login_value" value="1">
												<input class="recomment_text" type="text" name = "recomment_id" placeholder="대댓글입력">
												<input class="recomment_btn" type="submit" value="대댓글입력">
											</form>
										</c:if>
									</div>
								</div>
							</c:when>
							<c:when test="${comment.lvl > 1}">
									<div class="recomment_wrap">
										<div class="recomment_re">
											<div class="recomment_ll">ㄴ </div>
											<div class="dd">${comment.comment_id }님의 답글:</div>
											<div class="ee">${comment.comment_text}</div>
											<c:if test="${memberList.member_id == comment.comment_id}">
												<div class="comment_manager">
													<form action="reply_del.do">
														<input type="hidden" name="articleNO" value="${movie.articleNO }">
														<input type="hidden" name="commentNO" value="${comment.commentNO }">
														<input class="comment_delete" type="submit" value="삭제">
													</form>
												</div>
											</c:if>
										</div>
									</div>
							</c:when>
						</c:choose>
					</c:forEach>
	            	<!-- 페이징 -->
					<div id="paging" style="height:100px">
						<c:if test="${totArticles != null }">
							<c:choose>
								<c:when test="${totArticles > 100 }">
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${section > 1 && page == 1 }">
											<div class="no-uline">
												<form action="movieInfo.do" method="get">
													<input type="hidden" name="articleNO" value="${movie.articleNO }">
													<input type="hidden" name="section" value="${section-1 }">
													<input type="hidden" name="pageNum" value="${(section-1)*10 }">
													<input type="submit" value="pre">
												</form>
											</div>
										</c:if>
										<div class="no-uline">
											<form action="movieInfo.do" method="get">
												<input type="hidden" name="articleNO" value="${movie.articleNO }">
												<input type="hidden" name="section" value="${section}">
												<input type="hidden" name="pageNum" value="${page}">
												<input type="submit" value="${(section-1)*10 +page}">
											</form>
										</div>
										<c:if test="${page == 10 }">
											<form class="no-uline" action="movieInfo.do" method="get">
												<input type="hidden" name="articleNO" value="${movie.articleNO }">
												<input type="hidden" name="section" value="${section+1 }">
												<input type="hidden" name="pageNum" value="${section*10+1}">
												<input type="submit" value="next">
											</form>
										</c:if>
									</c:forEach>
								</c:when>
								<c:when test="${totArticles == 100 }">
									<c:forEach var="page" begin="1" end="10" step="1">
										<a class="no-uline" href="#">${page}</a>
									</c:forEach>
								</c:when>
								<c:when test="${totArticles < 100 }">
									<c:forEach var="page" begin="1" end="${totArticles/10 + 1}" step="1">
										<c:choose>
											<c:when test="${page==pageNum }">
												<div class="sel-page">
													<form action="movieInfo.do" method="get">
														<input type="hidden" name="articleNO" value="${movie.articleNO }">
														<input type="hidden" name="section" value="${section}">
														<input type="hidden" name="pageNum" value="${page }">
														<input type="submit" value="${page }">
													</form>
												</div>
											</c:when>
											<c:otherwise>
												<div class="no-uline">
													<form action="movieInfo.do" method="get">
														<input type="hidden" name="articleNO" value="${movie.articleNO }">
														<input type="hidden" name="section" value="${section}">
														<input type="hidden" name="pageNum" value="${page }">
														<input type="submit" value="${page }">
													</form>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:if>
					</div>
        		</div>
   		</c:forEach>
	</div>
</body>
</html>