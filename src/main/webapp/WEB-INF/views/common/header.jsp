<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD:src/main/webapp/WEB-INF/views/common/Header.jsp
    pageEncoding="EUC-KR"%>
=======
    pageEncoding="UTF-8"
    isELIgnored="false"%>
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a:src/main/webapp/WEB-INF/views/common/header.jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body::-webkit-scrollbar {
  display: none;
}
    	/* 기본 마진설정 */
        #wrap {
            margin-left: 2%;
            margin-right: 2%;
        }
        
<<<<<<< HEAD:src/main/webapp/WEB-INF/views/common/Header.jsp
        /* 상단탭 */
        header {
        	border-top: 2px solid black; 
            height: 150px;
            border-bottom: 2px solid black; 
=======
        .header_list {
        	font-color:black;
            padding: 0 10px 0 10px;
            letter-spacing: 1px;
            opacity: 0.85;/* �닾紐낅룄 */
            background-color: black;
            display: flex;
            justify-content: space-around;
            text-align: center;
            height: 100px;
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a:src/main/webapp/WEB-INF/views/common/header.jsp
        }
        header > div {
            display: inline-block;
            
        }
       .logo{
            width: 85%;
        }
        .login{
            width: 14%;
            vertical-align: top;
            height: 100px;
            line-height: 100px;
            
            
        }
        .login > div{
            display: inline-block;
            margin-right:10px;
        }
        .login input{
			width:100px;
			height:40px;        
            
        }
        .tab_h > div{
            display: inline-block;
        }
<<<<<<< HEAD:src/main/webapp/WEB-INF/views/common/Header.jsp

        .tab_h{
        	width:100%;
            margin-left: 20px;
            
        }
        .tab_h a {
        	text-decoration:none;
        	font-size: 20px;
        	font-weight:600;
        	color:black;
        	
        }
        .tab_h > div {
        	margin-right:40px;
        }
        
        
        .tab_h > .search{
        	float:right;
        	margin-right:20px;
        	
        }
        #schoolInput{
        	width:200px;
        	height:30px;
			
        }
        
        
        
        .login a{
        	text-decoration:none;
        	color:black;
        	font-size:20px;
        	font-weight:600;
        }
        
        .ajaxList{
        	background:grey;
        	color:black;
        }
        #schoolList{
        	position:relative;
			z-index:100;
        }
        
         .login2 a {
        	text-decoration: none;
        	font-size:11px;
        }
       	.login2{
       		vertical-align:top;
       		margin-top:10px;
       		width:150px;
       	}
       	.login2 div{
       		font-size:20px;
       		font-weight:600;
       		margin-bottom:10px;
       	}
       
        .login2 *{
        	
        	color:black;
        }
        
</style>

</head>
<body>
	<header>
	    <div class="logo"><a href="main.do"><img src="resources/image/LOGO3.jpg" width="300px" height="100px"></a></div>
	    <c:set var="member" value="${memberList }" />
	    
	    <c:choose>
		    <c:when test="${member == '' || member == null}">
			    <div class="login">
			        <div><a href="login.do">로그인</a></div>
			        <div><a href="signup.do">회원가입</a></div>
			    </div>
		    </c:when>
		    <c:when test="${member != '' && member !=null}">
	    		<%-- <div class="login">${memberList[0].name } 님</div> --%>
	    		<div class="login2">
	    			<div>${memberList} 님</div>
	    			<a href="mypage.do">
		    			마이페이지 │
		    		</a>
	    			<a href="logout.do">
		    			로그아웃
		    		</a>
    			</div>
		    </c:when>
	    </c:choose>
	    
	    <div class="tab_h">
	        <div><a href="movie.do">영화</a></div>
	        <div><a href="theater.do">극장</a></div>
	        <div><a href="booking.do">예매</a></div>
	        <div class="search">
	        	<input id="schoolInput" type="text" data-cate="high" onkeyup="search(this);" placeholder="영화를 입력하세요">
	        	<div id="schoolList"></div>
        		<h1 id="selected"></h1>
	        </div>
	    </div>
	</header>
=======
    </style>

</head>
<body>
    <header>
        <div class="header_list">
            <div id="h1"><a href="/myapp/movie/movieTab.do">
            	<span style="cursor: pointer">�쁺�솕</span></a></div>
            
            <div id="h2"><a href="">
            	<span style="cursor: pointer">�삁留�</span></a></div>
            
            <div id="h3"><a href="/HumanCinema/cinema/cinema.do">
            	<span style="cursor: pointer">洹뱀옣</span></a></div>
            	
            <div id="logo_human"><a href="/HumanCinema/movie1/main.do">
        		<img src="/image/headerLogo.png"/></a></div>
        		
			<div id="h4"><a href="/Store/storemain.do">
            	<span style="cursor: pointer">�뒪�넗�뼱</span></a></div>
            
            <div id="h5"><a href="/HumanCinema/event1/event1.do">
            	<span style="cursor: pointer">�씠踰ㅽ듃</span></a></div>
            
            <div id="h6"><a href="/HumanCinema/board/listArticles.do">
            	<span style="cursor: pointer">怨좉컼�꽱�꽣</span></a></div>
        </div>
        
        <div class="login_signup">
            <div id="h7">
	            	<c:choose>
	            			<c:when test="${isLogOn ==true and member!=null}">
	            				<h3>${member.member_id }�떂 濡쒓렇�씤 以�</h3>
		            			<a href="/member/logout" style="cursor: pointer"><h4>濡쒓렇�븘�썐</h4></a>
		            			<a href="/member/mypage.do" style="cursor: pointer"><h4>留덉씠�럹�씠吏�</h4></a>
		        	 	 </c:when>
		          		<c:otherwise>
			       			 <a href="/member/login.do" style="cursor: pointer"><h4>濡쒓렇�씤</h4></a>
			       			 <a href="/member/add.do" style="cursor: pointer"><h4>�쉶�썝媛��엯</h4></a>
			     		 </c:otherwise>
			   		</c:choose>     
       		 </div>
		</div> 
		  	
    </header>
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a:src/main/webapp/WEB-INF/views/common/header.jsp
</body>
<script>

function search(target){

    $.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: 'search.do',
        error: function(err){
            console.log(err);
        },
        success: function(data){
            var checkWord = $("#schoolInput").val();
            var schoolList = $("#schoolList");
           /*  console.log(checkWord); */
			
            schoolList.empty();
            data.forEach((school)=>{
                if(school['name'].includes(checkWord)){
                	console.log(school['name']);
                    schoolList.append("<div class=\"ajaxList\" style=\"cursor: pointer;  \" onclick=\"select(this);\">" + school['name'] + "</div> <br/>"); 
                }
            })
        }
    })

}    

function select(target){
    let selected = document.getElementById("selected");
    selected.innerText = target.innerText;
}


</script>
</html>