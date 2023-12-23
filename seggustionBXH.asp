<!--#include file="connection.asp"-->
<% 
	keyword = Request.Querystring("keyword")
	sql = "select * from TopBXH where TenTop like '%" + keyword +  "%'"
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
				<li onClick="selectCountry('<% response.write(rs("TenTop")) %>');">
					<% response.write(rs("TenTop")) %>
				</li>
				</center>
				<%
					rs.movenext
					wend 
					%>
			</ul>
	</body>
</html>