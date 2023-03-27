<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
<<<<<<< HEAD
	#content-wrap{ 
		display: inline-block;  /* body 옆에 붙도록 줌*/
	} 
	#content{ 
		display: inline-block;  /* body 옆에 붙도록 줌*/
		margin-top: 50px;
		margin-left: 20px;
	} 
	
	table {
	 width: 780px;
	 margin-top:50px;
=======
	table {
>>>>>>> b0043d89686ea51e09d9636f15e821a5b71f9e0a
	  border: 1px #49443f solid;
	  box-shadow: 0 2px 5px rgba(0,0,0,.25);
	  font-size: .9em;
	  margin: auto;
<<<<<<< HEAD
=======
	  width: 60%;
>>>>>>> b0043d89686ea51e09d9636f15e821a5b71f9e0a
	  border-collapse: collapse; /*테이블 테두리 셀의 테두리 사이 간격*/
	  border-radius: 5px;/*테이블 둥근 테두리*/
	  overflow: hidden;
	}
	th {
	    letter-spacing: 3px; /*테이블 상단 자간*/
	    font-size: large;
	    background-color: black;
	    opacity: 0.85;/* 투명도 */
	    color: white;
	}
    td, th {
		vertical-align: middle;
<<<<<<< HEAD
		padding: 15px;
=======
		padding: 15px 50px;
>>>>>>> b0043d89686ea51e09d9636f15e821a5b71f9e0a
		text-align: center;
		border-bottom: 1px solid rgba(0,0,0,.1); /* 테이블 구분선 */
    }
	input{
        border: none;   /* 입력란 라인제거*/
    }
	/* 회원탈퇴 버튼 css*/
	#btn input{
		border: 0;	/*초기화 */
		outline: none; /*초기화 */
		width: 40%;	/*버튼 넓이는 테이블 40%가 어떨까나 */
		height: 40px;	/* 버튼 높이*/
		border-radius: 10px;
		background: black;
		color: white;	/* 글자색상은 흰색 */
		opacity: 0.85;/* 투명도 */
		letter-spacing: 1.2px; /* 자간 간격 */
	}
</style>

	  
<body>
	<div id="content-wrap"> 
		<form action="/member/delMember" method="post">
			<table>
				<th colspan="2">회원탈퇴</th>
				<tr>
					<td id="inputset">아이디</td>
					<td><input id="inputset" type="text"  name="member_id" value="${member.member_id}" readonly="readonly"/>
				</tr>
				<tr>  
					<td id="inputset">비밀번호 확인</td>
					<td><input type="password" name="inputPwd" placeholder="비밀번호를 입력하세요"></td>
				</tr>
				<td id="btn" colspan="2">
					<div><c:if test="${msg == false}">비밀번호가 맞지 않습니다.</c:if></div><br>
					<div><input class="button" type="submit" value="회원탈퇴"></div>
				</td>
			</table>
		</form>
	</div>
</body>
