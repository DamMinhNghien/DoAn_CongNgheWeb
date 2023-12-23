<!--#include file="connection.asp"-->

<%
	    action = Request("action")
    adIDTop = Request("IDTop")
    
    Select Case action
        Case "add_new"
            adTenTop = Request.Form("txtTenTop")
            adAnhTOP = Request.Form("txtAnhTop")
            adMotaTop = Request.Form("txtMotaTop")
            adQuocGia = Request.Form("txtQuocGia")
            adTenChuDe = Request.Form("txtTenChuDe")
            adBiDanh = Request.Form("txtBiDanh")
            adTopCategories = Request.Form("txtTopCategories")

            ' Kiểm tra nếu tên danh mục đã tồn tại
            sql = "SELECT * FROM TopBXH WHERE TenTop='" & adTenTop & "'"
            rs.open sql, conn 

            If Not rs.eof Then
                Session("product_error") = "Top đã tồn tại !"
            Else 
                If adTenChuDe <> "" And adBiDanh = "" And adQuocGia = "" Then
                    sql = "INSERT INTO TopBXH(TenTop, AnhTOP, MotaTop, Loai, TopCategories) VALUES (N'" & adTenTop & "', '" & adAnhTOP & "', N'" & adMotaTop & "','IDChuDE',N'" & adTenChuDe & "')"
                    conn.execute sql 
                    Session("product_error") = "Thêm mới thành công"
                    Response.Redirect("Admin_BXH_Search.asp")
                ElseIf adTenChuDe = "" And adBiDanh <> "" And adQuocGia = "" Then
                    sql = "INSERT INTO TopBXH(TenTop, AnhTOP, MotaTop, Loai, TopCategories) VALUES (N'" & adTenTop & "', '" & adAnhTOP & "',N'" & adMotaTop & "','BiDanh',N'" & adBiDanh & "')"
                    conn.execute sql 
                    Session("product_error") = "Thêm mới thành công"
                    Response.Redirect("Admin_BXH_Search.asp")
                ElseIf adTenChuDe = "" And adBiDanh = "" And adQuocGia <> "" Then
                    sql = "INSERT INTO TopBXH(TenTop, AnhTOP, MotaTop, Loai, TopCategories) VALUES (N'" & adTenTop & "', '" & adAnhTOP & "', N'" & adMotaTop & "','QuocGia','" & adQuocGia & "')"
                    conn.execute sql 
                    Session("product_error") = "Thêm mới thành công"
                    Response.Redirect("Admin_BXH_Search.asp")
                ElseIF adTenChuDe <>"" And adBiDanh <> "" And adQuocGia <>"" Then
                    Session("product_error") = "Thêm mới không thành công , chỉ chọn 1 trường dữ liệu! "
                ElseIF adTenChuDe ="" And adBiDanh <> "" And adQuocGia <>"" Then
                    Session("product_error") = "Thêm mới không thành công , chỉ chọn 1 trường dữ liệu! "
                    ElseIF adTenChuDe <>"" And adBiDanh ="" And adQuocGia <>"" Then
                    Session("product_error") = "Thêm mới không thành công , chỉ chọn 1 trường dữ liệu! "
                    ElseIF adTenChuDe <>"" And adBiDanh <> "" And adQuocGia ="" Then
                    Session("product_error") = "Thêm mới không thành công , chỉ chọn 1 trường dữ liệu! "
                End If 
            End If
		rs.close    
	
	case "delete"

    sqlDelete = "DELETE FROM TopBXH WHERE IDTop = '" & adIDTop & "'"
    conn.execute sqlDelete
    response.redirect("Admin_BXH_Search.asp")

	case "save_edit"
		adTenTop = Request.Form("txtTenTop")
		adAnhTOP = Request.Form("txtAnhTOP")
        	adMotaTop= Request.Form("txtMotaTop")
            	adTopCategories = Request.Form("txtTopCategories")

		adLoai = Request.Form("txtLoai")
		' Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql = "SELECT * FROM TopBXH WHERE IDTop <> '" & adIDTop & "'"
		rs.open sql, conn 
		if (not rs.eof) then
			Session("product_error") = "Tên Top: " & adTenTop & " đã có rồi!"	
            response.write "<meta http-equiv='refresh' content='1;url=Admin_BXH_View.asp?action=edit&IDTop=" & adIDTop & "'>"
		else 
			sql = "UPDATE TopBXH SET TenTop=N'" & adTenTop & "', AnhTop = '" & adAnhTOP & "',MotaTop= N'" & adMotaTopP & "',Loai='" & adLoai & "',TopCategories=N'" & adTopCategories & "'  WHERE IDTop = '" & adIDTop & "'"
			conn.execute sql 
			Session("product_error") = "Cập nhật thành công"
			response.redirect("Admin_BXH_Search.asp")
		end if
		rs.close 
	end select 
	
    sql = "SELECT * FROM TopBXH "
	rs.open sql, conn  
%>
<html>
<head>
    <title>Tiêu đề trang web</title>
    <meta charset="utf-8">
    <title>Loại Chủ Đề</title>
  <script>
    function handleRadioChange() {
      // Lấy giá trị của nút radio được chọn
      var selectedValue = document.querySelector('input[name="txtLoai"]:checked').value;

      // Gán giá trị cho biến mới tạo là txtLoaiValue
      var txtLoaiValue = selectedValue;

      // Hiển thị giá trị đã chọn trong Console
      console.log("Đã chọn: " + txtLoaiValue);

      // Bạn có thể sử dụng giá trị txtLoaiValue để thực hiện các xử lý khác tùy thuộc vào nhu cầu của bạn
    }
  </script>
</head>
<body>
    <center><font color=red><%=Session("product_error")%></center>
    <br>
    <center><a href="Admin_BXH_Search.asp">về trang quản lý Top BXH</a></center>
    <br>
    <table border=1 width=100% align=center>
        <tr>
            <th>ID</th>
            <th>Tên Top </th>
            <th>Ảnh </th>
            <th>Mô Tả </th>
            <th>Loại Top </th>
            <th>Top Categories </th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
        <%
        if (rs.eof) then
            response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
        else
            while not rs.eof 
                if ((action="edit") and (rs("IDTop")=cint(adIDTop))) then
                %>
                <form method=POST action="Admin_BXH_View.asp?action=save_edit&IDTop=<%=adIDTop%>">
                    <tr valign=top>
                       <td><%=rs("IDTop")%></td>
                        <td><input type=text name=txtTenTop value="<%=rs("TenTop")%>"></td>
                        <td><input type=file name=txtAnhT value="<%=rs("AnhTOP")%>"></td>
                         <td><input type=text name=txtMotaTop value="<%=rs("MotaTop")%>"></td>
                         	<td>
					<select name=txtLoai>
								
									<option value="QuocGia">QuocGia</option>
                                    <option value="ChuDe">ChuDe</option>
								<option value="BiDanh">BiDanh</option>
								
								
							</select>
				</td>
                          <td><input type=text name=txtTopCategories value="<%=rs("TopCategories")%>"></td>
                        <td><input type=submit value="Cập nhật"></td>
                        <td><input type=button onclick="window.location='Admin_BXH_Search.asp';" value="Hủy bỏ"></td>
                    </tr>   
                </form>
              
                <%
                end if 
                rs.movenext
            wend
            rs.close
            'conn.close 
        end if
        %>
    </table>
    <center><a href="?action=add">Thêm mới Top </a></center>            
    <%
    if (Request("action")="add") then 

    %>
    <h1 align=center>Thêm mới một Top</h1>
    <center><font color=red><%=Session("product_add_error")%></font></center>
    <form method=POST action="Admin_BXH_View.asp">

        <table border=0 align=center width=400>
            
            <tr>
                <td>Tên top </td>
                <td><input style="width:180px" type=text name=txtTenTop></td>
            </tr>
            <tr>
                <td>Ảnh Top:</td>
                <td><input style="width:180px" type=file name=txtAnhTOP></td>
            </tr>
            <tr>
                <td>Mô Tả :</td>
                <td><input type=text  style="width:180px" name=txtMotaTop></td>
            </tr>
            <tr>
					<td>Lựa chọn 1 trong 3 loại top </td>
            <tr>
						<td>Top ca sĩ :</td>
						<td>
                        
                        	
							<select name=txtBiDanh>
                                    <option value="">  </option>
								<%    rs2.open "select * from CaSi",conn
                                 while not rs2.eof 
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
						<td>Top Quốc Gia :</td>
						<td>
                        	
							<select name=txtQuocGia>
                                    <option value="">  </option>
								<%
                                    rs3.open "select QuocGia from BaiHat group by QuocGia",conn
                                     while not rs3.eof 
								%>
									<option value="<%=rs3("QuocGia")%>"><%=rs3("QuocGia")%></option>
								<%
									rs3.movenext
									wend
									rs3.close
									'conn.close
								%>
							</select>
						</td>
					</tr>
             <tr>
						<td>Top Chủ Đề :</td>
						<td>
                        	
							<select name=txtTenChuDe>
                                    <option value="">  </option>
								<%
                                    rs4.open "select * from ChuDe",conn
                                     while not rs4.eof 
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
