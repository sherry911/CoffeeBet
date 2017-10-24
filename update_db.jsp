<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>
<%@ page language = "java" contentType = "text/html;charset = utf-8" pageEncoding = "utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<html>
	<title></title>
	<head></head>
	<body>
	
	<%
	
	String id = request.getParameter("id");
	String d,name,money,sname,result;
	d = request.getParameter("date");
	name = request.getParameter("name");
	money = request.getParameter("money");
	sname = request.getParameter("Sname");
	result = request.getParameter("result");
	
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
		
		sql = "update user_db set date = '"+d+"', name='"+name+"', money='"+money+"', sname='"+sname+"', result='"+result+"' where id="+id ;
		
		try{
			stmt.executeUpdate(sql);
			out.println("수정되었습니다.<hr>");
		}
		catch(Exception e){
			out.println("데이터베이스 삽입 연산이 실패하였습니다.<hr> ");
			e.printStackTrace();
		}
	

	%>
	
	
	<input type = "button" value = "닫기" onclick = "refresh()" />
	<script>
		function refresh(){
			window.opener.location.reload();
			window.close();
		}
	</script>
	
	
	</body>
</html>