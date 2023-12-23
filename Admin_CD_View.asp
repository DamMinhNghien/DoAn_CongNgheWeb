<!--#include file="connection.asp"-->

<%
	action =Request("action")
	adIDChuDe = Request("IDChuDe")
	select case action		
	
	case "add_new"
		adTenChuDe=Request.Form("txtTenChuDe")
		adAnhPLM=Request.Form("txtAnhPLM")
		adMoTaChuDe=Request.Form("txtMoTaChuDe")
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From ChuDe where TenChuDe='" & adTenChuDe &"'" 
		rs.open sql, conn 

		if (not rs.eof) then
			Session("product_error")="Chủ đề đã tồn tại !"	
			 response.write "<meta http-equiv='refresh' content='2;url=Admin_CD_View.asp?action=add'>"
		else 
			sql = "insert into ChuDe(TenChuDe,AnhPLM,MoTaChuDe) values (N'" & adTenChuDe & "','" & adAnhPLM & "',N'" & adMoTaChuDe & "')"
			'Response.write(sql)
			conn.execute sql 
			Session("product_error")="Thêm mới thành công"
			response.redirect("Admin_CD_Search.asp")
		end if
		rs.close 
	
	
	case "delete"

    ' Nếu không có bài hát, thực hiện xóa chủ đề
    sqlDelete = "DELETE FROM ChuDe WHERE IDChuDe = " & adIDChuDe
    conn.execute sqlDelete
    response.redirect("Admin_CD_Search.asp")


	case "save_edit"
        adTenChuDe=Request.Form("txtTenChuDe")
		adAnhPLM=Request.Form("txtAnhPLM")
		adMoTaChuDe=Request.Form("txtMoTaChuDe")
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From ChuDe where  TenChuDe='" & adTenChuDe &"'  and IDChuDe<>" & adIDChuDe
		rs.open sql, conn 
		if (not rs.eof) then
			Session("product_error")="Tên chủ đề : " & adTenChuDe&" đã có rồi!"
				
		else 
			sql = "update ChuDe set TenChuDe=N'" & adTenChuDe & "',AnhPLM='" & adAnhPLM& "',MoTaChuDe = N'" & adMoTaChuDe & "' where IDChuDe = " & adIDChuDe
			'Response.write(sql)
			conn.execute sql 
			Session("product_error")="Cập nhật thành công"
			response.redirect("Admin_CD_Search.asp")
		end if
		rs.close 
	end select 
    sql = "select * from ChuDe"
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
			<center><a href="Admin_CD_Search.asp">về trang quản lý chủ đề	</a></center>
		<br>
			<table border=1 width=100% align=center>
				<tr>
					<th>Mã chủ đề</th>
					<th>Tên chủ đề </th>
					<th>Ảnh mô tả</th>
					<th>Mô tả chủ đề</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
					if ((action="edit") and (rs("IDChuDe")=cint(adIDChuDe))) then
					%>
						<form method=POST action="Admin_CD_View.asp?action=save_edit&IDChuDe=<%=adIDChuDe%>">
							<tr valign=top>
								<td><%=rs("IDChuDe")%></td>
								<td><input type=text name=txtTenChuDe value="<%=rs("TenChuDe")%>"></td>
								<td><input type=file name=txtAnhPLM value="<%=rs("AnhPLM")%>"></td>
                                <td><input type=text name=txtMoTaChuDe value="<%=rs("MoTaChuDe")%>"></td>
								<td><input type=submit value="Cập nhật"></td>
								<td><input type=button onclick="window.location='Admin_CD_Search.asp';" value="Hủy bỏ"></td>
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
			<center><a href="?action=add">Thêm mới một chủ đề</a></center>			
			<%
				if (Request("action")="add") then 
			
			%>
			<h1 align=center>Thêm mới một chủ đề </h1>
		<center><font color=red><%=Session("product_add_error")%></font></center>
		<form method=POST action="Admin_CD_View.asp">
			<table border=0 align=center width=400>
				<tr>
					<td>Tên chủ đề:</td>
					<td><input style="width:180px" type=text name=txtTenChuDe></td>
				</tr>
				<tr>
					<td>Ảnh :</td>
					<td><input style="width:180px" type=file name=txtAnhPLM></td>
				</tr>
				<tr>
					<td>Mô tả chủ đề:</td>
					<td><input type=text  style="width:180px" name=txtMoTaChuDe></td>
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
