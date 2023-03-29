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
    <div id="wrap">
        <jsp:include page="../common/header.jsp"></jsp:include>
        <section class="login3">
            <div class="login_box">
                <div class="left_img">
                    <div class="slider">
                        <img id="mainimg" src="/image/member/poster01.jpg">
                        <img id="mainimg" src="/image/member/poster02.jpg">
                        <img id="mainimg" src="/image/member/poster03.jpg">
                        <img id="mainimg" src="/image/member/poster04.jpg">
                        <img id="mainimg" src="/image/member/poster05.jpg">
                        <img id="mainimg" src="/image/member/poster06.jpg">
                        <img id="mainimg" src="/image/member/poster07.jpg">
                        <img id="mainimg" src="/image/member/poster08.jpg">
                        <img id="mainimg" src="/image/member/poster09.jpg">
                        <img id="mainimg" src="/image/member/poster10.jpg">
                    </div>
                </div>
                <div class="right_login">
                    <div class="sign-in">
                    <img id="humanimg" src="/image/member/loginLogo.png">
                    
                        <form method="post" action="/loginMember">
                                <input id="inputId" type="text" placeholder="아이디를 입력하세요" maxlength="20" name="member_id">
                                <input id="inputPwd" type="password" placeholder="비밀번호를 입력하세요" maxlength="20" name="member_pwd">
                                <button class="submit">로그인</button><br>
                        </form>
                        
                    </div>
                </div>
            </div>
        </section>
    </div>  
</body
>
</html>