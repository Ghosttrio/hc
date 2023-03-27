<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

// 		$(document).ready(function(){
// 			$(".btn").on("click", function(){
// 				location.href = "/";
// 			})
		
// 			$("#submit").on("click", function(){
// 				if($("#userPass").val()==""){
// 					alert("비밀번호를 입력해주세요.");
// 					$("#userPass").focus();
// 					return false;
// 				}	
// 			});
				
			
		})
</script>
  <script>
	   window.onload=function(){
	     alert("${msg}");
	   }
 </script>
<body>
<form action="/member/delMember" method="post">
       <table>
                 <th colspan="2">회원탈퇴</th>
                 <tr>
					<td><input class="member_id" type="text" id="member_id" name="member_id" value="${member.member_id}" readonly="readonly"/>
                     <td><input type="password" name="inputPwd" placeholder="비밀번호를 입력하세요"></td>
                     <td id="btn">
                     		<input class="button" type="submit" value="회원탈퇴">
                     </td>
                 </tr>
        </table>
</form>
                    
			<div>
					<c:if test="${msg == false}">비밀번호가 맞지 않습니다.</c:if>
			</div>
			
</body>
