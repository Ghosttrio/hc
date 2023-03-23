<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            border: 1px solid red;
        }
        section > *{
            display: inline-block;
            vertical-align: top;
        }
        aside{
            border: 1px solid red;
            width: 19%;
            height: 800px;
        }
        article{
            border: 1px solid red;
            width: 80%;
            height: 800px;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <header>
            <h1>관리자페이지</h1>
            <div><input type="submit" value="로그아웃"></div>
        </header>
        <section>
            <aside>
                <div>관리탭</div>
                <div><a href="memberManager.do"><input type="submit" value="회원관리"></a></div>
                <div><a href="movieManager.do"><input type="submit" value="영화관리"></a></div>
                <div><a href="theaterManager.do"><input type="submit" value="극장관리"></a></div>
            </aside>
            <article>관리자페이지</article>
        </section>
    </div>
</body>
</html>