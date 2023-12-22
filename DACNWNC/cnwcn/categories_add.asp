<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Thêm mới nhóm sản phẩm</h1>
		<center>
			<font color=red>
				<%=Session("categories_add_error")%>
			</font>
		</center>
		<form action="categories_add_action.asp" method=POST>
		<table border=0 cellspacing=5 cellpadding=5 align=center>
			<tr>
				<td>Tên nhóm:</td>
				<td><input type=text name=txtCname></td>
			</tr>
			<tr>
				<td>Mô tả:</td>
				<td><textarea cols=20 rows=6 name=taCdesc></textarea></td>
			</tr>
			<tr>
				<td>Ảnh:</td>
				<td><input type=text name=txtCimage></td>
			</tr>
			<tr>
				<td>Thứ tự sắp xếp:</td>
				<td><input type=text name=txtCorder></td>
			</tr>
			<tr>
				<td>Trạng thái:</td>
				<td>
					<input type=radio name=rdCstatus value=1 checked>Hoạt động
					<Input type=radio name=rdCstatus value=0>Ngừng hoạt động
				</td>
			</tr>
			<tr>
				<td align=right><input type=submit value="Gửi đi">
				</td>
				<td><input type=reset value="Hủy bỏ"></td>
			</tr>
		</table>
		</form>
	</body>
</html>