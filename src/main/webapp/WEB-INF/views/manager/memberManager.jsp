<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #wrap {
            margin-top: 30px;
            margin-left: 30px;
            margin-right: 30px;
        }
        header > *{
            display: inline-block;
        }
        h1{
            width: 90%;
        }
        section{
            border: 1px solid red;
        }
        section > *{
            display: inline-block;
            vertical-align: top;
        }
        aside{
            border: 1px solid red;
            width: 19%;
            height: 800px;
        }
        article{
            border: 1px solid red;
            width: 80%;
            height: 800px;
        }
        
        .member_id {
        }
        .member_pw {
        }
        .member_name {
        }
        .member_phone {
        }
        .box > div{
        	border:1px solid green;
        	width:100px;
        	display:inline-block;
        	vertical-align:top;
        }
        .box{
        	border:1px solid red;
        	text-align:center;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <header>
            <h1>관리자페이지</h1>
            <div><input type="submit" value="로그아웃"></div>
        </header>
        <section>
            <aside>
                <div>관리탭</div>
                <div><a href="memberManager.do"><input type="submit" value="회원관리"></a></div>
                <div><a href="movieManager.do"><input type="submit" value="영화관리"></a></div>
                <div><a href="theaterManager.do"><input type="submit" value="극장관리"></a></div>
            </aside>
            <article>
            	<h2>회원목록</h2>
            	<div class="box">
  					<div>
  						<h3>아이디</h3>
  						<c:forEach var="member" items="${memberList }">
  							<div class="member_id">${member.id }</div>
  						</c:forEach>
  					</div>
            		<div>
            			<h3>비밀번호</h3>
            			<c:forEach var="member" items="${memberList }">
  							<div class="member_pw">${member.pw }</div>
  						</c:forEach>
            			
            		</div>
            		<div>
            			<h3>이름</h3>
            			<c:forEach var="member" items="${memberList }">
  							<div class="member_name">${member.name }</div>
  						</c:forEach>
            		</div>
            		<div>
            			<h3>전화번호</h3>
            			<c:forEach var="member" items="${memberList }">
  							<div class="member_phone">${member.phone }</div>
  						</c:forEach>
            		</div>
            		<div>
            			<h3>수정</h3>
            			<c:forEach var="member" items="${memberList }">
  							<div class="update">수정</div>
  						</c:forEach>
            		</div>
            		<div>
            			<h3>삭제</h3>
            			<c:forEach var="member" items="${memberList }">
  							<div class="delete">삭제</div>
  						</c:forEach>
            		</div>
            	</div>
            </article>
        </section>
    </div>
</body>
</html>