<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%-- <c:choose>
	<c:when test='${msg == "addMenu" }'>
		<script>
			window.onload = function(){
				alert("메뉴를 등록했습니다");
			}
		</script>
	</c:when>
	<c:when test='${msg=="modified" }'>
		<script>
			window.onload = function(){
				alert("메뉴 정보를 수정했습니다");
			}
		</script>
	</c:when>
	<c:when test='${msg=="deleted" }'>
		<script>
			window.onload = function(){
				alert("메뉴 정보를 삭제했습니다");
			}
		</script>
	</c:when>
</c:choose> --%>

<meta charset="UTF-8">
<title>스토어 관리자 페이지 ( 목록 )</title>
</head>
<body>
<section>
<h1>관리자페이지(목록)</h1>
<form action = "/StoreManager/StoreAddView.do" method = "post">
	<input type = "submit" value = "메뉴 추가 페이지">
	<div>
		<table border = 1>
			<thead>
					<tr>
						<th>메뉴아이디</th>
						<th>메뉴사진</th>
						<th>메뉴명</th>
						<th>가격</th>		
						<th>메뉴타입</th>
						<th colspan = "2">수정/삭제</th>			
					</tr>
			</thead>
			<tbody id = "tbody">
			<c:if test = "${not empty StoreList }">
				<c:forEach var = "list" items = "${StoreList }">
					<tr>
						<td>${list.menu_id }</td>
						<td><img src="${list.image }" width="150px" height= "150px"></td>
						<td>${list.name }</td>
						<td>${list.price }</td>
						<td>${list.menu_type }</td>
						<td><button type = "button" onClick="location.href='/StoreManager/detail.do?menu_id=${list.menu_id }'" >수정</button>
						<td><button type = "button" onClick="location.href='/StoreManager/DeleteStore.do?menu_id=${list.menu_id }'" >삭제</button></td>
					 </tr>
				</c:forEach>
			</c:if>
			<c:if test = "${empty StoreList }">
				<tr>
					<td colspan = "5" style = "text-align:center;">조회된 데이터가 없습니다</td>
				</tr>
			</c:if>
			</tbody>		
		</table>	
	</div>
</form>
</section>
</body>
</html>