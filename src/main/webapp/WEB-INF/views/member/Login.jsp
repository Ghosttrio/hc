<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    .login {
	    height: 100vh;
	    width: 100%;
	    position: relative;}
    .login_box {
        width: 900px;
        height: 600px;
        position: absolute;
        top: 40%;
        left: 50%;
        transform: translate(-50%,-50%);/*Horizontal alignment*/
        background: #fff;
        border-radius: 5px;
        
        box-shadow: 1px 4px 22px -8px rgb(147, 146, 146);
        display: flex;
        overflow: hidden;}
        
    .login_box .left_img{width: 600px; height: 900px;}
    .login_box .right_login{width: 65%; height: 100%; padding: 25px 25px;}

    .right_login .sign-in{
        display: flex;
        align-items: center;
        justify-content: center;
        align-self: center;
        height: 100%;
        width: 80%;
        flex-direction: column;
        margin: auto;
    }
     .right_login input {
        width: 90%;
        outline: none;
        font-size: 15px;
        font-weight: 500;
        align-items: center;
        margin: 15px 0px;
        padding: 10px;
        padding-left: 20px;
        border: 1px solid lightgray;
        border-radius: 20px;
    }

    .right{background: linear-gradient(-45deg, #dcd7e0, #fff);}

    .submit {
        margin: auto;
        margin-top: 30px;
        margin-bottom: 40px;
        padding: 15px 120px;
        width: 100%;
        border: none;
        border-radius: 20px;
        display: block;
        font-weight: 600;
        font-size: 17px;
        color: #fff;
        background: darkred;
        -webkit-box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
        -moz-box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
        box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
    }
    .left_img {
        background: linear-gradient(212.38deg, /*각도*/
        rgba(121, 13, 13, 0.7) 0%,
        rgba(8, 7, 8, 0.71) 50%);
        background-color: black;
        color: #fff;
        position: relative;
        background-size: width 600px height 500px;
    }
    section {display: flex; overflow: hidden;}
    #mainimg{
    	width: 430px; 
        height: 600px;
    }
    #humanimg{
 
        width: 300px; 
        height: 120px;
    }
    
    </style>
    <script>
        window.onload = function(){
            init();
            bind();
        }   
            function init(){    }
            function bind(){

            function fnSlide() {
                $(".slider").animate({ "margin-left": "0px" }, 3000, function () {
                    $(".slider").css({ "margin-left": "0px" });
                    $(".slider img:first-child").insertAfter(".slider img:last-child");
                });
            };
            setInterval(fnSlide, 3000);
        	 }
    </script>
    
<c:if test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("${msg}");
	    }
	  </script>
</c:if>

</head>
<body>

    <section class="login">
        <div class="login_box">
            <div class="left_img">
                <div class="slider">
                    <img id="mainimg" src="/resources/static/image/loginPoster01.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster02.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster03.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster04.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster05.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster06.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster07.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster08.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster09.jpg">
                    <img id="mainimg" src="/resources/static/image/loginPoster10.jpg">
                </div>
            </div>
            <div class="right_login">
                <div class="sign-in">
                <img id="humanimg" src="/resources/static/image/loginHuman.png">
                
	                <form method="post" action="${contextPath }/member/loginMember">
			                <input id="inputId" type="text" placeholder="아이디를 입력하세요" maxlength="20" name="member_id">
			                <input id="inputPwd" type="password" placeholder="비밀번호를 입력하세요" maxlength="20" name="member_pwd">
			                <button class="submit">로그인</button><br>
			                
			                <br><br>
			                <a href="${contextPath }/member/addMember">회원가입</a>
	                </form>
	                
                </div>
            </div>
        </div>
    </section>  
</body>
</html>