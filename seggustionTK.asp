<!--#include file="connection.asp"-->
<% 
	keyword = Request.Querystring("keyword")
	sql = "select * from TaiKhoan where TenTK like '%" + keyword +  "%'"
	rs.open sql, conn 
%>

<html>
	<head>
		<meta charset="utf-8">
		<style>
 
</style>
	</head>
	<body>
			<ul id="country-list">
				<%while not rs.eof  %>
				<center>
				<li onClick="selectCountry('<% response.write(rs("TenTK")) %>');">
					<% response.write(rs("TenTK")) %>
				</li>
				</center>
				<%
					rs.movenext
					wend 
					%>
			</ul>
	</body>
</html>