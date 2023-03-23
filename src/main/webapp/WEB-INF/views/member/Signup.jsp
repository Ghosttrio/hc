<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link  href="/css/MemberSignup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	// 브라우저가 켜지면 아래 메소드가 실행한다. 
    window.onload = function(){
        init();
        bind();
    }   
        function init(){    }
        function bind(){
        	
	        //메인화면 슬라이더
	        setInterval(fnSlide, 3000);
	 		
	        
       	 	//회원가입 폼  메소드 실행
	        $('#new').on('click',function(){
	        	//값 초기화. 회원가입 버튼 비활성화
// 	            $("#버튼 아이디").prop("disabled",true);	
		
			        if(	$('#inputPwd1').val() == $('#inputPwd2').val()
			        		&& $(!'#member_id'=="")
			        		&& $(!'#member_pwd'=="")
			        		&& $(!'#member_name'=="")
			        		&& $(!'#member_email'=="")
			        		&& $(!'#member_number'=="")
			        		){
		    			
		   			 //and 로 계속 충족되는 지 확인 하고 넘기기
		   			$('#addMember').submit();
		   			 
			   		}else {
			   			
			   			return false;
			   			alert("회원가입에 실패 하였습니다.");
			   			
			   		}
		   	})
	        
  	  }
	
        //메인화면 슬라이더 옵션
        function fnSlide() {
	            $(".slider").animate({ "margin-left": "0px" }, 3000, function () {
	                $(".slider").css({ "margin-left": "0px" });
	                $(".slider img:first-child").insertAfter(".slider img:last-child");
	            });
	        };
        
	     //아이디 중복체크 기능
        function fn_checkMember(){
            var _id=$("#inputId").val();
            //입력한 아이디 값을 가져와서
            if(_id==''){
           	 alert("아이디를 입력하세요.")
           //입력이 없으면 리턴
           	 return;
            }
            $.ajax({
	                type:"post",	//post 방식으로 전달
	                async:true,  
	                url:"/member/checkMember",	 //Controller에서 요청 받을 주소
	                dataType:"text",	//서버로 돌려 받는 값의 타입 지정
	                data: {member_id:_id},	//아이디를 서블릿에 전송한다.
	                success:function (data,textStatus){
	             	  	 //alert(data);
	             	   
	             	   console.log(data)
	                   if(data=='false'){
	                	   $('#message').text("사용할 수 있는 아이디입니다.");
	                	   //alert("사용 할 수 있는 아이디입니다.")
	                	   
	                	   $('#new').removeAttr("disabled");
	                	   //회원가입 비활성화를 사용가능한 아이디 일때 활성화 시킨다
	                	   
	                	   //$('#idcheck').prop("disabled", true);
	                	   //사용 할 수 있는 id일 때 버튼 비활성화(여러번 누르는 것을 막음)
	                   }else{
	                	   $('#message').text("이미 사용 중인 아이디입니다.");
	                	    //alert("이미 사용 중인 아이디입니다.")
	                	    
	                   }
	                },
	                error:function(data,textStatus){
	                   alert("에러가 발생했습니다.");
	                },
	                complete:function(data,textStatus){
	                }
            });  //end ajax	 
         }
</script>

<c:if test="${result=='signupSucceed' }">
	  <script>
	    window.onload=function(){
	      alert("${msg}");
	    }
	  </script>
</c:if>

    
</head>
<body>

    <section class="login">
        <div class="login_box">
            <div class="left_img">
                <div class="slider">
                    <img id="mainimg" src="/image/loginPoster01.jpg">
                    <img id="mainimg" src="/image/loginPoster02.jpg">
                    <img id="mainimg" src="/image/loginPoster03.jpg">
                    <img id="mainimg" src="/image/loginPoster04.jpg">
                    <img id="mainimg" src="/image/loginPoster05.jpg">
                    <img id="mainimg" src="/image/loginPoster06.jpg">
                    <img id="mainimg" src="/image/loginPoster07.jpg">
                    <img id="mainimg" src="/image/loginPoster08.jpg">
                    <img id="mainimg" src="/image/loginPoster09.jpg">
                    <img id="mainimg" src="/image/loginPoster10.jpg">
                </div>
            </div>
            
            <div class="right_login">
                <div class="sign-in">
                
                <form id="addMember" method="post" action="/member/addMember">
                  <div class="join_login">
                     <div class="inputSet"><input id="inputId"  type="text" name="member_id" placeholder="아이디를 입력하세요" maxlength="20">
                     <input type="button" class="check"  id="idcheck" onclick="fn_checkMember()" value="확인&#128504;"></div>
                     <div id="message"></div>
                     <div class="inputSet"><input id="inputPwd1"  type="password" name="member_pwd" placeholder="비밀번호를 입력하세요" maxlength="20" ></div>
                     <div class="inputSet"><input id="inputPwd2"  type="password" name="member_pwd2" placeholder="한번 더 입력하세요" maxlength="20" ></div>
                     <h1></h1>
                     <div class="inputSet"><input id="inputName"  type="text" name="member_name" placeholder="이름을 입력하세요" ></div>
                     <div class="inputSet"><input id="inputEmail"  type="text" name="member_email" placeholder="이메일을 입력하세요" ></div>
                     <div class="inputSet"><input id="inputNumber"  type="text" name="member_number" placeholder="전화번호를 입력하세요" ></div>
                 </div>
                 <button  type="submit" class="submit"  id="new"  disabled="disabled">회원가입</button><br>
                 </form>
                 
               </div>
            </div>
        </div>
    </section>       
</body>
</html>