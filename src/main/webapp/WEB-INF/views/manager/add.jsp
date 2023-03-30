<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="/css/manager/add.css">
</head>
<body>
    <div id="wrap">
        <header>
            <h1>������������</h1>
        </header>
        <section>
             <article>
				<div class="content">
					<h1>��ȭ�߰�</h1>
				    <form action="movieManager.do" method="GET">
				    	��ȭ��ȣ : <input type="text" name="articleNO" value="${articleNO }"> <br>
					    Ÿ��Ʋ : <input type="text" name="title"> <br>
					    Ÿ��Ʋ(����) : <input type="text" name="title_en"> <br>
					    �������� : <input type="text" name="age"> <br>
					    ������ : <input type="text" name="opendate"> <br>
					    ��ȭ���� : <input type="text" name="explain"> <br>
					    ���� : <input type="text" name="director"> <br>
					    �帣 : <input type="text" name="genre"> <br>
					    ����Ÿ�� : <input type="text" name="runningtime"> <br>
					    ��� : <input type="text" name="actor"> <br>
					    ������(���) : <input type="text" name="poster_back"> <br>
					    ������(����) : <input type="text" name="poster_main"> <br>
					    <input type="hidden" name="command" value="add">
					    <input type="submit">
					    <input type="reset">
				    </form>
	            </div>
			</article>
        </section>
    </div>
</body>
</html>