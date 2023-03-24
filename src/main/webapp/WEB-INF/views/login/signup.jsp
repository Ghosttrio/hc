<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<style>
		h1 {
			text-align:center;
		}
		form > div {
			text-align:center;
		}
		form > div > input {
			width:400px;
			height:40px;
			margin-top: 10px;
		}
		.btn > input {
			width:408px;
		}
		
	</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<h1>회원가입</h1>
		<form id="signup_form" action="memberInsert.do" method="get">
			<div class="id"><input type="text" id="input_id" name="id" placeholder="아이디"></div>
			<div class="pw"><input type="text" id="input_pw" name="pw" placeholder="비밀번호"></div>
			<div class="pw_check"><input type="text" id="input_pw_check" name="pw_check" placeholder="비밀번호 확인"></div>
			<div class="name"><input type="text" id="input_name" name="name" placeholder="성명"></div>
			<div class="phon"><input type="text" id="input_phone" name="phone" placeholder="전화번호"></div>
			<div class="btn"><input type="button" id="input_signup" name="signup" value="회원가입"></div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script>
		
		document.querySelector("#input_signup").addEventListener("click", function(){
			
			let id = document.querySelector("#input_id").value;
			let pw = document.querySelector("#input_pw").value;
			let pw_check = document.querySelector("#input_pw_check").value;
			let name = document.querySelector("#input_name").value;
			let phone = document.querySelector("#input_phone").value;
			
			if(id==null || id==''){
				alert("아이디를 입력하시오");
			}else if(pw==null || pw==''){
				alert("비밀번호를 입력하시오");
			}else if(name==null || name==''){
				alert("이름을 입력하시오");
			}else if(phone==null || phone==''){
				alert("전화번호를 입력하시오");
			}else{
				if(pw != pw_check){
					alert("비밀번호가 일지하지 않습니다.");
				} else if(pw == pw_check){
					alert("회원가입 성공");
					document.querySelector("#signup_form").submit();
				}
			}
			
			
			
		})
		
	</script>
</body>
</html>