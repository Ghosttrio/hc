<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>



	<table border="1">
		<c:choose>
			<c:when test="${empty cartlist }">
				<tr>
					<td colspan = 7 class = "fixed">
						<strong>장바구니에 상품이 없습니다.</strong>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<form name = "all_cart">
						<c:forEach var = "list" items = "${cartlist }" varStatus = "cnt">
						<tr>	
							<c:set var = "cart_qty" value = "${cartlist[cnt.count-1].amount }" />
							<td>
								<input type = "checkbox" name = "ck_cart" checked value = "${list.menu_id }"
										onClick = "calcGoodsPrice(${list.price},this)">
							</td>
							<td><img id = "image" src = "${list.image }" width = "100px"></td>
							<td id = "menu_name">${list.menu_name }</td>
							<td>
								<input type = "text" id = "amount" value = "${list.amount }" >
								<button type = "button" id = "amount_bt" >수정</button>
							</td>
							<td id = "price">${list.price }</td> 
							<td id = "total">0</td>
							<td>
								<input type = "submit" value = "구매하기">
								<input type = "submit" value = "메뉴삭제">
								<input type = "hidden" id = "menu_id" value = "${list.menu_id}">
								<input type = "hidden" id = "cart_id" value = "${list.cart_id}">
							</td>
						</tr>
						</c:forEach>
				 </form>
			</c:otherwise>
		</c:choose>
	</table>
			
			<table border="1">
				<tr>
					<td>선택 된 메뉴 총 금액</td>
					<td>할인 금액</td>
					<td>최종 금액</td>
					<td>선택된 메뉴 삭제</td>
					<td>구매하기</td>
				</tr>
			</table>
			
	<Script>
	
	// 총 금액 
	 let total = parseInt ('${list.price}') * parseInt ('${list.amount }');
	 
	
	// 수량 수정 버튼 클릭 -> DB에 수량 변경 후 저장
	$("#amount_bt").click(function(){
		
	 	let data = {	
				amount : $("#amount").val(),
				cart_id : $("#cart_id").val()
			}
	 
	
		console.log(data)
		$.ajax({
			url : "/Store/cartupdate?cart_id="+data,
			type : 'post',
			contentType: "application/json; charset=UTF-8",
			data : JSON.stringify(data),
				
			success : function(data) {
				console.log("data", data);
				
				if(data == "cart_update"){
					alert("수정 되었습니다.");
					location.href = "/Store/cartlist.do?cart_id="+data
				}
					
		    },				
			error : function(e) {
				
				console.log(e)
				alert("error:");
				
			}
		     
		});
	})
		
	
	</Script>
			
	
		
	
</body>
</html>