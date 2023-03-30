window.onload = () =>{
	

	
	function search(target){
	
	    $.ajax({
	        type: 'GET',
	        dataType: 'JSON',
	        url: 'search.do',
	        error: function(err){
	            console.log(err);
	        },
	        success: function(data){
	            var checkWord = $("#schoolInput").val();
	            var schoolList = $("#schoolList");
	           /*  console.log(checkWord); */
				
	            schoolList.empty();
	            data.forEach((school)=>{
	                if(school['title'].includes(checkWord)){
	                	console.log(school['title']);
	                    schoolList.append(
	                  		"<input class=\"ajaxList\" type=\"submit\" value=\""+school['title']+"\">"+ 
	                  		"<br/><input type=\"hidden\" name=\"articleNO\" value="
	                  		+school['articleNO']+">"); 
	                }
	            })
	        }
	    })
	
	}    
	
	document.querySelector(".booking_login").addEventListener("click", function(){
		if(document.querySelector(".booking_login_value").value==1){
			swal("Notice","로그인이 필요합니다.");
		}
	})
	
	document.querySelector(".booking_login2").addEventListener("click", function(){
		if(document.querySelector(".booking_login_value2").value==1){
			swal("Notice","로그인이 필요합니다.");
		}
	})
	
	for (let k = 1; k < 5; k++) {
		document.querySelector(".like_btn"+k).addEventListener("click", function(){
			if(document.querySelector(".like_login"+k).value==1){
				 $.ajax({
					    url: "like.do",
					    type: "POST",
					    dataType: "html",
					   	data:{
				            command : $('.command').val(),
				            articleNO1 : $('.articleNO1'+k).val()
				        },
					    success:function(data){  
					    	swal("Notice","좋아요가 반영되었습니다.");
					    	let a = data;
					    	console.log(a);
					    	$(".like_btn"+k).val("♡ "+a);
					    },   
					    error: 
					    function (request, status, error){  
					    }
					  });
			}else if(document.querySelector(".like_login"+k).value==2){
				swal("Notice","로그인이 필요합니다.");
			}
			
	   	
	   });
	}


}
