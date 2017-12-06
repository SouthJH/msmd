<!doctype html>
<head>
	<title>Title</title>
	<meta charset="UTF-8" />
	
	<link rel="stylesheet" href="main.css" >
	<script src="login.js" ></script>
	<script>
	</script>
</head>
<body>
	<header>
		Here is banner
		<% 	if(session.isNew() || session.getAttribute("name") == null) { %>
				<input type="button" id="log_in_btn" value="log in" onclick="log_in_btn_function()" />
		<% 	} else { %>
				<span><%= session.getAttribute("name") %>님 환영합니다.</span>
				<form action="logout.jsp" method="POST">
					<input type="submit" value="log out" />
				</form>
		<%	} %>
	</header>
	<nav>
		<ul>
			<a href="./index.jsp"><li>Home</li></a>
			<a href="./movie.jsp"><li>Movie</li></a>
			<a href=""><li>My Page</li></a>
			<a href=""><li>Ohter2</li></a>
		</ul>
	</nav>
	
	<form action="movie.jsp" method="POST">
		<input type="text" name="searching_key" />
		<input type="submit" value="검색" />
	</form>
	
	<%@ page import="java.sql.*" %>
	<% 
		Connection con;
		Statement stmt;
		
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MOVIE", "root", "1234");
		stmt = con.createStatement();
		
		String searching_key = request.getParameter("searching_key");
		
		if(searching_key == null){
		}
		else {
			String sql = "select * from movie where title like '%" + searching_key + "%';";
			//out.println(sql + "<br/>");
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs != null) {
				while(rs.next())
				{ %>
					<form action="reserv.jsp" method="POST">
						제목: <%= rs.getString("title") %> <br/>
						장르: <%= rs.getString("genre") %> <br/>
						감독: <%= rs.getString("director") %> <br/>
						등급: <%= rs.getString("grade") %>세 이상 이용가능 <br/>
						<% if(session.isNew() || session.getAttribute("name") == null) { %>
							<input type="button" value="예약" onclick="alert('로그인이 필요합니다.')" />
						<% } else { %>
							<input name="movie" value="<%= rs.getString("mid")%> ">
							<input type="submit" value="예약" />
						<% } %>
					</form>
	<%			}
			}
		}
		
	}catch(Exception e){
		out.println(e.getMessage()); 
		e.printStackTrace(); 
	}
	%>
	
</body>