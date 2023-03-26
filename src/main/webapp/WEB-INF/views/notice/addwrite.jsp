<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록하기</title>
</head>
<body>
<!-- 기본 메뉴 구현 -->
<h1>HumanCinema</h1><br>

	<div class="고객센터"><a href="/ntl">고객센터</a></div>
	<div class="공지사항"><a href="/ln">공지사항</a></div>
	<div class="1:1문의"><a href="/qna">1:1문의</a></div>
	<div class="비회원문의"><a href="">비회원문의</a></div>
	<div class="이용약관"><a href="">이용약관</a></div>

<!-- 글쓰기 기능 -->
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
	<a href="ln" class="on">목록</a>
	<input type="submit" value="등록">
</form>
</body>
</html>