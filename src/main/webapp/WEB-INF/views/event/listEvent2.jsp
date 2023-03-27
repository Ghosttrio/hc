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
	
		 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript">



    </script>
<style>

body {
background: whitesmoke;


}


.event_t {
	
	width:33%;
 	display:inline-block; 
 	
  	text-align: center; 
}
/* .event_t > img { */
	
/* 	width:100%; */
 	
/* } */

.event_top{
	width:30%;
	margin:100px;
	color: blue;
	font-size: 30px;
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
button{
padding: 25px 50px;
 border-radius: 15px;
 background-color: lightblue;
 font-size: 20px;
}
</style>
</head>

<body>
<!-- <button type="button" onclick="location.href='/addEvent.do'">이벤트 추가</button> -->
<!-- <button type="button" onclick="location.href='/modifyEvent.do'">이벤트 수정/삭제</button> -->

	<div class="event_top">
          <h1>EVENT</h1>
    </div> 
    

    
    
<!--  원래화면         -->

<c:forEach var="vo" items="${ eventsList}">
		<div class=event_t>
			
				<a href="/viewEvent2.do?id=${vo.id }">
					<img src ="${vo.firstimage }" width = "100%" ><br>
					${vo.title }<br>
					${vo.eventday }<br>
				</a>
			
		</div>
		
</c:forEach>


</body>
</html>