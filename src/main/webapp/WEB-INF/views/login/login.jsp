<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		#id{
			width:100%;
			height:50px;
		}
		#pw{
			width:100%;
			height:50px;
		}
		#login{
			width:102%;
			height:40px;
		}
		#signup{
			width:102%;
			height:40px;
		}
		#wrap > div{
			width:40%;
			vertical-align:middle;
			margin: 0 auto;
		}
		
		h1{
			text-align:center;
		}
		.left div{
			margin-top:5px;
			margin-bottom:5px;
			
		}
		.left > form > div{
			marign: 0 auto;
		}
	</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<h1>로그인</h1>
		<div class="left">
			<form action="loginDo.do">
				<div><input type="text" name="id" id="id"placeholder="아이디"></div>
				<div><input type="text" name="pw" id="pw" placeholder="비밀번호"></div>
				<div><input id="login" type="submit" name="login" value="로그인"></div>
			</form>
			<div><a href="signup.do"><input id="signup" type="submit" name="signup" value="회원가입"></a></div>
		</div>	
		<div class="right">
			<img src="resources/image/favicon.png">
		</div>
	</div>
</body>
</html>