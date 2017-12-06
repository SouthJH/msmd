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
	<section>
		그냥 아무 내용
	</section>
</body>