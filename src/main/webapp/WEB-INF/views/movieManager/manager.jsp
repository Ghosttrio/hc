<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <title>관리자페이지</title>
    <style>
        #wrap{
            border: 1px solid black;
        }
        p {
            width: 90%;
            font-size: 40px;
            font-weight: 600;
        }
        .main > div{
            
            display: inline-block;
            vertical-align: top;
        }
        .main{
            font-size: 0;
            width: 100%;
            height: 700px;
        }
        .side{
            width: 10%;
            height: 100%;
            font-size: 25px;
            text-align: center;
            background-color: black;
        }

        .side > div {
            margin-top: 30px;
            
            height: 50px;
        }

        .content{
            width: 90%;
            height: 100%;
            font-size: 10px;
        }
        .top > * {
            display: inline-block;
        }
        .top{
            border-bottom: 1px solid black;
        }

        .side_btn {
            width: 100%;
            height: 100%;
            
        }
        
        	img {
		width:200px;
		height:300px;
	}
	.add{
		
	}
	.update{
	
	}
	.delete{
	
	}
	.article{
		display:inline-block;
		margin-left:20px;
	}
	
	.top2{
		margin-top:20px;
		width:100%;
		margin-bottom:20px;
	}
	.top2 > *{
		display:inline-block;
	}
	.top2_1{
		width:80%;
		font-size:30px;
		font-weight:600;
	}
    </style>
<script>
	window.onload = () => {
		
		document.querySelector(".add").addEventListener("click",function(){
			let managerForm = document.managerForm
			managerForm.action="add.do";
			managerForm.method="post";
			managerForm.submit();
		});
		
		document.querySelector(".update").addEventListener("click",function(){
			let managerForm = document.managerForm
			managerForm.action="update.do";
			managerForm.method="post";
			managerForm.submit();
		});
		
		/* document.querySelector(".delete").addEventListener("click",function(){
			let managerForm = document.managerForm
			managerForm.action="movieManager.do";
			managerForm.method="get";
			managerForm.submit();
		}); */
	}
</script>
</head>
<body>
    <div id="wrap">
        <div class="top">
            <p>관리자페이지</p>
            <div>관리자이름</div>
        </div>
        <div class="main">
            <div class="side">
                <div><input class="side_btn" type="button" value="영화관리"></div>
                <div><input class="side_btn" type="button" value="회원관리"></div>
                <div><input class="side_btn" type="button" value="스토어관리"></div>
                <div><input class="side_btn" type="button" value="이벤트관리"></div>
            </div>
            <div class="content">
				<form name="managerForm">
					<div class="top2">
						<div class="top2_1">영화관리</div>
						<input class="add" type="button" value="영화추가하기">
					</div>
					<c:forEach var="movie" items="${movieList }" varStatus="status">
						<div class="article">
							<div><img src="${movie.poster_main }"></div>
							<div>${movie.title}</div>
							<input class="update" type="button" value="수정">
							<input type="hidden" name="articleNO" value="${movie.articleNO }">
						 	<a href="movieManager.do?command=delete&title=${movie.title}"><input id="delete" type="button" value="삭제"></a>
						</div>
					</c:forEach>
					
					
					<input type="hidden" name="command" value="delete">
				</form>
            </div>
        </div>
    </div>
</body>
</html>





