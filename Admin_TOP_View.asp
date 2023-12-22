<!--#include file="connection.asp"-->

<%
	action =Request("action")
	TopSQ = Request("IDChuDe")
	select case action		
	
	case "add_new"
	adLoai =Request.Form("txtLoai")
		adTenChuDe=Request.Form("txtTenChuDe")
		adAnhPLM=Request.Form("txtAnhPLM")
		adMoTaChuDe=Request.Form("txtMoTaChuDe")
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From ChuDe where TenChuDe='" & adTenChuDe &"'" 
		rs.open sql, conn 

		if (not rs.eof) then
			Session("product_error")="Chủ đề đã tồn tại !"	
		else 
			sql = "insert into ChuDe(TenChuDe,AnhPLM,MoTaChuDe,Loai) values ('" & adTenChuDe & "','" & adAnhPLM & "','" & adMoTaChuDe & "','"&adLoai&"')"
			'Response.write(sql)
			conn.execute sql 
			Session("product_error")="Thêm mới thành công"
			response.redirect("Admin_CD_Search.asp")
		end if
		rs.close 
	
	
	case "delete"
' Kiểm tra xem có bài hát nào thuộc chủ đề có ID là adIDChuDe hay không
sqlCheck = "SELECT COUNT(*) AS BaiHat FROM BaiHat WHERE IDChuDe = " & adIDChuDe
rs.open sqlCheck, conn

' Lấy giá trị đếm
CountBaiHat = rs("BaiHat")

' Đóng recordset
rs.close

' Kiểm tra nếu có bài hát
if CountBaiHat > 0 then
    ' Ghi ra thông báoô
	
   Session("product_error")="Không thể xoá chủ đề vì còn tồn tại thông tin liên quan "
else
    ' Nếu không có bài hát, thực hiện xóa chủ đề
    sqlDelete = "DELETE FROM ChuDe WHERE IDChuDe = " & adIDChuDe
    conn.execute sqlDelete
    response.redirect("Admin_CD_Search.asp")
end if

	case "save_edit"
        adTenChuDe=Request.Form("txtTenChuDe")
		adAnhPLM=Request.Form("txtAnhPLM")
		adMoTaChuDe=Request.Form("txtMoTaChuDe")
		adLoai =Request.Form("txtLoai")
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From ChuDe where  TenChuDe='" & adTenChuDe &"'  and IDChuDe<>" & adIDChuDe
		rs.open sql, conn 
		if (not rs.eof) then
			Session("product_error")="Tên chủ đề : " & adTenChuDe&" đã có rồi!"
				
		else 
			sql = "update ChuDe set TenChuDe='" & adTenChuDe & "',AnhPLM='" & adAnhPLM& "',MoTaChuDe = '" & adMoTaChuDe & "' ,Loai ='" & adLoai & "' where IDChuDe = " & adIDChuDe
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
					<th>Loại</th>
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
								<td><input type=text name=txtAnhPLM value="<%=rs("AnhPLM")%>"></td>
                                <td><input type=text name=txtMoTaChuDe value="<%=rs("MoTaChuDe")%>"></td>
								<td><input type=text name=txtMoTaChuDe value="<%=rs("Loai")%>"></td>
								<td><input type=submit value="Cập nhật"></td>
								<td><input type=button onclick="window.location='Admin_CD_Search.asp';" value="Hủy bỏ"></td>
							</tr>	
						</form>
					<%
					else 
				%>
					<tr>
						<td><%=rs("IDChuDe")%></td>
						<td><%=rs("TenChuDe")%></td>
						<td><%=rs("AnhPLM")%></td>
						<td><%=rs("MoTaChuDe")%></td>
						<td><%=rs("Loai")%></td>
						<td><a href="Admin_CD_View.asp?action=edit&IDChuDe=<%=rs("IDChuDe")%>">Sửa</a></td>
						<td><a onclick="return confirm('Bạn có chắc muốn xoá <%=rs("TenChuDe")%> hay ko?');"  href="Admin_CD_View.asp?action=delete&IDChuDe=<%=rs("IDChuDe")%>">Xóa</a></td>
					</tr>
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
					<td><input style="width:180px" type=text name=txtAnhPLM></td>
				</tr>
				<tr>
					<td>Mô tả chủ đề:</td>
					<td><input type=text  style="width:180px" name=txtMoTaChuDe></td>
				</tr>
				<tr>
					<td>Loại CHủ Đề:</td>
					<td><input type=radio checked name=txtLoai value=Quốc Gia>Quốc Gia
						<input type=radio name=txtLoai value=Ca Sĩ> Ca Sĩ
						<input type=radio name=txtLoai value=Chủ Đề > Chủ Đề
					</td>
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