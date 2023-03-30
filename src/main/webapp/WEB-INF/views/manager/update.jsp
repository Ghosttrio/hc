
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>HUMANCINEMA</title>
	<link rel="icon" href="/image/favicon.png">
</head>
<body>
    <div id="wrap">
        <header>
            <h1>������������</h1>
        </header>
        <section>
             <article>
				<div class="content">
					<h1>��ȭ����</h1>
				    <c:forEach var="movieList" items="${movieList }" varStatus="status">
					   <form action="movieManager.do" method="GET">
							Ÿ��Ʋ : <input type="text" value="${movieList.title }" name="title"><br>
							Ÿ��Ʋ(����) :	<input type="text" value="${movieList.title_en }" name="title_en"><br>
							�������� :	<input type="text" value="${movieList.age }" name="age"><br>
							������ : <input type="text" value="${movieList.opendate }" name="opendate"><br>
							��ȭ���� : <input type="text" value="${movieList.explain }" name="explain"><br>
							���� : <input type="text" value="${movieList.director }" name="director"><br>
							�帣 : <input type="text" value="${movieList.genre }" name="genre"><br>
							����Ÿ�� :	<input type="text" value="${movieList.runningtime }" name="runningtime"><br>
							��� : <input type="text" value="${movieList.actor }" name="actor"><br>
							������(���) : <input type="text" value="${movieList.poster_back }" name="poster_back"><br>
							������(����) :	<input type="text" value="${movieList.poster_main }" name="poster_main"><br>
							<input type="submit">
							<input type="reset">
							<input type="hidden" name="command" value="update">
					   </form>
				    </c:forEach>
	            </div>
			</article>
        </section>
    </div>
</body>
</html>