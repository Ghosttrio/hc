<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        /* ����� */
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
        	
        	border:0;
        	outline:0;
        	color:black;
        	width: 100%;
		    height: 30px;
		    background-color: #f2f0e5;
		    color:black;
		    border-bottom: 1px solid black;
		    cursor:pointer;
        	
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
	    <div class="logo"><a href="main.do"><img src="/image/LOGO2.jpg" width="300px" height="100px"></a></div>
	    <c:set var="member" value="${memberList }" />
	    
	    <c:choose>
		    <c:when test="${member == '' || member == null}">
			    <div class="login">
			        <div><a href="login.do">LOGIN</a></div>
			        <div><a href="signup.do">SIGNUP</a></div>
			    </div>
		    </c:when>
		    <c:when test="${member != '' && member !=null}">
	    		<div class="login2">
	    			<div>USER ${memberList.member_id}</div>
	    			<a href="logout.do">
		    			LOGOUT │
		    		</a>
					<a href="">
						MYPAGE
					</a>
    			</div>
	    		
		    </c:when>
	    </c:choose>
	    
	    <div class="tab_h">
	        <div><a href="movie.do">MOVIE</a></div>
	        <c:if test="${memberList != null }">
		        <div class="booking_login"><a href="booking.do">BOOKING</a>
		        </div>
	        </c:if>
	        <c:if test="${memberList == null }">
		        <div class="booking_login">
		        	<a href="login.do">BOOKING</a>
		        	<input type="hidden" class="booking_login_value" value="1">
		        </div>
	        </c:if>









			<!-- 여기에다가 주소 적으시면 됩니다. -->
			<div><a href="">이벤트탭</a></div>
			<div><a href="">스토어탭</a></div>
			<div><a href="">고객센터탭</a></div>









	        <div class="search">
	        	<form action="movieInfo.do">
		        	<input id="schoolInput" type="text" data-cate="high" onkeyup="search(this);" placeholder="ENTER MOVIE NAME">
		        	<div id="schoolList"></div>
	        		<h1 id="selected"></h1>
        		</form>
	        </div>
	    </div>
	</header>
</body>
<script>

	window.onload = () => {
		
	
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
		                if(school['title'].includes(checkWord)){
		                	console.log(school['title']);
		                    schoolList.append(
		                  		"<input class=\"ajaxList\" type=\"submit\" value=\""+school['title']+"\">"+ 
		                  		"<br/><input type=\"hidden\" name=\"articleNO\" value="
		                  		+school['articleNO']+">"); 
		                }
		            })
		        }
		    })
		
		}    
		
		document.querySelector(".booking_login").addEventListener("click", function(){
			if(document.querySelector(".booking_login_value").value==1){
				alert("�α����� �ʿ��մϴ�.");
			}
		})
		
		document.querySelector(".booking_login2").addEventListener("click", function(){
			if(document.querySelector(".booking_login_value2").value==1){
				alert("�α����� �ʿ��մϴ�.");
			}
		})
		
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
						    	alert("���ƿ䰡 �ݿ��Ǿ����ϴ�.");
						    	let a = data;
						    	console.log(a);
						    	 /* ȭ�鿡 ǥ���ϴ� ���  */
						    	$(".like_btn"+k).val("�� "+a);
						    },   
						    error: 
						    function (request, status, error){  
						    }
						  });
				}else if(document.querySelector(".like_login"+k).value==2){
					alert("�α����� �ʿ��մϴ�.");
				}
				
		   	
		   });
		}
	}


</script>
</html>