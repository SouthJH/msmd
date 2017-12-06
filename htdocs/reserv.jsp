<!doctype html>
<head>
	<title>Title</title>
	<meta charset="UTF-8" />
	
</head>
<body>	
	<form action="reserv.jsp", method="POST">
		<select name="time" >
		<%@ page import="java.sql.*" %>
			<%
				Connection con;
				Statement stmt;
				
				if(request.getParameter("movie") != null){
					session.setAttribute("movie", request.getParameter("movie"));
				}
				if(request.getParameter("time") != null){
					session.setAttribute("time", request.getParameter("time"));
				}
				else{
					session.setAttribute("time", "0");
				}
				
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MOVIE", "root", "1234");
				stmt = con.createStatement();
				
				if(session.isNew() || session.getAttribute("name") == null || session.getAttribute("movie") == null) { %>
					<script>alert("로그아웃 되었습니다.");</script>
			<%		response.sendRedirect("./index.jsp");
				}
				
				String movie_id = (String)session.getAttribute("movie");
				String sql = "select * from screen where mid = " + movie_id + ";";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				if(rs != null){
					while(rs.next())
					{ %>
						<option value="<%= rs.getString("sid") %>">
							시작: <%= rs.getString("s_time") %> ~ 종료: <%= rs.getString("e_time") %>
						</option>
			<%		}
				}
				
			}catch(Exception e){
				out.println(e.getMessage()); 
				e.printStackTrace(); 
			}
			%>
		</select>
		<input type="submit" value="좌석 보기" />
		<input type="button" value="돌아가기" onclick="location.href = './movie.jsp'" />
	</form>
	
	<table border="1px solid black">
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MOVIE", "root", "1234");
			stmt = con.createStatement();
			
			String screen_id = (String)session.getAttribute("time");
			if(screen_id != "0"){
				String sql = "select seat from screen where sid = " + screen_id + ";";
				
				ResultSet rs = stmt.executeQuery(sql);
				String result = "";
				
				if(rs != null) {
					if(rs.next()) {
						result = rs.getString("seat");
					}
				}
				
				%>
					<div>screen<div>
				<%
				for(int idx = 0; idx < 12; ++idx){ %>
					<tr>
				<%	for(int jdx = 0; jdx < 13; ++jdx){
						if(result.charAt(idx * 13 + jdx) == 'n'){ %>
							<td>
								<%= (char)('A' + idx) %><%= (jdx < 10)? 0:1 %><%= jdx%10%>
							</td>
						<%} else { %>
							<td>X</td>
						<%}
					} %>
					</tr>
				<% }
			}
			
		}catch(Exception e){
			out.println(e.getMessage()); 
			e.printStackTrace(); 
		}
		%>
	</table>
	
</body>