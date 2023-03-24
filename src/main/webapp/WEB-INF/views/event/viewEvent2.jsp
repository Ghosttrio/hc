<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<c:set var="contextPath" value= "${pageContext.request.contextPath }"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript">
    
    const $topBtn = document.querySelector(".moveTopBtn");

	 // 버튼 클릭 시 맨 위로 이동
	 $topBtn.onclick = () => {
	   window.scrollTo({ top: 0, behavior: "smooth" });  
	 }
	
	 const $bottomBtn = document.querySelector(".moveBottomBtn");
	
	 // 버튼 클릭 시 페이지 하단으로 이동
	 $bottomBtn.onclick = () => {
	   window.scrollTo({ top: document.body.scrollHeight, behavior: "smooth" });
	 };


    </script>
 
 <style>
 

body {
background: whitesmoke;


}

.secondimg {
	 width: 100%;
	display: center;
	
	 margin-top: 20px;
 text-align:center;
}

.cls {
	text-decoration: none;
}
. cls2 {
	text-align: center;
	fonbt-size: 30px;
}
.btns {
  display: flex;
  position: fixed;
  right: .4rem;
  bottom: .4rem;
}

.btns > div {
  padding: .6rem 1.5rem;
  background: skyblue;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  border-radius: 5px;
  transition: .2s;
  color: #fff;
  margin-right: .4rem;
}


.moveTopBtn:hover {
  color: #000;
  background: #febf00;
}
.moveBottomBtn:hover {
  color: #000;
  background: #febf00;
}

/* ------ */

@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");

* {
  font-family: Pretendard;
  user-select: none;
}

.list > div {
  margin-bottom: 1rem;
  margin-left: .4rem;
  font-size: 1.4rem;
}
.event_content{
	color:blue;
	
}
 </style>   
</head>
<body>
<div class="content">
	<c:forEach var="vo" items="${ secondEvent}">
		<div class="secondimg"> 

					<div class="event_content">
						<h1>이벤트 내용</h1>
					</div>
			<img src ="${vo.secondimage }">
		</div>
	</c:forEach>


	<table class="table"  border=1 >
				<tr bgcolor="lightblue">
					<td>
						글쓴이 ID
					</td>
					<td>
						제목
					</td>
					<td>
						내용
					</td>
<!-- 					<td> -->
<!-- 						관리자용 -->
<!-- 					</td> -->
				</tr>
			
		<c:forEach var="vo" items="${ listArticles}">
		
						<tr>	
							
								<td> ${vo.replyId }</td>
								
							
							
								<td> ${vo.replyTitle }</td>
							
							
								<td> ${vo.content }</td>
<!-- 							<td colspan="2" > -->
<%-- 								<a href="/modArticle.do?articleNO=${vo.articleNO }">	 --%>
<!-- 									<input type="button" value="수정하기"/> -->
<!-- 								</a> -->
								
<%-- 								<a href="/addreply.do?parentNO=${vo.articleNO }&id=${vo.id }">	 --%>
<!-- 									<input type="button" value="답글달기"/> -->
<!-- 								</a> -->
	 							
<!-- 							</td> -->
						</tr>
		</c:forEach>
							<td id="bottom">
								
								<a href="/replyForm.do?id=${param.id }">
									<input type="button" value="댓글쓰기"/>
								</a>
			
							</td>
	</table>	
	<br>
</div>
<div class="btns">
  <div class="moveTopBtn"><a href="#">맨 위로</a></div>
  <div class="moveBottomBtn"><a href="#bottom" id="bottom">댓글확인</a></div>
	<input type="hidden" id="bottom">
</div>
<!-- 	<div class="reply"> -->
	
<!-- 	<h1>댓글창</h1> -->
	
<%--  <a href="/HumanCinema/project2/replyForm.jsp?=${vo.eventNO }">글쓰기</a>  --%>
<!-- 	</div> -->
</body>
</html>