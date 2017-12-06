<!doctype html>
<head>
	<title>Title</title>
	<meta charset="UTF-8" />
</head>
<body>	<form method="POST">		<input type="text" name="user_id" required />		<input type="password" name="user_pw" required />
		<!-- input type="checkbox" name="creation" value="1" />계정 생성 -->		<input type="submit" value="sign in" />	</form>
	
	<%@ page import="java.sql.*" %>
	<%
		Connection con;
		Statement stmt;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MOVIE", "root", "1234");
		stmt = con.createStatement();
		
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		if(id == null || pw == null){
		}
		else { //if(request.getParameter("creation") == null) {
			String sql = "select * from user_info where uid = '" + id + "' and pw = '" + pw + "';";
			//out.println(sql + "<br/>");
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs != null) {
				if(rs.next()){
					out.println("로그인 성공");
					session.setAttribute("name", id);
					session.setMaxInactiveInterval(600);
					response.sendRedirect("./index.jsp");
				}
				else {
					out.println("로그인 실패: 아이디와 패스워드를 확인하세요.");
				}
			}
		}
	}
	catch(Exception e){
		out.println(e.getMessage()); 
		e.printStackTrace(); 
	}
	%>
	
	
</body>