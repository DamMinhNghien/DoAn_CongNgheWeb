<!--#include file="connection.asp"-->
<%
	'lấy dữ liệu sắp xếp theo corder giảm dần
	sql = "select * from Categories order by corder desc"
	rs.open sql, conn 
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Danh mục nhóm sản phẩm</h1>
		<table border=1 cellspacing=5 cellpadding=5 align=center>
			<tr>
				<th>Mã</th>
					<th>Tên</th>
				<th>Mô tả</th>
				<th>Ảnh</th>
				<th>Sắp xếp</th>
				<th>Trạng thái</th>
			</tr>
			<%
				if (rs.eof) then
					response.write("<tr><td colspan=6>Bảng không có dữ liệu!</td></tr>")
				else 
					while not rs.eof 
					%>
						<tr>
							<td><%=rs("cid")%></td>
							<td><%=rs("cname")%></td>
							<td><%=rs("cdesc")%></td>
							<td><img src="images/<%=rs("cimage")%>" width=200></td>
							<td><%=rs("corder")%></td>
							<td>
								<% if (rs("cstatus")=0) then
										response.write("Ngừng hoạt động")
								   else 
										response.write("Hoạt động")
								   end if 
								%>
							</td>
					<%
					rs.movenext
					wend 
				end if
				rs.close 
				conn.close 
			%>
		</table>
	</body>
</html>