<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>����ϱ�</title>
</head>
<body>
<!-- �⺻ �޴� ���� -->
<h1>HumanCinema</h1><br>

	<div class="������"><a href="/ntl">������</a></div>
	<div class="��������"><a href="/ln">��������</a></div>
	<div class="1:1����"><a href="/qna">1:1����</a></div>
	<div class="��ȸ������"><a href="">��ȸ������</a></div>
	<div class="�̿���"><a href="">�̿���</a></div>

<!-- �۾��� ��� -->
	<form action="addwrite">
	<dl>
	<dt>Writer<dt>
	<dd><input type="text" name="writer"></dd>
	</dl>
	<dl>
	<dt>Title</dt>
	<dd><input type="text" name="title"><dd>
	</dl>
	<dl>
	<dt>Content<dt>
	<textarea name="content"></textarea>
	<br>
	</dl>
	<a href="ln" class="on">���</a>
	<input type="submit" value="���">
</form>
</body>
</html>