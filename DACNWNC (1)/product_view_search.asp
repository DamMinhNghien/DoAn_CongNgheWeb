<!--#include file="connection.asp"-->
<%
	rs.cursorLocation = 3
	rs.pagesize = 2 
	str = Request("txtSearch")
	sql = "select a.*,b.cname from product a, categories b where a.cid = b.cid and pname like '%" & str & "%'"
	rs.open sql, conn 'lấy dữ liệub
	 
	pagecount = rs.pagecount 
	p = CInt(Request("page"))

	' Check if p is within a valid range
	if (p < 1) then
		p = 1
	end if 
	if (p > pagecount) then 
		p = pagecount 
	end if

	' Check if rs is not null and has data
	If Not rs Is Nothing Then
		If Not rs.eof Then
			rs.absolutepage = p 
		End If
	End If
%>
<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h1 align="center">Tìm kiếm sản phẩm</h1>
		<center>
			<form action="product_view_search.asp" method="POST">
				Nhập tên sản phẩm cần tìm:
				<input type="text" size="50" name="txtSearch" value="<%=str%>">
				<input type="submit" name="cmd" value="Tìm kiếm">
			</form>
		</center>
		
		<table align="center" border="1" width="100%">
			<tr>
				<th>Mã</th>
				<th>Tên</th>
				<th>Ảnh</th>
				<th>Đơn giá</th>
				<th>Số lượng</th>
				<th>Tên nhóm</th>
				<th>Chi tiết</th>
			</tr>
			<% 
			If Not rs.eof Then 
				While Not rs.eof And rs.absolutepage = p
			%>
				<tr>
					<td><%=rs("pid")%></td>
					<td><%=rs("pname")%></td>
					<td><img src="images/<%=rs("pimage")%>" width="150"></td>
					<td><%=rs("pprice")%></td>
					<td><%=rs("pquantity")%></td>
					<td><%=rs("cname")%></td>
					<td><a href="product_detail.asp?pid=<%=rs("pid")%>">Chi tiết</a></td>
				</tr>
			<%
				rs.movenext
				Wend
			Else
				Response.write("<tr><td colspan='7'>Không tồn tại sản phẩm có tên " & str & "</td></tr>")
			End If 
			%>
		</table>
		<center>
			<%
				For i = 1 To pagecount
					If i = p Then
						Response.write(" " & i & " ")
					Else 
						Response.write(" <a href=?page=" & i & "&txtSearch=" & Server.URLEncode(str) & ">" & i & "</a> ")
					End If 
				Next 
			%>
		</center>
	</body>
</html>
<%
	rs.close
	conn.close 
%>
