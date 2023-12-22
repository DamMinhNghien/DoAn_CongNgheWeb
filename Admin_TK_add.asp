<!--#include file="connection.asp"-->


<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Thêm mới một tài khoản</h1>
		<center><font color=red><%=Session("product_add_error")%></font></center>
		<form method=POST action="Admin_TK_Add_Action.asp">
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
					<td align=right><input type=submit value="Thêm mới"></td>
					<td><input type=reset value="Làm lại">
				</tr>
			</table>
		</form>
	</body>
</html>