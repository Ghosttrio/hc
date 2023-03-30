	
	

	
	
	
	
		// 더보기
	document.querySelector(".more").addEventListener("mouseover",function(){
	    document.querySelector(".more").classList.add("more1");
	});
	document.querySelector(".more").addEventListener("mouseout",function(){
	    document.querySelector(".more").classList.remove("more1");
	});
	
	$(function(){
	    $(".article").slice(0, 1).show(); 
	    $("#load").click(function(e){ 
	        e.preventDefault();
	        $(".article:hidden").slice(0, 1).show();
	        if($(".article:hidden").length == 0){
	            $(".more").css('display', 'none');
	        }
	    });
	});
	
	
	if(document.querySelector("#idcheck").value == null){
		document.querySelector(".btn1").addEventListener("click", function(){
			if(document.querySelector(".booking_login_value2").value==1){
				swal("Notice","로그인이 필요합니다.");
			}
		 });
		document.querySelector(".comment_login").addEventListener("click", function(){
			if(document.querySelector(".comment_login_value").value==1){
				swal("Notice","로그인이 필요합니다.");
			}
		});
		document.querySelector(".recomment_btn").addEventListener("click", function(){
			if(document.querySelector(".recomment_login_value").value==1){
				swal("Notice","로그인이 필요합니다.");
			}
		});
		
	}
	

	
	document.querySelector(".like_btn").addEventListener("click", function(){
	   	 $.ajax({
			    url: "like.do",
			    type: "POST",
			    dataType: "html",
			   	data:{
		            command : $('.command').val(),
		            articleNO1 : $('.articleNO1').val()
		        },
			    success:function(data){  
			    	swal("Notice","좋아요가 반영되었습니다.");
			    	let a = data;
			    	console.log(a);
			    	$(".like_btn").val("♡ "+a);
			    },   
			    error: 
			    function (request, status, error){  
			    }
			  });
	   })
		
