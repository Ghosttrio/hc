<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
=======
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
</head>

<c:choose>	
	<c:when test ='${msg == "null_id" }'>
		<script>
			window.onload = function(){
				alert("로그인 후 이용해주세요");
				window.location.href = "/HumanCinema/user/login";
			}
		</script>
	</c:when>
	<c:when test = '${msg == "login" }'> 
		<script>
			window.onload = function(){
				alert("메뉴가 장바구니에 담겼습니다. 확인하시겠습니까?");
			}
		</script>
	</c:when>
</c:choose>


<style>
.name{
		font-size: 30px;
		font-weight: bold;
	}
	.price{
		font-size: 30px;
		font-weight: bold;
		margin: 20px;
	}
	.text{
		margin: 10%;
		font-size: 20px;
		color: gray;
		text-align: left;
	}
	
	.text2{
		font-size:20px;
		font-weight: bold;
	}
	
	.info_main{
	
		display:inline-block;
	}
	
	.info{
		width :450px;
		height :400px;
		display:inline-block;
	}
	
	
	.info1{
		margin:auto;
		display:inline-block;
	}
	.count{
		width: 70px;
		height: 30px;
		margin : 20px;
	}
	.plus, .minus{
		width: 50px;
		height: 30px;
	}
	
	.cart{
		margin: 30px;
		width: 200px;
		height: 50px;
		background-color: black; 
		color : white;
	}

	.order{
		margin: 30px;
		width: 200px;
		height: 50px;
		background-color: black; 
		color : white;
	}
	
	.total > div{
		display:inline-block;
		vertical-align: middle;
	}
	
	#result{
		font-size: 25px;
		margin: 10px;
	
	}
	
	#result1{
		color:red;
		font-size: 25px;
		font-weight: bold;
		float:right;
		
	}
	
	#bt1{
		width: 50px;
		height: 50px;
	}
</style>
<body>
<<<<<<< HEAD
<form method = "post" action = "/Store/cartadd.do">
	<div class = "name">${storeDTO.name }</div> 
					<hr style="border: solid 1px black;">
			<div class = "info_main">
				<div class = "info">
					  <div><img src="${storeDTO.image }" width="400px" height= "400px"></div>
				</div>	   
					<div class = "info1">
					     <div class = "price"> ${storeDTO.price} 원</div> 
							 <hr style="border: solid 1px gray;">
					      <div class = "text">
					      유효기간 : 내가 집가고 싶을 때...까...지....
					      </div>
=======
<form method = "post">
	<div id = "menu_name">${storeDTO.name }</div> 
	<hr style="border: solid 1px black;">

			<div class = "info_main">
				<div class = "info">
					  <div><img id = "image" src="${storeDTO.image }" width="400px" height= "400px"></div>
				</div>	   
					<div class = "info1">
					     <div><span id = "price">${storeDTO.price}</span> 원</div> 
							 <hr style="border: solid 1px gray;">
					      <div class = "text">
					      		유효기간 : 구매 후 24개월 이내
					      </div>
					</div>
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
					      <hr>
					
					<div class = "total">  
						<div><input id = "bt1" type='button' onclick='count("plus")' value='+'></div>
						<div id='result'>1</div>
						<div><input id = "bt1" type='button' onclick='count("minus")'  value='-'></div>
<<<<<<< HEAD
						<div id='result1'>${storeDTO.price}원</div>
     				</div>
    
    <!-- 수량 선택 후 자동계산 --> 				
<script>

=======
						<div id='result1'><span id = "total">${storeDTO.price}</span>원</div>
     				</div>
    
   					<div>
						 <br>	
						<button type = "submit"  formaction="/Store/storeOrder" >구매하기</button>
						<button type = "button" id = "cart">장바구니</button>
						<input type = "hidden" id = "menu_id" value = "${storeDTO.menu_id}">
					</div>
		</div>
   			
<script>
		// 수량 선택 후 자동계산	
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
		function count(type)  {
			  // 결과를 표시할 element
			  const resultElement = document.getElementById('result');
			  
			  // 현재 화면에 표시된 값
			 let number = resultElement.innerText;
			  
			  // 더하기/빼기
<<<<<<< HEAD
			  if(type === 'plus') {
=======
			  if(type == 'plus') {
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
				  
			    number = parseInt(number) + 1;
			    
			    
			    if(number > 10){
			    	number = 10;
			    }
			       
<<<<<<< HEAD
			  }else if(type === 'minus')  {
=======
			  }else if(type == 'minus')  {
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
			    number = parseInt(number) - 1;
			    if(number < 1){
			    	number = 1;
			    }
			
			  }
			  
			  // 결과 출력
<<<<<<< HEAD
			  resultElement.innerText = number;
			  
			  
			  // 총 수량 출력
			 const result1Element = document.getElementById('result1');
=======
		  resultElement.innerText = number;
		  
		  
		  // 총 수량 출력
		/*  const result1Element = document.getElementById('result1');
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
			  
			  let total = parseInt ('${storeDTO.price}') * number ;
			  console.log(total);
			  
<<<<<<< HEAD
			  result1Element.innerText = total + "원";
			  
			  
			}
=======
			  result1Element.innerText = "<span id='total'>"total + "원"; */
			  

			  const result1Element = document.getElementById('total');
			  
			  let total = parseInt ('${storeDTO.price}') * number ;
			  console.log(total);
			  
			  result1Element.innerText = total;
			    
			}

		
	 $("#cart").click(function(){
		 
		 let menu_id = $("#menu_id").val();
			console.log(menu_id);
			
		 let amount = $("#result").text();
			console.log(amount);
			
		 let price = $("#price").text();
			console.log(price);
			
		 let menu_name = $("#menu_name").text();
			console.log(menu_name);
		
		let total1 = $("#total").text();
			console.log(total1);
			
		let image = $("#image").attr("src");
			console.log(image);
			
		/* 	let name = $("#menu_name").text();
			let image = $("#image").text();
			let amount = $("#result").text();
			let price = $("#price").text();
			let total = $("#result1").text();
 */
 
 	
 
 	let data = {
			name : $("#menu_name").text(),
			image : $("#image").attr("src"), 
			amount : $("#result").text(),
			price : $("#price").text(),
			total : $("#total").text(),
			menu_id : $("#menu_id").val()
		}
 
 		console.log(data)
			$.ajax({
				url : "/Store/cartadd.do?menu_id="+menu_id,
				type : 'post',
				contentType: "application/json",
				data : JSON.stringify(data),
					
				success : function(data) {
					console.log("data", data);
					
					if(data == "login"){
						location.href = "/member/login.do"
						
					} else if (data == "already_exsted"){
					 	alert("이미 카트에 등록된 제품입니다.");
					 	
					} else {
						location.href = "/Store/cartlist.do?cart_id="+data
			
					}
							/* if(data == "cartlist"){
								let a = '${storeDTO.cart_id}';
								console.log(a) 	}  */
						
			    },				
				error : function(e) {
					
					console.log(e)
					alert("error:");
				}
			     
			});
		})
		
		// div 값 넘겨주기
			/* let image = document.getElementById('image').innerText;
			let amount = document.getElementById('result').innerText;
			let price = document.getElementById('price').innerText;
			let total = document.getElementById('result1').innerText; */
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
	
		
</script>

<<<<<<< HEAD
		<div>
			 <br>	
			<button class="btn btn-default btn-order">주문하기</button>
			<button class="btn-cart">장바구니</button>
		</div>
		</div>
		
<script>



</script>		
=======

	
>>>>>>> 85e46a346db7df8a03c0104a504f087a0b53cf2a
</form>
	
<hr style="border: solid 1px black;">
	

<!-- 더보기란으로 바꾸기 -->	
	
	<div class = "info_main2_1">
	   <p class = "text2">이용안내</p><br>
		• 해당 기프트콘은 Human모바일, 홈페이지, 오프라인 극장에서 영화를 예매할 수 있는 온라인 상품권입니다.<br>
		<strong>• 구매 후 전송받으신 기프트콘은</strong><br>
		 - 사용가능한 Human에서 지정된 상영타입의 영화만 예매 가능합니다. (골드클래스관에서 상영하는 일반 2D/ 일반 3D 영화)<br>
		 - 금액권이 아니므로 차액 환급이 불가합니다. (ex.조조영화/청소년 관람 시 차액환급 불가)<br>
		 - 영화 상영 후 환불 및 반품은 불가합니다.<br>
		<strong>• 관람권 기프트콘을 온라인에 등록하시는 경우</strong><br>
		 - 모바일 : MY > 관람권/카드 > 기프트콘에서 '기프트콘 등록' 버튼 선택하여 수신받은 쿠폰번호 입력<br>
		 - 홈페이지(PC) : ‘MyHuman > 스토어 > 내 기프트콘'에서 [기프트콘 등록]버튼 선택하여 수신받은 쿠폰번호 입력<br>
		<strong>• 유효기간 연장을 신청하는 경우</strong><br>
		 유효기간은 발급일로부터 5년 이내 횟수 제한 없이 기간 연장 가능하며, 1회 연장 시 3개월(92일) 단위로 유효기간이 연장됩니다.<br>
		 유효기간 만료 이후에는 결제금액의 90% 환불이 가능합니다.<br>
		 단, 이벤트 경품 및 프로모션 상품의 경우 유효기간 연장 및 환불이 불가할 수 있습니다.<br>
		• 관람권 기프트콘 구매/사용 시 Human ONE 포인트는 적립되지 않습니다.<br>
	</div>
	<div class = "info_main2_2">
		<p class = "text2">취소/환불</p><br>
		• 구매자는 최초 유효기간 이내에 결제금액의 100%에 대해 결제취소/환불이 가능하며, 최초 유효기간 만료 후에는 수신자가 결제금액의 90%에 대해 환불 요청 가능합니다.<br>
		• 단, 이미 사용된 기프트콘에 대해서는 결제취소/환불 신청이 불가합니다. <br>
		<strong>• 결제취소/환불 방법</strong><br>
		결제취소는 모바일App,웹 > MY > 결제내역조회 > 스토어 or 홈페이지 > My Human > 스토어 > 결제내역의 해당 주문 상세내역에서 가능합니다.<br>
		(기프트콘은 구매일로부터 60일 이내 결제취소 가능하며, 카드 결제취소 가능 기간이 경과하였을 경우, 고객센터로 연락주시면 됩니다)<br>
		환불은 모바일App,웹 > MY > 기프트콘 or 홈페이지 > My CGV > 스토어 > 내 기프트콘에서 환불을 원하는 기프트콘 등록 후 진행 가능하며, 비회원의 경우 고객센터로 신청 가능합니다.<br>
		단 이 때, 본인 확인 및 계좌 확인 절차가 진행됩니다.<br>
		• 수신자는 선물받은 기프트콘의 수신거절을 요청할 수 있으며, 이 경우 구매자에게 취소 및 환불에 대한 안내가 이루어집니다. <br>
		• 결제취소 가능 기간이 경과한 후 수신자가 수신거절을 요청할 경우 구매자에게 기프트콘이 재발송됩니다. <br>
		• Human고객센터 041-561-1122<br>
	</div>
	<div class = "info_main2_3">
		<p class = "text2">미성년자 권리보호 안내</p><br>
		미성년자인 고객께서 계약을 체결하시는 경우 법정대리인이 그 계약에 동의하지 아니하면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있습니다.
	</div>
	<div class = "info_main2_4">
		<p class = "text2">분쟁 해결</p><br>
		1) 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해의 보상 등에 관한 처리를 위하여<br>
		  Human고객센터 041-561-1122 를 설치 운영하고 있습니다.<br>
		2) 회사는 고객센터를 통하여 이용자로부터 제출되는 불만사항 및 의견을 처리합니다.<br>
		  다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보합니다.<br>
		3) 전자상거래 분쟁(청약철회등)과 관련한 이용자의 피해구제는 이용약관 및 전자상거래법 등 관련 법령에 따릅니다.<br>
	</div>
</div>




</body>
</html>