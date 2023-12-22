<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<form name=f action="session02_02_action.asp" method=GET>
			<h1 align=center>Thông tin cá nhân</h1>
			<table border = 0 align=center width=500>
				<tr>
					<td>Họ và tên:</td>
					<td><input type=text name=txtHoVaTen></td>
				</tr>
				<tr>
					<td>Mật khẩu:</td>
					<td><input type=password name=txtMatKhau></td>
				</tr>
				<tr>
					<td>Giới tính:</td>
					<td><input type=radio name=rdGioiTinh value='Nam'>Nam
						<input type=radio checked name=rdGioiTinh value='Nữ'>Nữ
						<input type=radio name=rdGioiTinh value='Khác'>Khá
					</td>
				</tr>
				<tr>
					<td>Sở thích:</td>
					<td>
						<input type=checkbox name=ckSoThich value="Âm nhạc">Âm nhạc
						<input type=checkbox name=ckSoThich value="Thể thao">Thể thao
						<input type=checkbox name=ckSoThich value="Du lịch">Du lịch
						<br>
						<input type=checkbox name=ckSoThich value="Mua sắm">Mua sắm
						<input type=checkbox name=ckSoThich value="Kiếm tiền">Kiếm tiền
						<input type=checkbox name=ckSoThich value="Thiền">Thiền
					</td>
				</tr>
				<tr>
					<td>Ngôn ngữ chính:</td>
					<td>
						<select name=slNgonNgu>
							<option value="">Lựa chọn ngôn ngữ</option>
							<option value="vn">Tiếng việt</option>
							<option value="uk">Tiếng anh</option>
							<option selected value="cn">Tiếng tàu</option>
							<option value="other">Không rõ</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Ảnh:</td>
					<td><input type=file name=fAnh></td>
				</tr>
				<tr>
					<td valign=top>Ghi chú:</td>
					<td>
						<textarea name=taGhiChu cols=30 rows=5></textarea>
					</td>
				</tr>
				<tr>
					<td align=right><input type=submit name=cmdGuiDi value="Gửi đi"></td>
					<td><input type=reset value="Làm lại">
						<input type=hidden name=cmdKey value="3323535335325">
					</td>
					
				</tr>
			</table>
		</form>
	</body>
</html>