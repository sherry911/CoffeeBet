<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>
<%@ page language = "java" contentType = "text/html;charset = utf-8" pageEncoding = "utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>



<html>
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
<title>게시글 삭제</title>
<%
	String id = request.getParameter("id");
	out.println(id);
	ResultSet rs = null;
	String sql;
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
		sql = "delete from user_db where id = " + id;	//삭제쿼리
		
		try{
			stmt.executeUpdate(sql);
			con.close();
		}
		catch(Exception e){
			out.println("데이터베이스 삭제 연산이 실패하였습니다.<hr> ");
			e.printStackTrace();
		}
%>

<script>
	alert("게시글이 삭제되었습니다");	//경고창 띄어줌
	location.href = "search.jsp";	//조회 페이지로 이동
</script>

<body>
</body>


</html>