<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	#content-wrap{ 
		display: inline-block;  /* body 옆에 붙도록 줌*/
	} 
	#content{ 
		display: inline-block;  /* body 옆에 붙도록 줌*/
		margin-top: 50px;
		margin-left: 20px;
	} 
	
	table {
	 width: 780px;
	 margin-top:50px;
	  border: 1px #49443f solid;
	  box-shadow: 0 2px 5px rgba(0,0,0,.25);
	  font-size: .9em;
	  margin: auto;
	  border-collapse: collapse; /*테이블 테두리 셀의 테두리 사이 간격*/
	  border-radius: 5px;/*테이블 둥근 테두리*/
	  overflow: hidden;
	}
	th {
	    letter-spacing: 3px; /*테이블 상단 자간*/
	    font-size: large;
	    background-color: black;
	    opacity: 0.85;/* 투명도 */
	    color: white;
	}
    td, th {
		vertical-align: middle;
		padding: 15px;
		text-align: center;
		border-bottom: 1px solid rgba(0,0,0,.1); /* 테이블 구분선 */
    }
	input{
        border: none;   /* 입력란 라인제거*/
    }
	/* 회원탈퇴 버튼 css*/
	#btn input{
		border: 0;	/*초기화 */
		outline: none; /*초기화 */
		width: 40%;	/*버튼 넓이는 테이블 40%가 어떨까나 */
		height: 40px;	/* 버튼 높이*/
		border-radius: 10px;
		background: black;
		color: white;	/* 글자색상은 흰색 */
		opacity: 0.85;/* 투명도 */
		letter-spacing: 1.2px; /* 자간 간격 */
	}
</style>

<body>
	<div id="content-wrap">
		<form action="" method="post">
			<table>
				<tr>
					<td id="inputset"></td>
					<td>${result.member_name}(${result.member_id})님 환영합니다.</td>
				</tr>
					<td><input class="button" type="submit" value="프로필 사진"></td>
					<td id="inputset">고객님은 일반등급 입니다</td>
				<tr>
					
				</tr>
			</table>
		</form>
	</div>
</body>