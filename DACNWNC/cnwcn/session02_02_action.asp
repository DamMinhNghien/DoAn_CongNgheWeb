<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<%
			ketqua = Request.QueryString
			response.write(ketqua)
			HoVaTen = Request.QueryString("txtHoVaTen")
			MatKhau = Request.QueryString("txtMatKhau")
			GioiTinh = Request.QueryString("rdGioiTinh")
			SoThich = Request.QueryString("ckSoThich")
			NgonNgu = Request.QueryString("slNgonNgu")
			Anh = Request.QueryString("fAnh")
			GhiChu = Request.QueryString("taGhiChu")
			Keys = Request.QueryString("cmdKey")
			Response.write("<br>" & HoVaTen)
			Response.write("<br>" & MatKhau)
			Response.write("<br>" & GioiTinh)
			for i=1 to Request.QueryString("ckSoThich").count
				Response.write("<br>" & Request.QueryString("ckSoThich")(i))
			next
			'Response.write("<br>" & SoThich)
			Response.write("<br>" & NgonNgu)
			Response.write("<br>" & Anh)
			Response.write("<br>" & GhiChu)
			Response.write("<br>" & Keys)
			
		%>
	</body>
</html>