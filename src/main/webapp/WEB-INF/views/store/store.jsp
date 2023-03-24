<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored = "false"
  %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
 
	.title{
	
	   margin: auto;
	  
	}
	#wrap_all {
			margin-left : 40px;
			margin-right : 40px;
	}
		
		/* 상단바 */
		* {top: 0; margin: 0; box-sizing: border-box;}
    a { text-decoration: none; }
    li { list-style: none; }
    /* h1, h2, h3, h4, h5, h6, p {margin: 10px 5px;} */
    /* h1 { font-size: 1.8em; } */

    body {
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        color: #58666e;
        background-color: #f0f3f4;
        -webkit-font-smoothing: antialiased;
        /* iphone font size 변경 방지 */
        -webkit-text-size-adjus: 100%;  
    }

    .wrap {
        width: 100%; 
        margin-top: 80px;
        position:relative;
        /* background:url() no-repeat center; */
    }
    header {
        width: 100%;
        height: 80px;
        background-color: #fff;
        /* box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05),
                       0 1px 0 rgba(0, 0, 0, 0.05); */
    }
    .logo {
      display: inline-block;
      height: 5px;
      margin: 12px 0 12px 25px;}
    .logo > img { height: 50px;}
    nav {
    	display: flex;
        justify-content: space-around;
        }
    .nav-items {margin-right: 20px;}
    .nav-items > li {display: inline-block;
    	
    }
    .nav-items > li > a {
      /* for Vertical Centering */
      line-height: 80px;
      padding: 0 30px;
      color: rgb(0, 0, 0);}
    .nav-items > li > a:hover {color: gold;}
		
		.a1 {
			
			padding-top:30px;
			padding-bottom : 20px;
		}
		
		#wrap_all {
			margin-left : 40px;
			margin-right : 40px;
		}
		
		.btn1 {
			margin-top : 20px;
		}
		
		.ddd{
			color:white;
			text-align:center;
			padding-top : 50px;
		}
		
		#logologo{
			width:200px;
			height:50px;
		}
	
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
    
    
    #menu1{
    	display: flex;
    	text-align: center;
    
    }
    
    #menu2{
    	float : left;
    	
    }
    
    #menu3{
    	float : right;
    	
    }
    
    .img{
    	float : left; 
    }
   
    .menu2-1{
  		float : right;
  		text-align:center;
  		margin-top:30%;
  	
  		
    }
   
    .main img{
    	filter: brightness(1);
    }
    
    .main img:hover{
    	filter: brightness(0.7);
    }
  
  .main{
  	padding-left: 10%;
  	padding-right: 10%;
  }
    

	

	
</style>


<body>
		
		<div class = "main">
			
		
		    
		</div>
</body>
</html>