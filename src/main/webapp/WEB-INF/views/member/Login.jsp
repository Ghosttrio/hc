<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link  href="/css/MemberLogin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

<body>

    <section class="login">
        <div class="login_box">
            <div class="left_img">
                <div class="slider">
                    <img id="mainimg" src="/image/loginPoster01.jpg">
                    <img id="mainimg" src="/image/loginPoster02.jpg">
                    <img id="mainimg" src="/image/loginPoster03.jpg">
                    <img id="mainimg" src="/image/loginPoster04.jpg">
                    <img id="mainimg" src="/image/loginPoster05.jpg">
                    <img id="mainimg" src="/image/loginPoster06.jpg">
                    <img id="mainimg" src="/image/loginPoster07.jpg">
                    <img id="mainimg" src="/image/loginPoster08.jpg">
                    <img id="mainimg" src="/image/loginPoster09.jpg">
                    <img id="mainimg" src="/image/loginPoster10.jpg">
                </div>
            </div>
            <div class="right_login">
                <div class="sign-in">
                <img id="humanimg" src="/image/loginHuman.png">
                
	                <form method="post" action="/member/loginMember">
			                <input id="inputId" type="text" placeholder="아이디를 입력하세요" maxlength="20" name="member_id">
			                <input id="inputPwd" type="password" placeholder="비밀번호를 입력하세요" maxlength="20" name="member_pwd">
			                <button class="submit">로그인</button><br>
	                </form>
	                
                </div>
            </div>
        </div>
    </section>  
</body
>
</html>