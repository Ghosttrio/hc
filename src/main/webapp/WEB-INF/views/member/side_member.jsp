<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<!-- 	<form id="adminMember" method="post" action="/member/">	</form> -->
		
		<div>
	            <div id="asidMain"><a href="/member/mypage.do">
            	<span style="cursor: pointer">마이페이지</span></a></div>
        </div>
		<div>
	            <div id="asideUpdate"><a href="/member/update.do">
            	<span style="cursor: pointer">내 정보수정</span></a></div>
        </div>
<!-- 		<div> -->
<!-- 	            <div id="aside"><a href="/member/mypage.do"> -->
<!--             	<span style="cursor: pointer">내 결제내역</span></a></div> -->
<!--         </div> -->

		<div>
	            <div id="aside"><a href="/member/del.do">
            	<span style="cursor: pointer">회원탈퇴</span></a></div>
        </div>
        
		<div>
				<c:if test="${memberDTO.member_id =='admin' }">
		         		<a href="/member/adminMem.do" style="cursor: pointer">관리자 회원 리스트</a>
				</c:if>
        </div>
</body>
