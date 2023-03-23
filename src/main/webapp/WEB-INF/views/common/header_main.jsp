<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
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
        
        /* 상단탭 */
        header {
            height: 150px;
            
           /*  border-bottom: 1px solid white; */
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

        .tab_h{
        	width:100%;
            margin-left: 20px;
            
        }
        .tab_h a {
        	text-decoration:none;
        	font-size: 20px;
        	font-weight:600;
        	color:white;
        	
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
        	color:white;
        	font-size:20px;
        	font-weight:600;
        }
        
        .ajaxList{
        	background:grey;
        	color:white;
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
        	
        	color:white;
        }
        
        
</style>

</head>
<body>
	<header>
	    <div class="logo"><a href="main.do"><img src="resources/image/LOGO2.jpg" width="300px" height="100px"></a></div>
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