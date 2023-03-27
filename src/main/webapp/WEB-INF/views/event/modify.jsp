<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<c:set var="contextPath" value= "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>


body {
background: whitesmoke;


}

button {
    margin: 20px;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 25px 50px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    text-align:center;
    display: block;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-skin {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.w-btn-skin-outline:hover {
    background-color: #f8e6e0;
    color: #6e6e6e;
}
.cls1{
	width:30%;
	height:40%;
	font-size : 40px;
	text-align: center;
	color: blue;
}
.cls2{
	font-size : 20px;
	text-align: center;
	color: blue;
}
.event_mod{
	width:50%;
	height:60%;

}

.mod_table{
	width: 300px;
    height: 50px;
    border: 1px solid;
    line-height: 50px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;  
}
</style>
<title>Insert title here</title>
</head>

<body>
<!--   수정/삭제   -->
<p class="cls1">이벤트</p>

<p class="event_mod">
<table class="mod_table" align="center" border="1" >
	<tr align="center" bgcolor="lightgreen" >
		<td width="4%"><b>이벤트아이디</b></td>
		<td width="4%"><b>이벤트제목</b></td>
		<td width="4%"><b>이미지주소</b></td>
		<td width="4%"><b>두번째이미지주소</b></td>
		<td width="4%"><b>이벤트기간</b></td>
		<td width="4%"><b>수정</b></td>
		<td width="4%"><b>삭제</b></td>
	</tr>
	
	<c:choose>
		<c:when test="${ empty eventsList }">
		  <tr>
		    <td colspan=5>
		      <b>등록된 이벤트가 없습니다</b>
		    </td>
		  </tr>
		</c:when>
		
		<c:when test = "${!empty eventsList }">
	      <c:forEach var="eve" items="${eventsList }">
	      	<tr align="center">
	      		<td width="">${eve.id }</td>
	      		<td width="">${eve.title }</td>
	      		<td width="">${eve.firstimage }</td>
	      		<td width="">${eve.secondimage }</td>
	      		<td width="">${eve.eventday }</td>
	      		<td width=""><a href="/modifyEventForm.do?id=${eve.id }">수정</a></td>
	      		<td width=""><a href="/deleteEvent.do?id=${eve.id }">삭제</a></td>
			</tr>
		  </c:forEach>
		</c:when>	  
	</c:choose>
</table>   
</p>


	    <button class="w-btn w-btn-skin" type="button">
        <a href="/addEvent.do">
				<h1>이벤트 등록하기</h1>
			</a>
</a>
    
</body>
</html>