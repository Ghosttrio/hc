<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
table {
	background-color: white;
	border: 1px #49443f solid;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	font-size: .9em;
	margin: auto;
	width: 60%;
	border-collapse: collapse; /*테이블 테두리 셀의 테두리 사이 간격*/
	border-radius: 5px; /*테이블 둥근 테두리*/
	overflow: hidden;
}

th {
	letter-spacing: 3px; /*테이블 상단 자간*/
	font-size: large;
	background-color: black;
	opacity: 0.85; /* 투명도 */
	color: white;
}

td, th {
	vertical-align: middle;
	padding: 15px 20px;
	border-bottom: 1px solid rgba(0, 0, 0, .1); /* 테이블 구분선 */
	text-align: center;
}

input {
	border: none; /* 입력란 라인제거*/
}
/* 회원탈퇴 버튼 css*/
#btn input {
	border: 0; /*초기화 */
	outline: none; /*초기화 */
	width: 40%; /*버튼 넓이는 테이블 40%가 어떨까나 */
	height: 40px; /* 버튼 높이*/
	border-radius: 10px;
	background: black;
	color: white; /* 글자색상은 흰색 */
	opacity: 0.85; /* 투명도 */
	letter-spacing: 2px; /* 자간 간격 */
	padding: 10px;
}
</style>

<!-- <body background="/image/member/test.png"/> -->

<body>
	<div id="content-wrap">
		<table>
			<form method="post" action="/member/updateMypage">
				<th colspan="4">회원정보수정</th>
				<tr>
					<td id="inputset">아이디</td>
					<td><input id="inputset" name="member_id"
						value=' ${member.member_id}' readonly="readonly"></td>
					<td id="inputset">이름</td>
					<td><input id="inputSet" name="member_name"
						value='${member.member_name}'></td>
				</tr>
				<tr>
					<td id="inputset">본인인증</td>
					<td><input id="inputSet" name="member_pwd"
						value='${member.member_pwd}' placeholder="현재 비밀번호를 입력하세요"></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td id="inputset">변경할 비밀번호</td>
					<td><input id="inputSet2" name="inputPwd1" type="password"
						value='${inputPwd1}' placeholder="변경할 비밀번호를 입력하세요"></td>
					<td id="inputset">비밀번호 확인</td>
					<td><input id="inputSet" name="inputPwd2" type="password"
						value='${inputPwd2}' placeholder="다시 한번 입력하세요"></td>
				</tr>
				<tr>
					<td id="inputset">전화번호</td>
					<td><input id="inputSet" name="member_number" placeholder="예시: 02-0000-0000"
						value='${member.member_number}'></td>
					<td id="inputset">휴대폰번호</td>
					<td><input id="inputSet" name="member_phone" placeholder="예시: 010-0000-0000"
						value='${member.member_phone}'></td>
				</tr>
				<tr>
					<td id="inputset">이메일</td>
					<td><input id="inputSet2" name="member_email" placeholder="예시: human@cinema.com"
						value='${member.member_email}'></td>
					<td id="inputset">수신동의</td>
					<td><input id="inputSet2" name="member_agree_mail" value='${member.member_agree_mail}'
						placeholder="혜택정보를 이메일로 받아보시겠어요?"></td>

				</tr>
				<tr>
					<td id="inputset">생년월일</td>
					<td><input id="inputSet" name="member_birth" placeholder="예시: 1900-00-00"
						value='${member.member_birth}'></td>
					<td id="inputset">성별</td>
					<td><input id="inputSet" name="member_gender" placeholder="예시: 남성/여성"
						value='${member.member_gender}'></td>
				</tr>
				<tr>
					<td id="inputset"'>개인정보 유효기간</td>
					<td colspan="3">
						개인정보 유효기간을 
						<input id="inputset" name="member_expire" type="checkbox"><label for="checker1">2년</label>
						<input id="inputset" name="member_expire" type="checkbox"><label for="checker2">3년</label>
						<input id="inputset" name="member_expire" type="checkbox"><label for="checker3" disabled>탈퇴</label>
						시 으로요청합니다.<br> 1년 동안 로그인 이력이 없는 경우 개인정보는 접근이 통제된 안전한 곳에
						분리 보관됩니다. <br>
					</td>
				</tr>
			<td colspan="4" id="btn"><input class="btnSlide" type="submit" value="수정하기"></td>
			</form>
		</table>
	</div>
</body>
</html>