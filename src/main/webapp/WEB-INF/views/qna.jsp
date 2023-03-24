<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 기본 메뉴 구현 -->
<!-- 기본 메뉴 구현 -->
<h1>HumanCinema</h1><br>

	<div class="고객센터"><a href="/ntl">고객센터</a></div>
	<div class="공지사항"><a href="/ln">공지사항</a></div>
	<div class="1:1문의"><a href="/qna">1:1문의</a></div>
	<div class="비회원문의"><a href="">비회원문의</a></div>
	<div class="이용약관"><a href="">이용약관</a></div>
	

<h2> [공지/뉴스] </h2>
<h3> 휴먼시네마의 공지/뉴스 및 다양한 이벤트 소식을 확인하실수 있습니다.</h3>


<!-- 목록 리스트 구현  -->
<table border=1>
	<thead>
		<tr>
          <td class="num">NO</td>
          <td class="d2">구분</td>
          <td class="writer">작성자</td>
          <td class="title">제목</td>
          <td class="content">내용</td>
          <td class="date">등록일</td>
          <td class="cnt">조회수</td>
         </tr>
	</thead>
	<tbody>
		<!-- 1:1문의 사항 내용 출력 -->
		<!-- 1:1문의 사항에는 구분에 1:1문의사항만 출력되게 만들고 싶다 -->
		<!-- 그럴려면 어떤 기능을 사용해야 할까??? -->
		<c:forEach var="dto" items="${qna}">
		<tr>
			<td>${dto.noticeNo}</td>
			<td>${dto.d2}</td>
			<td>${dto.writer}</td>
			<td>${dto.title}</td>
			<td>${dto.content}</td>
			<td>${dto.writeDate}</td>
			<td>${dto.cnt}</td>
		</tr>
		</c:forEach>	
	</tbody>       
          
  </table>     
<!-- 하단 버튼 구현 -->
	<a href="" class="on">목록</a>
	<a href="/addwrite">등록</a>


</body>
</html>