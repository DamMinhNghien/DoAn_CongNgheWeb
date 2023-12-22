<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<%
			ketqua = Request.Form
			'response.write(ketqua)
			HoVaTen = Request.Form("txtHoVaTen")
			MatKhau = Request.Form("txtMatKhau")
			GioiTinh = Request.Form("rdGioiTinh")
			SoThich = Request.Form("ckSoThich")
			NgonNgu = Request.Form("slNgonNgu")
			Anh = Request.Form("fAnh")
			GhiChu = Request.Form("taGhiChu")
			Keys = Request.Form("cmdKey")
			Response.write("<br>" & HoVaTen)
			Response.write("<br>" & MatKhau)
			Response.write("<br>" & GioiTinh)
			for i=1 to Request.Form("ckSoThich").count
				Response.write("<br>" & Request.Form("ckSoThich")(i))
			next
			'Response.write("<br>" & SoThich)
			Response.write("<br>" & NgonNgu)
			Response.write("<br>" & Anh)
			Response.write("<br>" & GhiChu)
			Response.write("<br>" & Keys)
			
		%>
	</body>
</html>