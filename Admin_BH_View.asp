	<!--#include file="connection.asp"-->
	

	<%
		action =Request("action")
		adIDBaiHat = Request("IDBaiHat")
		select case action		
		
		case "add_new"
			adTenBaiHat=Request.Form("txtTenBaiHat")
			adTacGia=Request.Form("txtTacGia")
			adMoTa=Request.Form("txtMoTa")
			adNgayPhatHanh=Request.Form("txtNgayPhatHanh")
			adAnhBH=Request.Form("txtAnhBH")
			adIDChuDe=Request.Form("txtIDChuDe")
			adQuocGia=Request.Form("txtQuocGia")
			adDuongDan=Request.Form("txtDuongDan")
			
			adBiDanh=Request.Form("txtBiDanh")
	

			'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
			sql="select * From  BaiHat where TenBaiHat='" & adTenBaiHat &"' and BiDanh='" & adBiDanh&"'"
			rs.open sql, conn 

			if (not rs.eof) then
				Session("product_error")="Bài Hát  đã tồn tại !"
				 response.write "<meta http-equiv='refresh' content='2;url=Admin_BH_View.asp?action=add'>"	
			else 
				sql = "insert into BaiHat(TenBaiHat,TacGia,MoTa,NgayPhatHanh,AnhBH,IDChuDe,QuocGia,DuongDan,BiDanh)values (N'" & adTenBaiHat & "',N'" & adTacGia & "',N'" & adMoTa & "','" & adNgayPhatHanh& "','" & adAnhBH & "'," & adIDChuDe& ",'" & adQuocGia & "','" & adDuongDan & "',N'" & adBiDanh & "')"
				
				conn.execute sql 
				Session("product_error")="Thêm mới thành công"

			end if
			rs.close 
		
		
		case "delete"
		sql10Delete="DELETE FROM LichSu WHERE IDBaiHat = " & adIDbaiHat
			sql11Delete="DELETE FROM BaiHatPlayListCN WHERE IDBaiHat = " & adIDbaiHat 
				sql12Delete="DELETE FROM DanhGia WHERE IDBaiHat = " & adIDbaiHat
					sql13Delete="DELETE FROM BinhLuan WHERE IDBaiHat = " & adIDbaiHat
						sql14Delete="DELETE FROM ThongKeLike WHERE IDBaiHat = " & adIDbaiHat
		sqlDelete = "DELETE FROM BaiHat WHERE IDBaiHat = " & adIDbaiHat
		conn.execute sql10Delete
		conn.execute sql11Delete
		conn.execute sql12Delete
			conn.execute sql14Delete
		conn.execute sql13Delete
	
		conn.execute sqlDelete
		case "save_edit"
			adTenBaiHat=Request.Form("txtTenBaiHat")
			adTacGia=Request.Form("txtTacGia")
			adMoTa=Request.Form("txtMoTa")
			adNgayPhatHanh=Request.Form("txtNgayPhatHanh")
			adAnhBH=Request.Form("txtAnhBH")
			adIDChuDe=Request.Form("txtIDChuDe")
			adQuocGia=Request.Form("txtQuocGia")
			adDuongDan=Request.Form("txtDuongDan")
			
			adBiDanh=Request.Form("txtBiDanh")
		
			'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
			sql="select * From BaiHat where TenBaiHat='" & adTenBaiHat & "' and BiDanh='" & adBiDanh & "'"

			rs.open sql, conn 
			
					
		
				sql = "update BaiHat set TenBaiHat=N'" & adTenBaiHat & "',TacGia=N'" & adTacGia& "',MoTa = N'" & adMoTa & "',NgayPhatHanh = '" & adNgayPhatHanh & "',AnhBH = '" & adAnhBH & "',IDChuDe = " & adIDChuDe & ",QuocGia = '" & adQuocGia & "',DuongDan = '" & adDuongDan & "',BiDanh = '" & adBiDanh & "' where IDBaiHat = " & adIDBaiHat
							'Response.write(sql)
				conn.execute sql 
				Session("product_error")="Cập nhật thành công"
				response.redirect("Admin_BH_Search.asp")
			
			rs.close 
		end select 
		sql = "select * from BaiHat"
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
				<center><a href="Admin_BH_Search.asp">về trang quản lý bài hát</a></center>
			<br>
				<table border=1 width=100% align=center>
					<tr>
						<th>ID bài hát </th>
						<th>Tên bài hát  </th>
						<th>Tên tác giả  </th>
						<th>Mô tả </th>
						<th>Ngày phát hành</th>

						<th>Ảnh bài hát </th>
						<th>ID chủ đề  </th>
						<th>Quốc gia </th>
						<th>Đường dẫn</th>

					
						<th>Bí Danh       </th>
						
						<th>Sửa</th>
						<th>Xóa</th>
					</tr>
					<%
					if (rs.eof) then
						response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
					else
						while not rs.eof 
						if ((action="edit") and (rs("IDBaiHat")=cint(adIDBaiHat))) then
						
					
						%>
							<form method=POST action="Admin_BH_View.asp?action=save_edit&IDBaiHat=<%=adIDBaiHat%>">
								<tr valign=top>
									<td><%=rs("IDBaiHat")%></td>
									<td><input type=text name=txtTenBaiHat value="<%=rs("TenBaiHat")%>"></td>
									<td><input type=text name=txtTacGia value="<%=rs("TacGia")%>"></td>
									<td><input type=text name=txtMoTa value="<%=rs("MoTa")%>"></td>
									<td><input type=text name=txtNgayPhatHanh value="<%=rs("NgayPhatHanh")%>"></td>
									<td><input type=file name=txtAnhBH value="<%=rs("AnhBH")%>"></td>
									<td>
										<select name=txtIDChuDe>
											<% 
												rs2.open "select * from ChuDe", conn 
											while not rs2.eof 
											%>
												<option value="<%=rs2("IDChuDe")%>"
												<% if rs2("IDChuDe")=rs("IDChuDe") then	
													response.write(" selected ")
													end if 
												%>
												><%=rs2("TenChuDe")%></option>
											<%
												rs2.movenext
												wend
												rs2.close
												
											%>
										</select>
									</td>
									<td><input type=text name=txtQuocGia value="<%=rs("QuocGia")%>"></td>
									<td>
  <input type="text" name="txtDuongDan" value="<%=rs("DuongDan")%>"  title="<%=rs("DuongDan")%>">
</td>

									<td>
							<select name=txtBiDanh>
								<%
								rs3.open "select * from CaSi", conn  
								while not rs3.eof 
								%>
									<option value="<%=rs3("BiDanh")%>"><%=rs3("BiDanh")%>-<%=rs3("TenCaSi")%></option>
								<%
									rs3.movenext
									wend
									rs3.close
									'conn.close
								%>
							</select>
						</td>
									<td><input type=submit value="Cập nhật"></td>
									<td><input type=button onclick="window.location='Admin_BH_Search.asp';" value="Hủy bỏ"></td>
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
				<center><a href="?action=add">Thêm mới một bài hát  </a></center>			
				<%
				
					if (Request("action")="add") then 
					rs4.open "select * from ChuDe", conn 
					rs2.open "select * from CaSi",conn
				
				%>
				<h1 align=center>Thêm mới một bài hát </h1>
			<center><font color=red><%=Session("product_add_error")%></font></center>
			<form method=POST action="Admin_BH_View.asp">
				<table border=0 align=center width=400>zz
					<tr>
						<td>Tên Bài Hát</td>
						<td><input style="width:180px" type=text name=txtTenBaiHat></td>
					</tr>   
					<tr>
						<td>Tác Giả:</td>
						<td><input style="width:180px" type=text name=txtTacGia></td>
					</tr>
					<tr>
						<td>Mô tả:</td>
						<td><input type=text  style="width:180px" name=txtMoTa></td>
					</tr>
					<tr>
						<td>Ngày Phát Hành:</td>
						<td><input type=text  style="width:180px" name=txtNgayPhatHanh></td>
					</tr>
					<tr>
						<td>Ảnh bài hát :</td>
						<td><input type=file  style="width:180px" name=txtAnhBH></td>
					</tr>
					<tr>
						<td>Chủ đề:</td>
						<td>
							<select name=txtIDChuDe>
								<% while not rs4.eof 
								%>
									<option value="<%=rs4("IDChuDe")%>"><%=rs4("TenChuDe")%></option>
								<%
									rs4.movenext
									wend
									rs4.close
									'conn.close
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>Quốc gia :</td>
						<td>
						  <select style="width: 180px" name="txtQuocGia" id="txtQuocGia"></select>
						  </td>
					</tr>

					<tr>
						<td>ĐườnG dẫn :</td>
						<td><input type=text  style="width:180px" name=txtDuongDan></td>
					</tr>
					
					<tr>
						<td>Bí Danh:</td>
						<td>
							<select name=txtBiDanh>
								<% while not rs2.eof 
								%>
									<option value="<%=rs2("BiDanh")%>"><%=rs2("BiDanh")%>-<%=rs2("TenCaSi")%></option>
								<%
									rs2.movenext
									wend
									rs2.close
									'conn.close
								%>
							</select>
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
									<script>
    // Danh sách tất cả các quốc gia
    var countries = [
  "Afghanistan",
  "Albania",
  "Algeria",  
  "Andorra",
  "Angola",
  "Antigua and Barbuda",
  "Argentina",
  "Armenia",
  "Australia",
  "Austria",
  "Azerbaijan",
  "Bahamas",
  "Bahrain",
  "Bangladesh",
  "Barbados",
  "Belarus",
  "Belgium",
  "Belize",
  "Benin",
  "Bhutan",
  "Bolivia",
  "Bosnia and Herzegovina",
  "Botswana",
  "Brazil",
  "Brunei",
  "Bulgaria",
  "Burkina Faso",
  "Burundi",
  "Cabo Verde",
  "Cambodia",
  "Cameroon",
  "Canada",
  "Central African Republic",
  "Chad",
  "Chile",
  "China",
  "Colombia",
  "Comoros",
  "Congo",
  "Costa Rica",
  "Côte d'Ivoire",
  "Croatia",
  "Cuba",
  "Cyprus",
  "Czech Republic",
  "Democratic Republic of the Congo", 
  "Denmark",
  "Djibouti",
  "Dominica",
  "Dominican Republic",
  "East Timor",  
  "Ecuador",
  "Egypt",
  "El Salvador",
  "Equatorial Guinea",
  "Eritrea",
  "Estonia",
  "Eswatini",
  "Ethiopia",
  "Fiji",
  "Finland",
  "France",
  "Gabon",
  "Gambia",
  "Georgia",
  "Germany",
  "Ghana",
  "Greece",
  "Grenada",
  "Guatemala",
  "Guinea",
  "Guinea-Bissau",
  "Guyana",
  "Haiti",
  "Holy See",
  "Honduras",  
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran",
  "Iraq",
  "Ireland",
  "Israel",
  "Italy",
  "Jamaica",
  "Japan",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "Kiribati",
  "North Korea",
  "South Korea",
  "Kosovo",
  "Kuwait",
  "Kyrgyzstan",
  "Laos",
  "Latvia",
  "Lebanon",
  "Lesotho",
  "Liberia",
  "Libya",
  "Liechtenstein",
  "Lithuania",
  "Luxembourg",
  "Madagascar",
  "Malawi",
  "Malaysia",
  "Maldives",
  "Mali",
  "Malta",
  "Marshall Islands",
  "Mauritania", 
  "Mauritius",
  "Mexico",
  "Micronesia",
  "Moldova",
  "Monaco",
  "Mongolia",
  "Montenegro",
  "Morocco",
  "Mozambique",
  "Myanmar", 
  "Namibia",
  "Nauru",
  "Nepal",
  "Netherlands",
  "New Zealand",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "North Macedonia",
  "Norway",
  "Oman",
  "Pakistan",
  "Palau",
  "Panama",
  "Papua New Guinea",
  "Paraguay",
  "Peru",
  "Philippines",
  "Poland",
  "Portugal",
  "Qatar",
  "Romania",
  "Russia",
  "Rwanda",
  "Saint Kitts and Nevis",
  "Saint Lucia",
  "Saint Vincent and the Grenadines",
  "Samoa",
  "San Marino",
  "Sao Tome and Principe",
  "Saudi Arabia",
  "Senegal",
  "Serbia",
  "Seychelles",
  "Sierra Leone",
  "Singapore",
  "Slovakia",
  "Slovenia",
  "Solomon Islands",
  "Somalia",
  "South Africa",
  "South Sudan",
  "Spain",
  "Sri Lanka",
  "Sudan",
  "Suriname",
  "Sweden",
  "Switzerland",
  "Syria",
  "Tajikistan",
  "Tanzania",
  "Thailand", 
  "East Timor",
  "Togo",
  "Tonga",
  "Trinidad and Tobago",
  "Tunisia",
  "Turkey",
  "Turkmenistan",
  "Tuvalu",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Kingdom",
  "United States of America",
  "Uruguay",
  "Uzbekistan",
  "Vanuatu",
  "Venezuela", 
  "Vietnam",
  "Yemen",
  "Zambia",
  "Zimbabwe"
];
    
    var selectQuocGia = document.getElementById("txtQuocGia");

  
    for (var i = 0; i < countries.length; i++) {
        var option = document.createElement("option");
        option.value = countries[i];
        option.text = countries[i];
        selectQuocGia.add(option);
    }
</script>
		</body>
	</html>
