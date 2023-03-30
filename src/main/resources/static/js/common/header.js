	

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
