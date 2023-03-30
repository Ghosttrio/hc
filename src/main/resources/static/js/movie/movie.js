        




document.querySelector("#tab1").classList.add("violet");
document.querySelector("#tab2").classList.add("violet2");
document.querySelector(".section2").style.display = "none";
for (let k = 1; k < 3; k++) {
    document.querySelector("#tab"+k).addEventListener("click", () => {
        for (let i = 1; i < 3; i++) {
            if (i == k) {
            	document.querySelector(".section" + i).style.display = "flex";
                document.querySelector("#tab" + i).classList.add("violet");
                document.querySelector("#tab" + i).classList.remove("violet2");
            } else {
            	document.querySelector(".section" + i).style.display = "none";
                document.querySelector("#tab" + i).classList.remove("violet");
                document.querySelector("#tab" + i).classList.add("violet2");
            }
        }
    })
}


/* 상영중 */
document.querySelector(".more").addEventListener("mouseover",function(){
    document.querySelector(".more").classList.add("more1");
});
document.querySelector(".more").addEventListener("mouseout",function(){
    document.querySelector(".more").classList.remove("more1");
});

$(function(){
    $(".movie_article").slice(0, 8).show();
    if($(".movie_article").length < 4){
        $(".more").css('display', 'none');
    }
    $(".load").click(function(e){ 
        e.preventDefault();
        $(".movie_article:hidden").slice(0, 4).show();
        if($(".movie_article:hidden").length == 0){
            $(".more").css('display', 'none');
        }
    });
});


/* 상영예정 */
document.querySelector(".more2").addEventListener("mouseover",function(){
    document.querySelector(".more2").classList.add("more1");
});
document.querySelector(".more2").addEventListener("mouseout",function(){
    document.querySelector(".more2").classList.remove("more1");
});

$(function(){
    $(".movie_article2").slice(0, 8).show(); 
    if($(".movie_article2").length < 4){
        $(".more2").css('display', 'none');
    }
    $(".load2").click(function(e){ 
        e.preventDefault();
        $(".movie_article2:hidden").slice(0, 4).show();
        if($(".movie_article2:hidden").length == 0){
            $(".more2").css('display', 'none');
        }
    });
});

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


document.querySelector(".booking_login2").addEventListener("click", function(){
	if(document.querySelector(".booking_login_value2").value==1){
		swal("Notice","로그인이 필요합니다.");
	}
})




