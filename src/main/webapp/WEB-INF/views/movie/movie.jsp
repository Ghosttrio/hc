<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.tab{
    font-size: 0;    
}
.tab > div {
    display: inline-block;
    width: 49%;
    height: 50px;
    font-size: 18px;
    margin-top: 20px;
    text-align: center;
    padding-top: 25px;
	cursor:pointer;
}
.violet{
    border: 1px solid #503396;
    border-bottom: none;
}
.violet2{
    border-bottom: 1px solid #503396;
}

.section1, .section2 {
	display:flex;
	flex-wrap: wrap;
	margin-top : 30px;
	
}


				/* 호버시 보여지는곳 */
		.explain {
		    position: relative;
		    top: -100%;
		    color: white;
		    font-size: 20px;
		    padding: 30px;
		    opacity: 0;
		    transition: opacity 0.2s linear;
		    z-index: 1;
		    word-wrap: break-word;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    text-align: center;
		    width: 83%;
		    height: 75%;
		    margin-top: 40px;
		}
		
		
		.image{
		
			width: 100%;
		    height: 450px;
		}
		
		.image:hover .explain{
		    opacity: 1;
		}
		
		.poster{
		    transition: 0.2s;
		    width: 100%;
		    height: 100%;
		}
		.image:hover .poster {
		    filter: brightness(50%); 
		}
		
		.info{
		    font-size: 20px;
		}
		
		.info div {
		    margin-top: 5px;
		    margin-bottom: 5px;
		}
		.movie_rate{
			padding-top: 20px;
			margin-top : 70px;
			border-top:1px solid grey;
		}
		
		
		
		
		/* 더보기 */

.load {
    text-decoration: none;
    color: black;
    padding-top: 9px;
    padding-bottom: 9px;
    padding-left: 46%;
    padding-right: 46%;
}

.load2 {
    text-decoration: none;
    color: black;
    padding-top: 9px;
    padding-bottom: 9px;
    padding-left: 46%;
    padding-right: 46%;
}
.more {
    padding: 10px;
    margin-top: 70px;
    width: 100%;
    text-align: center;
    font-size: 20px;
    border: 1px solid black;
}

.more1 {
    padding: 10px;
    margin-top: 70px;
    width: 100%;
    text-align: center;
    font-size: 20px;
    border: 1px solid black;
    background-color: gainsboro;
}

.more2 {
    padding: 10px;
    margin-top: 70px;
    width: 100%;
    text-align: center;
    font-size: 20px;
    border: 1px solid black;
}

.movie_article{
	display:none;
	margin-right:20px;
	margin-left:20px;
	margin-top:20px;
	width:21%;
}

.movie_article2{
	margin-right:20px;
	margin-left:20px;
	margin-top:20px;
	width:21%;
}


/* 버튼부분 */
 .movie_btn{
      	text-align:center;
      	margin-top:10px;
      }
.movie_btn > div{
display:inline-block;
      }
.like_btn{
	width:27%;
	height:40px;
	
}
.like_btn input {
	border-radius: 10px;
	width:100%;
	height:40px;
	cursor: pointer;
	border: none;
	background: black;
	color: white;
	border:0.5px solid white;
}

.booking_btn{
	width:70%;
	height:40px;
}
.booking_btn input {
	border-radius: 10px;
	width:100%;
	height:40px;
	cursor: pointer;
	border: none;
	background: #037b94;
	color: white;
}

.title_long{
	white-space: nowrap; 
	overflow: hidden;  
	text-overflow: ellipsis;
}
.detail{
	border-radius: 10px;
	width:100px;
	height:40px;
	cursor: pointer;
	border: none;
	background: white;
	color: black;
	border:0.5px solid white;
}
</style>
</head>
<body>
    <div id="wrap">
        
		<jsp:include page="../common/header.jsp"></jsp:include>
		<h1>전체영화</h1>
		<div class="tab">
		    <div id="tab1">상영중</div>
		    <div id="tab2">상영예정</div>
	    </div> 
	    <div class="all">
	    <div class="section1">
	    	<c:forEach var="movie" items="${movieList }" varStatus="status">
	    	<!-- 현재시간기준으로 바꾸기 -->
	    		<c:if test="${movie.opendate < formatedNow }">
	    		
		    		<div class="movie_article">
		        	<!-- 이미지부분 -->
		    	    	<div class="image">
						    <img class="poster" src="${movie.poster_main }">
					        <div class="explain">
					        	<form id="article_form" action="movieInfo.do" method="get">
					        		<h3>${movie.title }</h3>
						          	<input type="hidden" name="articleNO" value="${movie.articleNO }">
						       		<input class="detail" type="submit" value="상세보기">
					    		</form>
					     	</div>
					 	</div>
					 	<!-- 영화정보 -->
					 	<div class="info">
						    <div class="title_long">${movie.title }</div>
							<div>${movie.age }</div>
						  	<div>
								<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
						  	</div>
					 	</div>
					 	
					 	
		    	    	<!-- 버튼부분 -->
		    	    	<div class="movie_btn">
		    	    	<!-- 좋아요버튼 -->
		    	    		<c:if test="${memberList != null }">
			    	    		<div class="like_btn">
				    	    		<form action="like.do">
					    	    		<input class="like_num" type="hidden" name="like_num" value="${movie.like_num}">
									  	<input class="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
									  	<input class="command" type="hidden" name="command1" value="like_it">
									  	<input class="like_login${status.count }" type="hidden" name="like_login" value="1">
									  	<input class="like_btn${status.count }" type="button" value="♡ ${movie.like_num }">
				    	    		</form>
			    	    		</div>
		    	    		</c:if>
		    	    		<c:if test="${memberList == null }">
			    	    		<div class="like_btn">
				    	    		<form action="like.do">
					    	    		<input class="like_num" type="hidden" name="like_num" value="${movie.like_num}">
									  	<input class="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
									  	<input class="command" type="hidden" name="command1" value="like_it">
									  	<input class="like_login${status.count }" type="hidden" name="like_login" value="2">
									  	<input class="like_btn${status.count }" type="button" value="♡ ${movie.like_num }">
				    	    		</form>
			    	    		</div>
		    	    		</c:if>
		    	    		<!-- 예매버튼 -->
		    	    		<c:if test="${memberList != null }">
			    	    		<div class="booking_btn">
				    	    		<form action="booking.do">
					    	    		<input type="hidden" name="articleno" value="${movie.articleNO }">
					    	    		<input type="submit" value="예매">
				    	    		</form>
			    	    		</div>
		    	    		</c:if>
		    	    		<c:if test="${memberList == null }">
		    	    			<div class="booking_btn">
				    	    		<a href="login.do">
					    	    		<input type="hidden" class="booking_login_value2" value="1">
					    	    		<input class="booking_login2" type="button" value="예매">
				    	    		</a>
			    	    		</div>
		    	    		</c:if>
						  
		    	    	</div>
		   	    	</div>
	    		</c:if>
	    	</c:forEach>
	    	<div class="more"><a href="#" class="load">더보기 ▽ </a></div>
	    </div>
	    <div class="section2">
        	<c:forEach var="movie" items="${movieList }" varStatus="status">
	    		<c:if test="${movie.opendate > formatedNow }">
	    			<div class="movie_article2">
		        	<!-- 이미지부분 -->
		    	    	<div class="image">
						    <img class="poster" src="${movie.poster_main }">
					        <div class="explain">
					        	<form id="article_form" action="movieInfo.do" method="get">
					        		<h3>${movie.title }</h3>
						          	<input type="hidden" name="articleNO" value="${movie.articleNO }">
						       		<input class="detail" type="submit" value="상세보기">
					    		</form>
					     	</div>
					 	</div>
					 	<!-- 영화정보 -->
					 	<div class="info">
						    <div class="title_long">${movie.title }</div>
							<div>${movie.age }</div>
						  	<div>
								<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
						  	</div>
					 	</div>
					 	
					 	
		    	    	<!-- 버튼부분 -->
	    	    	<div class="movie_btn">
	    	    	<!-- 좋아요버튼 -->
	    	    		<div class="like_btn">
		    	    		<form action="like.do">
			    	    		<input class="like_num" type="hidden" name="like_num" value="${movie.like_num}">
							  	<input class="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
							  	<input class="command" type="hidden" name="command1" value="like_it">
							  	<input class="like_btn${status.count }" type="button" value="♡ ${movie.like_num }">
		    	    		</form>
	    	    		</div>
	    	    		<!-- 예매버튼 -->
	    	    		
	    	    		<c:if test="${memberList != null }">
		    	    		<div class="booking_btn">
			    	    		<form action="booking.do">
				    	    		<input type="hidden" name="articleno" value="${movie.articleNO }">
				    	    		<input type="submit" value="예매">
			    	    		</form>
		    	    		</div>
	    	    		</c:if>
	    	    		<c:if test="${memberList == null }">
	    	    			<div class="booking_btn">
			    	    		<a href="login.do">
				    	    		<input type="hidden" class="booking_login_value2" value="1">
				    	    		<input class="booking_login2" type="button" value="예매">
			    	    		</a>
		    	    		</div>
	    	    		</c:if>
	    	    		
	    	    		
	    	    		
					  
	    	    	</div>
		    	    	
	   	    	</div>
	    		
	    		</c:if>
	    	</c:forEach>
	    	<div class="more2"><a href="#" class="load2">더보기 ▽ </a></div>
        </div>
       </div>
        
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>


document.querySelector("#tab1").classList.add("violet");
document.querySelector("#tab2").classList.add("violet2");
document.querySelector(".section2").style.display = "none";
for (let k = 1; k < 3; k++) {
    document.querySelector("#tab"+k).addEventListener("click", () => {
        for (let i = 1; i < 3; i++) {
            if (i == k) {
            	document.querySelector(".section" + i).style.display = "flex";
                document.querySelector("#tab" + i).classList.add("violet");
                document.querySelector("#tab" + i).classList.remove("violet2");
            } else {
            	document.querySelector(".section" + i).style.display = "none";
                document.querySelector("#tab" + i).classList.remove("violet");
                document.querySelector("#tab" + i).classList.add("violet2");
            }
        }
    })
}


/* 상영중 */
document.querySelector(".more").addEventListener("mouseover",function(){
    document.querySelector(".more").classList.add("more1");
});
document.querySelector(".more").addEventListener("mouseout",function(){
    document.querySelector(".more").classList.remove("more1");
});

$(function(){
    $(".movie_article").slice(0, 8).show();
    if($(".movie_article").length < 4){
        $(".more").css('display', 'none');
    }
    $(".load").click(function(e){ 
        e.preventDefault();
        $(".movie_article:hidden").slice(0, 4).show();
        if($(".movie_article:hidden").length == 0){
            $(".more").css('display', 'none');
        }
    });
});


/* 상영예정 */
document.querySelector(".more2").addEventListener("mouseover",function(){
    document.querySelector(".more2").classList.add("more1");
});
document.querySelector(".more2").addEventListener("mouseout",function(){
    document.querySelector(".more2").classList.remove("more1");
});

$(function(){
    $(".movie_article2").slice(0, 8).show(); 
    if($(".movie_article2").length < 4){
        $(".more2").css('display', 'none');
    }
    $(".load2").click(function(e){ 
        e.preventDefault();
        $(".movie_article2:hidden").slice(0, 4).show();
        if($(".movie_article2:hidden").length == 0){
            $(".more2").css('display', 'none');
        }
    });
});

for (let k = 1; k < 5; k++) {
	 
   	
	document.querySelector(".like_btn"+k).addEventListener("click", function(){
		if(document.querySelector(".like_login"+k).value==1){
			 $.ajax({
				    url: "like.do",
				    type: "POST",
				    dataType: "html",
				   	data:{
			            command : $('.command').val(),
			            articleNO1 : $('.articleNO1'+k).val()
			        },
				    success:function(data){  
				    	alert("성공");
				    	let a = data;
				    	console.log(a);
				    	 /* 화면에 표시하는 방법  */
				    	$(".like_btn"+k).val("♡ "+a);
				    },   
				    error: 
				    function (request, status, error){  
				    }
				  });
		}else if(document.querySelector(".like_login"+k).value==2){
			alert("로그인이 필요합니다.");
		}
		
   	
   });
}


document.querySelector(".booking_login2").addEventListener("click", function(){
	if(document.querySelector(".booking_login_value2").value==1){
		alert("로그인이 필요합니다.");
	}
})




</script>
</html>