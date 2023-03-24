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
    	/* �⺻ �������� */
        #wrap {
            margin-left: 2%;
            margin-right: 2%;
        }
        
<<<<<<< HEAD:src/main/webapp/WEB-INF/views/common/Header.jsp
        /* ����� */
        header {
        	border-top: 2px solid black; 
            height: 150px;
            border-bottom: 2px solid black; 
=======
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
			        <div><a href="login.do">�α���</a></div>
			        <div><a href="signup.do">ȸ������</a></div>
			    </div>
		    </c:when>
		    <c:when test="${member != '' && member !=null}">
	    		<%-- <div class="login">${memberList[0].name } ��</div> --%>
	    		<div class="login2">
	    			<div>${memberList} ��</div>
	    			<a href="mypage.do">
		    			���������� ��
		    		</a>
	    			<a href="logout.do">
		    			�α׾ƿ�
		    		</a>
    			</div>
		    </c:when>
	    </c:choose>
	    
	    <div class="tab_h">
	        <div><a href="movie.do">��ȭ</a></div>
	        <div><a href="theater.do">����</a></div>
	        <div><a href="booking.do">����</a></div>
	        <div class="search">
	        	<input id="schoolInput" type="text" data-cate="high" onkeyup="search(this);" placeholder="��ȭ�� �Է��ϼ���">
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
            	<span style="cursor: pointer">영화</span></a></div>
            
            <div id="h2"><a href="">
            	<span style="cursor: pointer">예매</span></a></div>
            
            <div id="h3"><a href="/HumanCinema/cinema/cinema.do">
            	<span style="cursor: pointer">극장</span></a></div>
            	
            <div id="logo_human"><a href="/HumanCinema/movie1/main.do">
        		<img src="/image/headerLogo.png"/></a></div>
        		
			<div id="h4"><a href="/Store/storemain.do">
            	<span style="cursor: pointer">스토어</span></a></div>
            
            <div id="h5"><a href="/HumanCinema/event1/event1.do">
            	<span style="cursor: pointer">이벤트</span></a></div>
            
            <div id="h6"><a href="/HumanCinema/board/listArticles.do">
            	<span style="cursor: pointer">고객센터</span></a></div>
        </div>
        
        <div class="login_signup">
            <div id="h7">
	            	<c:choose>
	            			<c:when test="${isLogOn ==true and member!=null}">
	            				<h3>${member.member_id }님 로그인 중</h3>
		            			<a href="/member/logout" style="cursor: pointer"><h4>로그아웃</h4></a>
		            			<a href="/member/mypage.do" style="cursor: pointer"><h4>마이페이지</h4></a>
		        	 	 </c:when>
		          		<c:otherwise>
			       			 <a href="/member/login.do" style="cursor: pointer"><h4>로그인</h4></a>
			       			 <a href="/member/add.do" style="cursor: pointer"><h4>회원가입</h4></a>
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