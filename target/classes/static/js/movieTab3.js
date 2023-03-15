
window.onload = () => {
	
    
    /* document.querySelector("#search_btn").addEventListener("click", function(){
    	 $.ajax({
 		    url: "../movie",
 		    type: "POST",
 		    dataType: "html",
 		   	data:{
 		   		search_text : $('#search_text').val(),
 	        },
 		    success:function(data){      					
 		    	let a = JSON.parse(data).search;
 		    	console.log(a);
 		    	alert("검색시작");
 		    	$("#search_text").html(a);
 		    },   
 		    error: 
 		    function (request, status, error){  
 		      alert("ajax실패")                  
 		    }
 		  });
    	
    }) */
    
    
		document.querySelector(".more").addEventListener("mouseover",function(){
		    document.querySelector(".more").classList.add("more1");
		});
		document.querySelector(".more").addEventListener("mouseout",function(){
		    document.querySelector(".more").classList.remove("more1");
		});
		
		$(function(){
		    $(".show1").slice(0, 8).show(); 
		    $("#load").click(function(e){ 
		        e.preventDefault();
		        $(".show1:hidden").slice(0, 4).show();
		        if($(".show1:hidden").length == 0){
		            $(".more").css('display', 'none');
		        }
		    });
		});
	
	
	
}