<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>������ ������(�߰�)</title>
</head>
<body>
    <h1>������ ������(�߰�)</h1>
    <h1>��ȭ�߰�</h1>
    <form action="movieManager.do" method="GET">
    	��ȭ��ȣ : <input type="text" name="title"> <br>
	    Ÿ��Ʋ : <input type="text" name="title"> <br>
	    Ÿ��Ʋ(����) : <input type="text" name="title_en"> <br>
	    �������� : <input type="text" name="age"> <br>
	    ������ : <input type="text" name="opendate"> <br>
	    ���ƿ� �� : <input type="text" readonly> <br>
	    ���� : <input type="text" readonly> <br>
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
</body>
</html>