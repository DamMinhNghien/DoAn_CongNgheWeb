<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<%
			if (Session("login") = false) then
				Session("loi_dangnhap") = "Bạn phải đăng nhập mới vào được trang này!"
				Response.Redirect("login.asp")
			else
		%>
		<p align=right>Chào mừng bạn: <% Response.write(Session("TenDangNhap1"))%> <a href="logout.asp">Logout</a></p>
		<%
		end if 
		%>
	</body>
</html>