<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>
<%@ page language = "java" contentType = "text/html;charset = utf-8" pageEncoding = "utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<html>
<title>추가</title>
<head>
<style>
	#minitabs{

		margin: 0;

		padding:0 0 50px 10px;
		border-bottom: 2px solid #696;
		

	}

	#minitabs li{
		margin 0;
		padding 0;
		display: inline;
		list-style-type: none;

	}

	#minitabs a{
		float: left;
		line-height: 14px;
		font-weight: bold;
		margin: 0 10px	4px	10px;
		text-decoration: none;
		font-size: 12px;
		color: #9c9;

	}
	#minitabs a.active,#minitabs a:hover{
		border-bottom: 4px solid #696;
		padding-bottom: 2px;
		color: #363;	
	}
	#minitabs a: hover{
		color: #696;
		
	}
	#thisform{
		font-family: Georgia, serif;
		font-size : 15px;
		color: #999;
	}
	#thisform p{
		margin: 20px 0;
	}
	#thisform label{
	
	font-family: Verdana, sans-serif;
	font-size: 15px;
	font-weight: bold;
	color: #660000;
	}	
	#name, #email{
		width: 200px;
	}
	
	</style>

	
	<div id = "menu">
	<ul id = "minitabs">
		<li><a href = "add.jsp"><h1>추가&nbsp</h1></a></li>
		<li><a href = "search.jsp"><h1>조회&nbsp</h1></a></li>
		<li><a href = "static.jsp"><h1>통계</h1></a></li>
	</ul>
	</div>



</head>
<script type = "text/javascript">
	window.onload = function(){
		document.getElementById("information").onsubmit = function(){
			var date = document.getElementById("date").value;
			var name = document.getElementById("name").value;
			var money = document.getElementById("money").value;
			var Sname = document.getElementById("Sname").value;
			var result = document.getElementById("result").value;
			
			if(date.length == 0){
				alert("날짜를 입력해주세요!");
				return false;
			}
			if(name.length == 0){
				alert("이름을 입력해주세요!");
				return false;
			}
			if(money.length == 0){
				alert("지불액수를 입력해주세요!");
				return false;
			}
			if(Sname.length == 0){
				alert("가게명을 입력해주세요!");
				return false;
			}
		
			return true;
			
		}
	}
</script>
<body>

<form id ="information" action = "insert_db.jsp" method = "post" onsubmit="insert_check()">	<!--추가 버튼을 누르면 insert_db.jsp 소스를 호출 -->
	<p><label for = "date">날짜 : </label><br/>
	<input type = "date" id = "date" name = "date" tabindex = "1" size = "20" /></p>
	<p><label for = "name">이름 : </label><br/>
	<input type = "text" id = "name" name = "name" tabindex = "1" size = "20" /></p>
	<p><label for = "name">지불액수 : </label><br/>
	<input type = "text" id = "money" name = "money" tabindex = "1" size = "20" /></p>
	<p><label for = "name">가게명 : </label><br/>
	<input type = "text" id = "Sname" name = "Sname" tabindex = "1" size = "20" /></p>
	
	<p><label for = "fail">가위바위보 결과 </label>
	<select name = "result" id = "result">
		<option value = "가위">가위</option>
		<option value = "바위">바위</option>
		<option value = "보">보</option>
	</select>
	<p><input type = "submit" value = "추가"> <input type = "reset" value = "초기화"></p>
</form>



</body>
</html>