<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<c:choose>
		<c:when test='${msg == "addEvent" }'>
		  <script>
		    window.onload = function() {
		    	alert("이벤트가 등록되었습니다.");
		    }
		  </script>
		</c:when>
		
		<c:when test='${msg == "modified" }'>
		  <script>
		   window.onload = function() {
			   alert("이벤트를 수정했습니다.");
		   }
		  </script>
		 </c:when>
		 
		 <c:when test='${msg == "deleted" }'>
		   <script>
		   window.onload = function() {
			   alert("이벤트를 삭제했습니다.");
		   }
		   </script>
		 </c:when>
	</c:choose>
		 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript">



    </script>
<style>
/* 상단바시작         */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

#wrap {
	width: 100%;
	/* margin-top = header height */
	margin-top: 80px; /*상단 탭이랑 사이즈 잘 맞춰야함*/
}

/* Navigation bar */
header {
	/* for sticky header */
	position: fixed;
	top: 0;
	width: 100%;
	height: 80px;
	z-index: 2000;
	background-color: #fff;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05), 0 1px 0 rgba(0, 0, 0, 0.05);
}

.logo {
	display: inline-block;
	height: 5px;
	margin: 12px 0 12px 25px;
}

.logo>img {
	height: 50px;
}

nav {
	display: flex;
	justify-content: space-around;
}

.nav-items {
	margin-right: 20px;
}
/* nav-items 가로정렬 */
.nav-items>li {
	display: inline-block;
	margin-left: 40px;
	margin-right: 40px;
}

.nav-items>li>a {
	/* for Vertical Centering */
	line-height: 80px;
	padding: 0 30px;
	color: rgba(0, 0, 0, 0.4);
}

.nav-items>li>a:hover {
	color: rgba(0, 0, 0, 0.8);
}
/* 상단바 끝 */
/* .event_menu>ul>li{ */
    
/*     display: inline-block; */
/* } */
/* .event_main>ul>li{ */
/*     display:inline-block; */
/*     width: 20%; */
/*     height: 10%; */
/*     float: left; */
/*     margin-top: 20px; */
/*     margin-left: auto; */
/*     margin-right: auto; */
/* } */
/* .evt-thumb>img { */
/*     width: 100%; */
/* } */

.event_t {
	
	width:30%;
 	display:inline-block; 
}
/* .event_t > img { */
	
/* 	width:100%; */
 	
/* } */
.event_top{
	width:30%;
	margin:150px;
}

.cls1{
	width:50%;
	height:30%;
	font-size : 20px;
	text-align: center;
}
.cls2{
	font-size : 20px;
	text-align: center;
}
</style>
</head>
<body>

	<div class="event_top"></div>
          <h1>EVENT</h1>
    </div> 
    
<!--   수정/삭제   -->
<!-- <p class="cls1">이벤트</p> -->
<!-- <table align="center" border="1"> -->
<!-- 	<tr align="center" bgcolor="lightgreen"> -->
<!-- 		<td width="5%"><b>이벤트아이디</b></td> -->
<!-- 		<td width="5%"><b>이벤트제목</b></td> -->
<!-- 		<td width="5%"><b>이미지주소</b></td> -->
<!-- 		<td width="5%"><b>첫번째이미지내용(x)</b></td> -->
<!-- 		<td width="5%"><b>두번째이미지주소</b></td> -->
<!-- 		<td width="5%"><b>이벤트기간</b></td> -->
<!-- 		<td width="5%"><b>수정</b></td> -->
<!-- 		<td width="5%"><b>삭제</b></td> -->
<!-- 	</tr> -->
	
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${ empty eventsList }"> --%>
<!-- 		  <tr> -->
<!-- 		    <td colspan=5> -->
<!-- 		      <b>등록된 이벤트가 없습니다</b> -->
<!-- 		    </td> -->
<!-- 		  </tr> -->
<%-- 		</c:when> --%>
		
<%-- 		<c:when test = "${!empty eventsList }"> --%>
<%-- 	      <c:forEach var="eve" items="${eventsList }"> --%>
<!-- 	      	<tr align="center"> -->
<%-- 	      		<td>${eve.id }</td> --%>
<%-- 	      		<td>${eve.title }</td> --%>
<%-- 	      		<td>${eve.firstimage }</td> --%>
<%-- 	      		<td>${eve.firstimagead }</td> --%>
<%-- 	      		<td>${eve.secondimage }</td> --%>
<%-- 	      		<td>${eve.eventday }</td> --%>
<%-- 	      		<td><a href="/HumanCinema/event1/modEventForm.do?id=${eve.id }">수정</a></td> --%>
<%-- 	      		<td><a href="/HumanCinema/event1/delEventForm.do?id=${eve.id }">삭제</a></td> --%>
<!-- 			</tr> -->
<%-- 		  </c:forEach> --%>
<%-- 		</c:when>	   --%>
<%-- 	</c:choose> --%>
<!-- </table>    -->

<!-- <a href="/HumanCinema/event1/eventForm.do"> -->
<!-- 	<p class="cls2">이벤트 등록하기</p> -->
<!-- </a> -->
    
    
    
<!--  원래화면         -->
<c:forEach var="vo" items="${ eventsList}">
		<div class=event_t>
			
				<a href="/viewEvent.do?id=${vo.id }">
					<img src ="${vo.firstimage }" width = "100%" ><br>
					${vo.title }<br>
					${vo.eventday }<br>
				</a>
			
		</div>
</c:forEach>



</body>
</html>