<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HUMANCINEMA</title>
	<link rel="icon" href="/image/favicon.png">
	<link rel="stylesheet" href="/css/manager/manager.css">
	<script src="/js/manager/manager.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
            <h1>관리자페이지</h1>
        </header>
        <section>
            <article>
				<div class="content">
					<form name="managerForm" >
						<div class="top2">
							<div class="top2_1">영화관리</div>
							<c:forEach var="movie" items="${movieList }" begin="${movieList.size() - 1}" end="${movieList.size() }" varStatus="status">
								<form>
									<input type="hidden" name="articleNO" value="${status.end + 1}">
									<input class="add" type="button" value="영화추가하기">
								</form>
							</c:forEach>
						</div>
						<c:forEach var="movie" items="${movieList }" begin="0" end="${movieList.size() }" varStatus="status">
							<div class="article">
								<div><img src="${movie.poster_main }" width=120px; height=180px;></div>
								<div class="title_long">${movie.articleNO}. ${movie.title }</div>
								<input class="update${status.count}" type="button" value="수정">
								<input class="count" type="hidden" value="${status.count}">
								<input class="count_end" type="hidden" value="${status.end}">
								<input class="articleNO${status.count}" type="hidden" name="articleNO" value="${movie.articleNO }">
							 	<a href="movieManager.do?command=delete&title=${movie.title}"><input class="delete" type="button" value="삭제"></a>
							</div>
						</c:forEach>
						<input type="hidden" name="command" value="delete">
					</form>
	            </div>
			</article>
        </section>
    </div>
</body>
</html>