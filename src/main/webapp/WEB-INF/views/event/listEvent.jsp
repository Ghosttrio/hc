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