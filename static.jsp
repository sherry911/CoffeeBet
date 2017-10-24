<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>
<%@ page language = "java" contentType = "text/html;charset = utf-8" pageEncoding = "utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>




<html>
<title>통계</title>
<head>
<link rel="stylesheet" type="text/css" href="vGraph.css"/>
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
	
	table {
   		 
		width: 100%;
   		border-top: 1px solid #444444;
  		border-collapse: collapse;
		font-size: 15px;	
		font-weight: bold;
		color: #660000;
 	 }
  	th, td {
   		 border-bottom: 1px solid #444444;
   		 padding: 10px;
  		  text-align: center;
 	 }
 	 thead tr {
 		background-color: #0d47a1;
   		color: #ffffff;
  	}
 	 tbody tr:nth-child(2n) {
 	   background-color: #bbdefb;
 	 }
  	tbody tr:nth-child(2n+1) {
  	  background-color: #e3f2fd;
 	 }

</style>
</head>

<body>
	<div id = "menu">
	<ul id = "minitabs">
		<li><a href = "add.jsp"><h1>추가&nbsp</h1></a></li>
		<li><a href = "search.jsp"><h1>조회&nbsp</h1></a></li>
		<li><a href = "static.jsp"><h1>통계</h1></a></li>
	</ul>
	</div>
	
	
	<br><br>	
	<form action = "static_date.jsp" method = "post">	<!--추가 버튼을 누르면 static_date.jsp 소스를 호출 -->
	<fieldset>
	<legend>기간 필터링</legend>
	<p><input type = "date" id = "pre_date" name = "pre_date" tabindex = "1" size = "20" />부터
	<input type = "date" id = "post_date" name = "post_date" tabindex = "1" size = "20" /></p>
	<p><input type = "submit" value = "조회"> <input type = "reset" value = "초기화"></p>
	</fieldset>
	</form>

	
	<br><h3> [가장 돈을 많이 쓴 사람] </h3>
	<table border = "1" width = "200" height = "300">
	<tr>
	<td>랭킹</td>
	<td>이름</td>
	<td>지불액수</td>
	</tr>
	<%
	
		String[] name = new String[5];
		int[] money_percent = new int[5];
		int[] money = new int[5];
		int[] count_percent = new int[5];
		int[] count = new int[5];
		Connection con = null;
		Statement stmt = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/user";
			con = DriverManager.getConnection(url,"root","1234");

			
		}catch (Exception e){
			out.println("데이터베이스 접속에 문제가 있습니다. <hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		stmt = con.createStatement();
		String sql = "select name,sum(money) from user_db group by name order by sum(money) DESC";
		ResultSet rs = stmt.executeQuery(sql);
		int i=0;
	
	
	if(rs != null){
		while(rs.next()){
			if(i<5){
				name[i] = rs.getString("name");
				money[i] = Integer.parseInt(rs.getString("sum(money)"));
				money_percent[i] = money[i]/1000;
			}
			i++;
	%>
	
	<tr>
		
		<td><%=i%>위</td>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("sum(money)")%></td>
		
		
	</tr>
	<%
		}
		}
	%>
	</table>
	
	<br><h3>[가장 돈을 많이 쓴 Top 5]</h3>
	<div class="vGraph">
	<ul>
		<li><span class="gTerm"><%=name[0]%></span><span class="gBar" style="height:<%=money_percent[0]%>%"><span><%=money[0]%>원</span></span></li>
		<li><span class="gTerm"><%=name[1]%></span><span class="gBar" style="height:<%=money_percent[1]%>%"><span><%=money[1]%>원</span></span></li>
		<li><span class="gTerm"><%=name[2]%></span><span class="gBar" style="height:<%=money_percent[2]%>%"><span><%=money[2]%>원</span></span></li>
		<li><span class="gTerm"><%=name[3]%></span><span class="gBar" style="height:<%=money_percent[3]%>%"><span><%=money[3]%>원</span></span></li>
		<li><span class="gTerm"><%=name[4]%></span><span class="gBar" style="height:<%=money_percent[4]%>%"><span><%=money[4]%>원</span></span></li>
	</ul>
	</div>

	
	
	
	
<br><h3>[가장 커피를 많이 산 사람]</h3><br>
	<table border = 1>
	<tr>
	<td>랭킹</td>
	<td>이름</td>
	<td>커피 산 횟수</td>
	</tr>
	<%
	
		stmt = con.createStatement();
		sql = "select name,count(*) from user_db group by name order by count(*) DESC";
		rs = stmt.executeQuery(sql);
		int post = 0;
		int rank=1;
		i=0;
	
	
		if(rs != null){
		while(rs.next()){
			if(i<5){
				name[i] = rs.getString("name");
				count[i] = Integer.parseInt(rs.getString("count(*)"));
				count_percent[i] = Integer.parseInt(rs.getString("count(*)"))*20;
			}
			if(post > Integer.parseInt(rs.getString("count(*)"))){
					rank++;
			}
			i++;
			
	%>
	
	<tr>
		
		<td><%=rank%>위</td>
		<td><%=rs.getString("name")%></td>
		<td>><%=Integer.parseInt(rs.getString("count(*)"))%></td>
		
	</tr>
	<%
		post =  Integer.parseInt(rs.getString("count(*)"));
		}
		}
	%>
	
	</table>	
	
	<br><h3>[가장 커피를 많이 산 사람]</h3>
	<div class="vGraph">
	<ul>
		<li><span class="gTerm"><%=name[0]%></span><span class="gBar" style="height:<%=count_percent[0]%>%"><span><%=count[0]%>번</span></span></li>
		<li><span class="gTerm"><%=name[1]%></span><span class="gBar" style="height:<%=count_percent[1]%>%"><span><%=count[1]%>번</span></span></li>
		<li><span class="gTerm"><%=name[2]%></span><span class="gBar" style="height:<%=count_percent[2]%>%"><span><%=count[2]%>번</span></span></li>
		<li><span class="gTerm"><%=name[3]%></span><span class="gBar" style="height:<%=count_percent[3]%>%"><span><%=count[3]%>번</span></span></li>
		<li><span class="gTerm"><%=name[4]%></span><span class="gBar" style="height:<%=count_percent[4]%>%"><span><%=count[4]%>번</span></span></li>
	</ul>
	</div>
	

</body>
			

</html>