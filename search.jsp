<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>
<%@ page language = "java" contentType = "text/html;charset = utf-8" pageEncoding = "utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>



<title>조회</title>

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
	<div id = "menu">
	<ul id = "minitabs">
		<li><a href = "add.jsp"><h1>추가&nbsp</h1></a></li>
		<li><a href = "search.jsp"><h1>조회&nbsp</h1></a></li>
		<li><a href = "static.jsp"><h1>통계</h1></a></li>
	</ul>
	</div>



</head>

<body>
	<br></br>
	<table border = 1>
	<tr>
	<td>날짜</td>
	<td>이름</td>
	<td>지불액수</td>
	<td>가게명</td>
	<td>가위바위보 결과</td>
	<td>수정</td>
	<td>삭제</td>
	</tr>

	
	<%
	
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
		String sql = "select * from user_db order by date DESC";
		ResultSet rs = stmt.executeQuery(sql);
		
	
	
	if(rs != null){
		while(rs.next()){
			int id = Integer.parseInt(rs.getString("id"));
	%>
	
	<tr>
		
		<td><%=rs.getDate("date")%></td>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("money")%></td>
		<td><%=rs.getString("sname")%></td>
		<td><%=rs.getString("result")%></td>
		<td><a href = '#' onClick = "window.open('update.jsp?id=<%=rs.getString("id")%>','CLIENT_WINDOW','resizable = yes scrollbars=yes width=600 height=550')">수정</a></td>
		<td><a href = "delete_db.jsp?id=<%=rs.getString("id")%>">삭제</a></td>
	</tr>
	<%
		}
		}
	%>
	
	</table>
</body>
</html>



