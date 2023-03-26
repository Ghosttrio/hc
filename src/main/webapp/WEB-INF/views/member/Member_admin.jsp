<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<header>
	<div>
		<div>
			<input type="button" id="btn_all" value="전체조회">
		</div>
	</div>
</header>

<section>
	<div>
		<div>
			<form action="/member/listMember">
				<input type="submit" value="선택된 것만 조회">
				<hr>
				<table border=1>
					<thead>
						<tr>
							<th>선택</th>
							<th>member_grade</th>
							
							<th>member_id</th>
							<th>member_pwd</th>
							<th>member_name</th>
							<th>member_email</th>
							<th>member_number</th>
							
							<th>joinDate</th>
							<th>member_birth_y</th>
							<th>member_birth_m</th>
							<th>member_birth_d</th>
							<th>member_gender</th>
						</tr>
					</thead>
					
					<tbody id="tbody">
						<c:if test="${ not empty listMember }">
							<c:forEach var="dto" items="${listMember }">
								<tr>
									<td><input type="checkbox" name="chk" value="${member.member_no}"></td>
									<td>${member.member_no}</td>
									<td><a href="/listMember?member_no=${member.member_no}">${member.member_id}</a></td>
									<td>${member.member_id}</td>
									<td>${member.member_pwd}</td>
									<td>${member.member_name}</td>
									<td>${member.member_email}</td>
									<td>${member.member_number}</td>
									<td>${member.joinDate}</td>
									<td>${member.member_birth_y}</td>
									<td>${member.member_birth_m}</td>
									<td>${member.member_birth_d}</td>
									<td>${member.member_gender}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${ empty listMember }">
							<tr>
								<td colspan="7" style="text-align:center;">조회된 데이터가 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</section>

</body>
