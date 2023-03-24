
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <style>
        #wrap {
            margin-top: 30px;
            margin-left: 30px;
            margin-right: 30px;
        }
        header > *{
            display: inline-block;
        }
        h1{
            width: 90%;
        }
        section{
            
        }
        section > *{
            display: inline-block;
            vertical-align: top;
        }
        aside{
            width: 19%;
            height: 800px;
            background-color:#333;
            color:white;
        }
        article{
            width: 80%;
            height: 800px;
            overflow:scroll;
            background-color:#f2f0e5;
            
        }
        .article{
        	width:120px;
        	display:inline-block;
        	margin-bottom:10px;
        	border-radius:5%;
        	padding:3px;
        	background-color:#333;
        	
        }
        .article img {
        	border-radius:5%;
        }
        .top2_1{
        	font-size:20px;
        	font-weight:600;
        	margin-bottom:10px;
        }
        .content{
        	padding:10px;
        }
        .top2 > * {
        	display:inline-block;
        }
        .add{
        	float:right;
        }
        .title_long{
			white-space: nowrap; 
			overflow: hidden;  
			text-overflow: ellipsis;
			font-weight:600;
			color:white;
		}
		.delete{
			background-color: black;
		    color:white;
		    border-radius:5%;
		    cursor:pointer;
		    font-weight:600;
		}
		.update{
			background-color: black;
		    color:white;
		    border-radius:5%;
		    cursor:pointer;
		    font-weight:600;
		
		}
		.aside_title{
			background-color:#f2f0e5;
			color:black;
			text-align:center;
			font-size:30px;
			font-weight:600;
			padding:5px;
		}
    </style>
</head>
<body>
    <div id="wrap">
        <header>
            <h1>������������</h1>
        </header>
        <section>
            <aside>
                <div class="aside_title">������</div>
                <div><a href="memberManager.do"><input type="submit" value="ȸ������"></a></div>
                <div><a href="movieManager.do"><input type="submit" value="��ȭ����"></a></div>
                <div><a href="theaterManager.do"><input type="submit" value="�������"></a></div>
            </aside>
            
             <article>
				<div class="content">
					<h1>��ȭ����</h1>
				    <c:forEach var="movieList" items="${movieList }" varStatus="status">
					   <form action="movieManager.do" method="GET">
					    Ÿ��Ʋ : <input type="text" value="${movieList.title }" name="title">
					   	Ÿ��Ʋ(����) :	<input type="text" value="${movieList.title_en }" name="title_en">
					   	�������� :	<input type="text" value="${movieList.age }" name="age">
					   	������ : <input type="text" value="${movieList.opendate }" name="opendate">
						��ȭ���� : <input type="text" value="${movieList.explain }" name="explain">
						���� : <input type="text" value="${movieList.director }" name="director">
					   	�帣 : <input type="text" value="${movieList.genre }" name="genre">
					   	����Ÿ�� :	<input type="text" value="${movieList.runningtime }" name="runningtime">
					  	��� : <input type="text" value="${movieList.actor }" name="actor">
					   	������(���) : <input type="text" value="${movieList.poster_back }" name="poster_back">
					   	������(����) :	<input type="text" value="${movieList.poster_main }" name="poster_main">
					   	
					   	
					    <input type="submit">
					    <input type="reset">
					    <input type="hidden" name="command" value="update">
					   </form>
				    </c:forEach>
	            </div>
			</article>
        </section>
    </div>
</body>
</html>