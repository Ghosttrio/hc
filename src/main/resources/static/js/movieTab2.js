window.onload = function(){
/*${total}*/
	    for (let k = 1; k <= 5; k++) {
	    	document.querySelector("#like_btn"+k).addEventListener("click", () => {
	       	 $.ajax({
	    		    url: "../movie1",
	    		    type: "POST",
	    		    dataType: "html",
	    		   	data:{
	    	            command : $('#command').val(),
	    	            articleNO1 : $('#articleNO1'+k).val()
	    	        },
	    		    success:function(data){      					
	    		    	let a = JSON.parse(data).like;
	    		    	console.log(a);
	    		  
	    		    	$("#like_btn"+k).val("좋아요 "+a);
	    		    },   
	    		    error: 
	    		    function (request, status, error){  
	    		    }
    		  });
	       })
	    }
}