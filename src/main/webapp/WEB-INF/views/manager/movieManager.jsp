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
            
        }
        section > *{
            display: inline-block;
            vertical-align: top;
        }
        aside{
            width: 19%;
            height: 800px;
            background-color:#333;
            color:white;
        }
        article{
            width: 100%;
            height: 800px;
            overflow:scroll;
            background-color:#f2f0e5;
            
        }
        .article{
        	width:120px;
        	display:inline-block;
        	margin-bottom:10px;
        	border-radius:5%;
        	padding:3px;
        	background-color:#333;
        	
        }
        .article img {
        	border-radius:5%;
        }
        .top2_1{
        	font-size:20px;
        	font-weight:600;
        	margin-bottom:10px;
        }
        .content{
        	padding:10px;
        }
        .top2 > * {
        	display:inline-block;
        }
        .add{
        	float:right;
        }
        .title_long{
			white-space: nowrap; 
			overflow: hidden;  
			text-overflow: ellipsis;
			font-weight:600;
			color:white;
		}
		.delete{
			background-color: black;
		    color:white;
		    border-radius:5%;
		    cursor:pointer;
		    font-weight:600;
		}
		.update{
			background-color: black;
		    color:white;
		    border-radius:5%;
		    cursor:pointer;
		    font-weight:600;
		
		}
		.aside_title{
			background-color:#f2f0e5;
			color:black;
			text-align:center;
			font-size:30px;
			font-weight:600;
			padding:5px;
		}
    </style>
</head>
<body>
    <div id="wrap">
        <header>
            <h1>관리자페이지</h1>
        </header>
        <section>
            <article>
				<div class="content">
					<form name="managerForm" >
						<div class="top2">
							<div class="top2_1">영화관리</div>
							<c:forEach var="movie" items="${movieList }" begin="${movieList.size() - 1}" end="${movieList.size() }" varStatus="status">
								<form>
									<input type="hidden" name="articleNO" value="${status.end + 1}">
									<input class="add" type="button" value="영화추가하기">
								</form>
							</c:forEach>
						</div>
						<c:forEach var="movie" items="${movieList }" begin="0" end="${movieList.size() }" varStatus="status">
							<div class="article">
								<div><img src="${movie.poster_main }" width=120px; height=180px;></div>
								<div class="title_long">${movie.articleNO}. ${movie.title }</div>
								<input class="update${status.count}" type="button" value="수정">
								<input class="count" type="hidden" value="${status.count}">
								<input class="count_end" type="hidden" value="${status.end}">
								<input class="articleNO${status.count}" type="hidden" name="articleNO" value="${movie.articleNO }">
							 	<a href="movieManager.do?command=delete&title=${movie.title}"><input class="delete" type="button" value="삭제"></a>
							</div>
						</c:forEach>
						
						
						<input type="hidden" name="command" value="delete">
					</form>
	            </div>
			</article>
        </section>
    </div>
    <script>
    window.onload = function(){
		document.querySelector(".add").addEventListener("click",function(){
			let managerForm = document.managerForm
			managerForm.action="add.do";
			managerForm.method="post";
			managerForm.submit();
		});
		let a =document.querySelector(".count_end").value;
		for(let k=1; k<a+1; k++){
			document.querySelector(".update"+k).addEventListener("click", function(){
				console.log(k)
		        for (let i = 1; i < a; i++) {
		            if (i == k) {
		            	let managerForm = document.managerForm
						managerForm.action="update.do?articleNO="+document.querySelector(".articleNO"+k).value;
						managerForm.method="post";
						managerForm.submit();
		            }
		        }
		    })
		}
    }
	</script>
</body>

</html>