
	function search(target){
	
	    $.ajax({
	        type: 'GET',
	        dataType: 'JSON',
	        url: 'search.do',
	        error: function(err){
	            console.log(err);
	        },
	        success: function(data){
	            var checkWord = $("#movieInput").val();
	            var movieList = $("#movieList");
	           /*  console.log(checkWord); */
				
	            movieList.empty();
	            data.forEach((movie)=>{
	                if(movie['title'].includes(checkWord)){
	                	console.log(movie['title']);
	                    movieList.append(
	                  		"<input class=\"ajaxList\" type=\"submit\" value=\""+movie['title']+"\">"+ 
	                  		"<br/><input type=\"hidden\" name=\"articleNO\" value="
	                  		+movie['articleNO']+">"); 
	                }
	            })
	        }
	    })
	
	}    
	

	