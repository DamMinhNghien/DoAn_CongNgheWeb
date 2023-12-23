<!--#include file="connection.asp"-->

<%
	action =Request("action")
	adIDTK = Request("IDTK")
	select case action		
	
	case "add_new"
		adTenTK=Request.Form("txtTenTK")
		adMatKhau=Request.Form("txtMatKhau")
		adAnh =request.Form("txtAnh")
		adNgayLap=Request.Form("txtNgayLap")

		adTrangThai=Request.Form("txtTrangThai")
		adLoaiTK= Request.Form("txtLoaiTK")
		adSDT = Request.Form("txtSDT")
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From TaiKhoan where TenTK='" & adTenTK &"'or SDT='" & adSDT &"'" 
		rs.open sql, conn 

		if (not rs.eof) then
			
	
	Session("product_error")="Tài khoản hoặc số điện thoại đã tồn tại !"
	response.write "<meta http-equiv='refresh' content='1;url=Admin_TK_View.asp?action=add'>"

		else 
			sql = "insert into TaiKhoan(TenTK,MatKhau,anh,NgayLap,TrangThai,LoaiTK,SDT) values (N'" & adTenTK & "',N'" & adMatKhau & "','" & adAnh& "','" & adNgayLap & "'," & adTrangThai & ",N'" & adLoaiTK & "','" &adSDT & "')"
			'Response.write(sql)
			conn.execute sql 
			Session("product_error")="Thêm mới thành công"
			response.redirect("Admin_TK_Search.asp")
		end if
		rs.close 
	
	
	case "delete"
		sql16 = "DELETE FROM ThongKeLike WHERE IDBinhLuan IN (SELECT IDBinhLuan FROM BinhLuan WHERE IDTK = " & adIDTK & ")"
sql17="delete from ThongKeLike where IDTK = " & adIDTK
sql12="delete from LichSu where IDTK = " & adIDTK
            sql11="delete from PlayListCaNhan where IDTK = " & adIDTK
        sql18 = "DELETE FROM BaiHatPlayListCN WHERE IDPlayList IN (SELECT IDPlayList FROM PlayListCaNhan WHERE IDTK = " & adIDTK & ")"
        sql13="delete from DanhGia where IDTK = " & adIDTK
        
    sql="delete from TaiKhoan where IDTK = " & adIDTK    
        sql14="delete from BinhLuan where IDTK = " & adIDTK
    
        conn.execute sql18
        conn.execute sql12
        conn.execute sql11
        
        conn.execute sql13
        conn.execute sql16
    
        conn.execute sql17
        conn.execute sql14
        conn.execute sql
		response.redirect("Admin_TK_Search.asp")
	case "save_edit"
        adTenTK=Request.Form("txtTenTK")
		adMatKhau=Request.Form("txtMatKhau")
		adAnh=Request.Form("txtAnh")
		adTrangThai=Request.Form("txtTrangThai")
		adSDT = Request.Form("txtSDT")
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From TaiKhoan where  	TenTK='" & adTenTK &"'  and IDTK<>" & adIDTK
		rs.open sql, conn 
		if (not rs.eof) then
			Session("product_error")="Tên tài khoản: " & adTenTK &" đã có rồi!"
				
		else 
			sql = "update TaiKhoan  set TenTK='" & adTenTK & "',MatKhau='" & adMatKhau& "',Anh='" & adAnh& "',TrangThai = '" & adTrangThai & "',SDT = '" & adSDT & "' where IDTK = " & adIDTK
			'Response.write(sql)
			conn.execute sql 
			Session("product_error")="Cập nhật thành công"
			response.redirect("Admin_TK_Search.asp")
		end if
		rs.close 
	end select 
    sql = "select * from TaiKhoan "
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
			<center><a href="Admin_TK_Search.asp">về trang quản lý tài khoản	</a></center>
		<br>
			<table border=1 width=100% align=center>
				<tr>
					<th>Mã tài khoản </th>
					<th>Tên tài khoản </th>
					<th>Mật khẩu</th>
					<th>Ảnh</th>
					<th>Ngày lập</th>
					<th>Trạng thái</th>
					<th>Loại tài khoản </th>
                    <th>Số Điện Thoại </th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
					if ((action="edit") and (rs("IDTK")=cint(adIDTK))) then
					%>
						<form method=POST action="Admin_TK_View.asp?action=save_edit&IDTK=<%=adIDTK%>">
							<tr valign=top>
								<td><%=rs("IDTK")%></td>
								<td><input type=text name=txt  TenTK value="<%=rs("TenTK")%>"></td>
								<td><input type=text name=txtMatKhau value="<%=rs("MatKhau")%>"></td>
								<td><input type=file name=txtAnh value="<%=rs("Anh")%>"></td>
								<td><%=rs("NgayLap")%></td>
								<td>
									<input type=radio
										<% if (rs("TrangThai")=1) then 
											response.write("checked")
											end if 
										%>
									name=txtTrangThai value=1>Hoạt động
										<br>
										<input type=radio
										<% if (rs("TrangThai")=0) then 
											response.write(" checked ")
											end if 
										%>
										name=txtTrangThai value=0>Ngừng Hoạt động
									
								</td>
								<td><%=rs("LoaiTK")%></td>
                                <td><input type=text name=txtSDT value="<%=rs("SDT")%>"></td>
								
								
								<td><input type=submit value="Cập nhật"></td>
								<td><input type=button onclick="window.location='Admin_TK_Search.asp';" value="Hủy bỏ"></td>
							</tr>	
						</form>
					<%
					else 
				%>
					
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
			<center><a href="?action=add">Thêm mới một tài khoản</a></center>			
			<%
				if (Request("action")="add") then 
			
			%>
			<h1 align=center>Thêm mới một tài khoản</h1>
		<center><font color=red><%=Session("product_add_error")%></font></center>
		<form method=POST action="Admin_TK_View.asp">
			<table border=0 align=center width=400>
				<tr>
					<td>Tên tài khoản:</td>
					<td><input style="width:180px" type=text name=txtTenTk></td>
				</tr>
				<tr>
					<td>Mật khẩu:</td>
					<td><input style="width:180px" type=text name=txtMatKhau></td>
				</tr>
				<tr>
					<td>Ảnh:</td>
					<td><input style="width:180px" type=file name=txtAnh></td>
				</tr>
				<tr>
					<td>Ngày lập:</td>
					<td><input type=text  style="width:180px" name=txtNgayLap></td>
				</tr>
				
				<tr>
					<td>Trạng thái:</td>
					<td><input type=radio checked name=txtTrangThai value=1>Hoạt động
						<input type=radio name=txtTrangThai value=0>Ngừng Hoạt động
					</td>
				</tr>
                <tr>
					<td>Loại tài khoản:</td>
					<td><input type=text style="width:180px" name=txtLoaiTK></td>
				</tr>
				<tr>
					<td>Số điện thoại:</td>
					<td><input type=text style="width:180px" name=txtSDT></td>
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
