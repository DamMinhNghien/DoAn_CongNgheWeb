<!--#include file="connection.asp"-->
<%
	rs.cursorLocation = 3
	rs.pagesize = 2 
	'if (Request("cmd")<>"") then 
		str = Request("txtSearch")
	sql = "select a.*,b.cname from product a, categories b where a.cid = b.cid and pname like '%" & str & "%'"
	rs.open sql, conn 'lấy dữ liệu
	 
	pagecount = rs.pagecount 
	p = Cint(Request("page"))
	if (p<1) then
		p = 1
	end if 
	if (p>pagecount) then 
		p = pagecount 
	end if
	rs.absolutepage = p 
	'end if
%>
<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h1 align=center>Tìm kiếm sản phẩm</h1>
		<center>
			<form action="" method=POST>
				Nhập tên sp cần tìm:
				<input type=text size=50 name=txtSearch value="<%=str%>">
				<input type=submit name=cmd value="Tìm kiếm">
			</form>
		</center>
		
		<table align=center border=1 width=100%>
			<tr>
				<th>Mã</th>
				<th>Tên</th>
				<th>Ảnh</th>
				<th>Đơn giá</th>
				<th>Số lượng</th>
				<th>Tên nhóm</th>
				<th>Chi tiết</th>
			</tr>
			<% if (rs.eof) then 
					Response.write("<tr><td colspan = 7>Không tồn tại sản phẩm có tên " & str & "</td></tr>")
				else 
				
				while not rs.eof  and rs.absolutepage=p
				%>
				<tr>
					<td><%=rs("pid")%></td>
					<td><%=rs("pname")%></td>
					<td><img src="images/<%=rs("pimage")%>" width=150></td>
					<td><%=rs("pprice")%></td>
					<td><%=rs("pquantity")%></td>
					<td><%=rs("cname")%></td>
					<td><a href="product_detail.asp?pid=<%=rs("pid")%>">Chi tiết</a></td>
				</tr>
			<%
					rs.movenext
				wend 
				end if 
			%>
		</table>
		<center>
			<%
				for i = 1 to pagecount
					if (i=p) then
						response.write(" " & i & " ")
					else 
						response.write(" <a href=?page=" & i & "&txtSearch=" & str & ">" & i & "</a> ")
					end if 
					
				next 
			%>
		</center>
	</body>
</html>
<%
	rs.close
	conn.close 
%>