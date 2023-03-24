

 window.onload = () => {
	 for (let k = 1; k < 5; k++) {
		document.querySelector(".like_btn"+k).addEventListener("click", function(){
	   	 $.ajax({
			    url: "like.do",
			    type: "POST",
			    dataType: "html",
			   	data:{
		            command : $('.command').val(),
		            articleNO1 : $('.articleNO1'+k).val()
		        },
			    success:function(data){  
			    	alert("성공");
			    	let a = data;
			    	console.log(a);
			    	 /* 화면에 표시하는 방법  */
			    	$(".like_btn"+k).val("♡ "+a);
			    },   
			    error: 
			    function (request, status, error){  
			    }
			  });
	   })
	}
}