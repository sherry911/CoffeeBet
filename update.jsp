<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>
<%@ page language = "java" contentType = "text/html;charset = utf-8" pageEncoding = "utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<html>
<title>수정페이지</title>

<head></head>
<%
	String id = request.getParameter("id");
	ResultSet rs = null;
	String sql;
	Connection con = null;
	Statement stmt = null;
	String pre_date,pre_name,pre_money,pre_Sname,pre_result;
	
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
		sql = "select * from user_db where id = " + id;	//id값에 따라 DB에서 내기 정보 조회
		
		rs = stmt.executeQuery(sql);
		rs.next();
		pre_date = rs.getString("date");
		pre_name = rs.getString("name");
		pre_money = rs.getString("money");
		pre_result = rs.getString("result");
		
		
		
%>

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
	<h1>수정페이지</h1>
	
	<!-- 이부분에서 id값이 넘어가도록 해야함 -->
	<form id = "information" action = "update_db.jsp?id=<%=rs.getString("id")%>" method = "post">	
	<!--추가 버튼을 누르면 update_db.jsp 소스를 호출 -->
	
	<p><label for = "date">날짜 : </label><br/>
	<input type = "date" id = "date" name = "date" value= <%=rs.getString("date")%> tabindex = "1" size = "20" /></p>
	<p><label for = "name">이름 : </label><br/>
	<input type = "text" id = "name" name = "name"  value= <%=rs.getString("name")%> tabindex = "1" size = "20" /></p>
	<p><label for = "name">지불액수 : </label><br/>
	<input type = "text" id = "money" name = "money"  value= <%=rs.getString("money")%> tabindex = "1" size = "20" /></p>
	<p><label for = "name">가게명 : </label><br/>
	<input type = "text" id = "Sname" name = "Sname"  value= <%=rs.getString("sname")%> tabindex = "1" size = "20" /></p>
	
	<p><label for = "fail">가위바위보 결과 </label>
	<select name = "result" id = "result"  value=  <%=rs.getString("result")%> >
		<option value = "가위">가위</option>
		<option value = "바위">바위</option>
		<option value = "보">보</option>
	</select>
	<p><input type = "submit" value = "수정"> <input type = "reset" value = "초기화"></p>
	</form>
	
</body>
</html>