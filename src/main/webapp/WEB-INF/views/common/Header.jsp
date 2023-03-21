<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle:wght@400;700&family=East+Sea+Dokdo&family=Poor+Story&display=swap');
       
       	a{text-decoration: none;}
       	
        header{
            /* font-family: 'Dongle', sans-serif; */
            /* font-family: 'East Sea Dokdo', cursive; */
            font-family: 'Poor Story', cursive;
            margin-top: 30px;
            text-decoration:none;
		
        }
        
        .header_list {
        	font-color:black;
            padding: 0 10px 0 10px;
            letter-spacing: 1px;
            opacity: 0.85;/* 투명도 */
            background-color: black;
            display: flex;
            justify-content: space-around;
            text-align: center;
            height: 100px;
        }
        .header_list div{
            width: 100px;
            line-height: 100px;
            font-weight: 500;
            color: white;
            font-size: 25px;
        }
        .header_list a{
        	color:white;
        }
        #logo_human{
            width: 160px;
            height: 100px;
        }
        #logo_human img{
            width: 160px;
            height: 50px;
            vertical-align: middle;
        }
        .login_signup {
            margin-top: 10px;
            display: flex;
            justify-content: flex-end;
            color:black;  
        }
        .login_signup div{
            margin-right: 40px;
            font-weight: 600;
            font-size: 20px;
        }
        .login_signup a{
        	color:black;
        }

    </style>

</head>
<body>
    <header>
        <div class="header_list">
            <div id="h1"><a href="/myapp/movie/movieTab.do">
            	<span style="cursor: pointer">영화</span></a></div>
            
            <div id="h2"><a href="">
            	<span style="cursor: pointer">예매</span></a></div>
            
            <div id="h3"><a href="/HumanCinema/cinema/cinema.do">
            	<span style="cursor: pointer">극장</span></a></div>
            	
            <div id="logo_human"><a href="/HumanCinema/movie1/main.do">
        		<img src="/HumanCinema/img/logoCI.png"/></a></div>
        		
			<div id="h4"><a href="/HumanCinema/menu/store.do">
            	<span style="cursor: pointer">스토어</span></a></div>
            
            <div id="h5"><a href="/HumanCinema/event1/event1.do">
            	<span style="cursor: pointer">이벤트</span></a></div>
            
            <div id="h6"><a href="/HumanCinema/board/listArticles.do">
            	<span style="cursor: pointer">고객센터</span></a></div>
        </div>
        
        <div class="login_signup">
            <div id="h7">
	            <ul>
	            	<c:choose>
	            			<c:when test="${isLogOn ==true and member!=null}">
	            				<h3>${member.member_id }님 로그인 중</h3>
		            			<li><a href="${contextPath}/member/logout" style="cursor: pointer"><h3>로그아웃</h3></a></li>
		            			<li><a href="${contextPath}/member/mypage" style="cursor: pointer"><h3>마이페이지</h3></a></li>
		        	 	 </c:when>
		          		<c:otherwise>
			       			 <li><a href="${contextPath}/member/login.do" style="cursor: pointer"><h3>로그인</h3></a></li>
			       			 <li><a href="${contextPath}/member/add.do" style="cursor: pointer"><h3>회원가입</h3></a></li>
			     		 </c:otherwise>
			   		</c:choose>     
			   	</ul>
       		 </div>
		</div>   	
    </header>
</body>
</html>