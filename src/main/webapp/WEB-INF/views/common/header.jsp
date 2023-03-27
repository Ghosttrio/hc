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
       
       	a{text-decoration: none;}
       	
        header{
            font-family: 'Courier New', Courier, monospace;
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
            font-weight: 600;
            color: white;
            font-size: 20px;
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
            display: flex;
            justify-content: flex-end;
            color:black;  
            word-spacing: 20px;
            padding-bottom: 20px;
        }
        .login_signup div{
        	margin-top: 10px;
            margin-right: 50px;
            font-weight: 600;
            font-size: 17px;
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
            	
            <div id="logo_human"><a href="/main/main.do">
        		<img src="/image/headerLogo.png"/></a></div>
        		
			<div id="h4"><a href="/Store/storemain.do">
            	<span style="cursor: pointer">스토어</span></a></div>
            
            <div id="h5"><a href="/HumanCinema/event1/event1.do">
            	<span style="cursor: pointer">이벤트</span></a></div>
            
            <div id="h6"><a href="/notice/ntl">
            	<span style="cursor: pointer">고객센터</span></a></div>
        </div>
        
        <div class="login_signup">
         <div id="h7">
	            	<c:choose>
            			<c:when test="${isLogOn ==true and member!=null}">
	            				${member.member_id }님	|
		            			<a href="/member/logout" style="cursor: pointer">로그아웃</a> |
		            			<a href="/member/mypage.do" style="cursor: pointer">마이페이지</a>
		        	 	</c:when>
		          		<c:otherwise>
			       			 <a href="/member/login.do" style="cursor: pointer">로그인</a> |
			       			 <a href="/member/add.do" style="cursor: pointer">회원가입</a>
			     		 </c:otherwise>
			   		</c:choose>     
       		 </div>
		</div> 
		  	
    </header>
</body>
</html>