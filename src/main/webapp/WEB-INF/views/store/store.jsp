<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
 a{
        text-decoration: none;
        color: black;
    }
    li{
        list-style: none;
    }

    #bar1{
    	
        text-decoration: none;
        width: 100%;
        height: 50px;
 
    }
    #bar1 ul li{
        float: left;
        width: 15%;
        height: 100%;
        line-height: 50px;
        text-align: center;
 
    }
    #bar1 ul li a{
        display: block;
    }
    #bar1 ul li a:hover{
       
       font-size : 20px;
       font-weight: bold;
    }
    #bar2 ul li{
 
	    text-align: center;
	    float: right;
        height: 50px;
        text-decoration: none;
        color: black;
        display: block;
    }
     #bar2 ul li a{
        display: block;
    }
    
     #bar2 ul li a:hover{
       
       font-size : 20px;
       font-weight: bold;
    }
</style>
<body>
	 <div class = "title">	
			    <div id = "bar1">
			        <ul>
			            <li><a href="/Store/selectMenu.do?menu_type=10">스낵</a></li>
			            <li><a href="/Store/selectMenu.do?menu_type=20">음료</a></li>
			            <li><a href="/Store/selectMenu.do?menu_type=30">영화관람권</a></li>
			            
			        </ul>
			        
				    <div id = "bar2"> 
				    	<ul>
							<!-- <li><a href= "/HumanCinema/menu/cart.do">장바구니</a></li>	 -->
							</ul>
				    </div>
	</div>
</body>
</html>