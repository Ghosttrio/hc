<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<style>
#sidebar-left{
	display: inline-block;	/* body 옆에 붙도록 줌*/
	vertical-align: top;	/*테이블 이랑 상단을 동일하게 둔다.*/
	margin-top: 50px;	/*상단에 붙어서 조금 띄어줌*/
}
.menu {
	display: block;
	opacity: 0.85; /* 투명도 */
	overflow: hidden; /* 반응형 애니메이션 */
	width: 180px;
	background-color: #000;
	color: #fff;
	transition: all 0.5s ease; /* 반응형 애니메이션 */
	border-radius: 5px;
	padding: 10px;
	box-sizing: border-box;
	flot: right;
	
}

.menu ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.menu a, .menu>label {
	display: block;
	height: 25px; /* 메뉴 자간 높이 */
	padding: 8px;
	cursor: pointer;
	color: #fff;
	text-decoration: none;
}

.menu a:hover {
	color: #000;
}

.menu ul li:hover, .menu>label:hover {
	background-color: #fff;
	color: #000;
	border-radius: 10px;
}

.menu div {
	position: absolute;
	left: 50px;
	line-height: 1.5;
	font-size: 0.9em; /* 글씨크기 */
	padding: 0 0 0 20px; /* */

}

#expand-menu {
	display: none;
}

#expand-menu:checked ~ ul {
	display: block;
	height: auto;
}

menu #expand-menu:not(:checked) ~ ul { /* 데스크탑 화면에서도 메뉴를 접었더 펼칠 수 있음 */
	display: none;
}

.menu ::before {
	font-family: 'Material Icons';
	font-size: 1.5em;
	float: left;
	clear: left;
}

.menu label::before {
	content: '\e5d2';
}
.menu li:nth-child(1) a::before {
	content: '\e853';
}
.menu li:nth-child(2) a::before {
	content: '\f02e';
}
.menu li:nth-child(3) a::before {
	content: '\e8b8';
}
/* .menu li:nth-child(4) a::before{ content: '\e8cc'; }
		.menu li:nth-child(5) a::before{ content: '\e87d'; }
		.menu li:nth-child(6) a::before{ content: '\e88a'; } */
@media screen and (max-width:900px) {
	.menu {
		width: 60px;
	}
}

@media screen and (max-width:560px) {
	.menu #expand-menu:not(:checked) ~ ul {
		display: none;
	}
}
</style>

</head>
<body>
	<form>
		<!-- 	<form id="adminMember" method="post" action="/member/">	</form> -->
		<div class="menu">
			<label for="expand-menu"><div>메뉴</div></label> <input type="checkbox"
				id="expand-menu" name="expand-menu">
			<ul>
				<li><a href="/member/mypage.do" class="item"><div>프로필</div></a></li>
				<li><a href="/member/update.do" class="item"><div>회원정보수정</div></a></li>
				<li><a href="/member/del.do" class="item"><div>회원탈퇴</div></a></li>
	<!-- 			<li> -->
	<!-- 				<a href="/member/adminMem.do" class="item">  -->
	<%-- 				<c:if test="${memberDTO.member_id =='admin' }">관리자 회원 리스트</c:if> --%>
	<!-- 				</a> -->
	<!-- 			</li> -->
			</ul>
		</div>
	</form>
</body>
