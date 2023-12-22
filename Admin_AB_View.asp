<!--#include file="connection.asp"-->

<%
	action =Request("action")
	adIDPlayList= Request("IDPlayList")
	select case action		
	
	case "add_new"
		adIDTK=12
		adAnhPL=Request.Form("txtAnhPL")
		adTenPlayList=Request.Form("txtTenPlayList")
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From PlayListCaNhan where TenPlayList='" & adTenPlayList &"'" 
		rs.open sql, conn 

		if (not rs.eof) then
			Session("product_error")="Album đã tồn tại !"	
		else 
			sql = "insert into PlayListCaNhan(IDTK,AnhPL,TenPlayList) values ('" & adIDTK & "','" & adAnhPL& "',N'" & adTenPlayList & "')"
			'Response.write(sql)
			conn.execute sql 
			Session("product_error")="Thêm mới thành công"
			response.redirect("Admin_AB_Search.asp")
		end if
		rs.close 
	
	
	case "delete"
' Kiểm tra xem có bài hát nào thuộc chủ đề có ID là adIDChuDe hay không

    ' Nếu không có bài hát, thực hiện xóa chủ đề
    sqlDelete = "DELETE FROM PlayListCaNhan WHERE IDPlayList = 	" & adIDPlayList
    conn.execute sqlDelete
    response.redirect("Admin_AB_Search.asp")


	case "save_edit"
       
		adAnhPL=Request.Form("txtAnhPL")
		adTenPlayList=Request.Form("txtTenPlayList")
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From PlayListCaNhan where  TenPlayList='" & adTenPlayList &"'  and IDPlayList<>" & adIDPlayList
		rs.open sql, conn 
		if (not rs.eof) then
			Session("product_error")="Album: " & adTenPlayList&" đã có rồi!"
				
		else 
			sql = "update PlayListCaNhan set TenPlayList='" & adTenPlayList & "',AnhPL='" & adAnhPL& "' where IDPlayList = " & adIDPlayList
			'Response.write(sql)
			conn.execute sql 
			Session("product_error")="Cập nhật thành công"
			response.redirect("Admin_AB_Search.asp")
		end if
		rs.close 
	end select 
    sql = "select * from PlayListCaNhan"
	rs.open sql, conn  
%>
<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
	</head>
	<body>
		
	
			<center><font color=red><%=Session("product_error")%></center>
			<br>
			<center><a href="Admin_AB_Search.asp">về trang quản lý Album	</a></center>
		<br>
			<table border=1 width=100% align=center>
				<tr>
					<th>Mã Album</th>
					<th>Tên Album </th>
					<th>Ảnh </th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
					if ((action="edit") and (rs("IDPlayList")=cint(adIDPlayList))) then
					%>
						<form method=POST action="Admin_AB_View.asp?action=save_edit&IDPlayList=<%=adIDPlayList%>">
							<tr valign=top>
								<td><%=rs("IDPlayList")%></td>
								<td><input type=text name=txtTenPlayList value="<%=rs("TenPlayList")%>"></td>
								<td><input type=text name=txtAnhPL value="<%=rs("AnhPL")%>"></td>
								<td><input type=submit value="Cập nhật"></td>
								<td><input type=button onclick="window.location='Admin_AB_Search.asp';" value="Hủy bỏ"></td>
							</tr>	
						</form>
				
				<%
					end if 
					rs.movenext
					wend
					rs.close
					'conn.close 
				%>
				<%
					end if
					%>
			</table>
			<center><a href="?action=add">Thêm mới một Album </a></center>			
			<%
				if (Request("action")="add") then 
			
			%>
			<h1 align=center>Thêm mới một Album </h1>
		<center><font color=red><%=Session("product_add_error")%></font></center>
		<form method=POST action="Admin_AB_View.asp">
			<table border=0 align=center width=400>
				<tr>
					<td>Tên Album:</td>
					<td><input style="width:180px" type=text name=txtTenPlayList></td>
				</tr>
				<tr>
					<td>Ảnh :</td>
					<td><input style="width:180px" type=text name=txtAnhPL></td>
				</tr>
				<tr>
					<td align=right><input type=submit value="Thêm mới"></td>
					<td><input type=reset value="Làm lại">
						<input type=hidden name="action" value="add_new">
				</tr>
			</table>
		</form>

			
			<%
				end if 
				conn.close
				Session("product_error") =""
			%>
	</body>
</html>
