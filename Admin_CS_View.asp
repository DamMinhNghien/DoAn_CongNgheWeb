<!--#include file="connection.asp"-->

<%
	action = Request("action")
	adBiDanh = Request("BiDanh")
	select case action		
	
	case "add_new"
		adBiDanh = Request.Form("txtBiDanh")
		adTenCaSi = Request.Form("txtTenCaSi")
		adAnhCS = Request.Form("txtAnhCS")
		
		' Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql = "SELECT * FROM CaSi WHERE BiDanh='" & adBiDanh & "'"
		rs.open sql, conn 

		if (not rs.eof) then
			Session("product_error") = "Ca Sĩ đã tồn tại !"	
            response.write "<meta http-equiv='refresh' content='2;url=Admin_CS_View.asp?action=add'>"
		else 
			sql = "INSERT INTO CaSi(BiDanh, TenCaSi, AnhCS) VALUES ('" & adBiDanh & "', N'" & adTenCaSi & "', '" & adAnhCS & "')"
			conn.execute sql 
			Session("product_error") = "Thêm mới thành công"
			response.redirect("Admin_CS_Search.asp")
		end if
		rs.close 
	
	case "delete"

    sqlDelete = "DELETE FROM CaSi WHERE BiDanh = '" & adBiDanh & "'"
    conn.execute sqlDelete
    response.redirect("Admin_CS_Search.asp")

	
	case "save_edit"
		adBiDanh1 = Request.Form("txtBiDanh")
		adTenCaSi = Request.Form("txtTenCaSi")
		adAnhCS = Request.Form("txtAnhCS")
		
		' Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql = "SELECT * FROM CaSi WHERE BiDanh ='" & adBiDanh1 & "' "
		rs.open sql, conn 
		if (not rs.eof)then
			Session("product_error") = "Tên ca sĩ: " & adTenCaSi & " đã có rồi!"	
         
		else 
			sql = "UPDATE CaSi SET  TenCaSi=N'" & adTenCaSi & "', AnhCS = '" & adAnhCS & "' WHERE BiDanh = '" & adBiDanh & "'"
			conn.execute sql 
			Session("product_error") = "Cập nhật thành công"
			response.redirect("Admin_CS_Search.asp")
		end if
		rs.close 
	end select 
	
    sql = "SELECT * FROM CaSi "
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
    <center><a href="Admin_CS_Search.asp">về trang quản lý ca sĩ</a></center>
    <br>
    <table border=1 width=100% align=center>
        <tr>
            <th>Bí Danh</th>
            <th>Tên Ca Sĩ </th>
            <th>Ảnh ca sĩ</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
        <%
        if (rs.eof) then
            response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
        else
            while not rs.eof 
                if ((action="edit") and (rs("BiDanh")=adBiDanh)) then
                %>
                <form method=POST action="Admin_CS_View.asp?action=save_edit&BiDanh=<%=adBiDanh%>">
                    <tr valign=top>
                        <td><%=rs("BiDanh")%></td>
                        <td><input type=text name=txtTenCaSi value="<%=rs("TenCaSi")%>"></td>
                        <td><input type=file name=txtAnhCS value="<%=rs("AnhCS")%>"></td>
                        <td><input type=submit value="Cập nhật"></td>
                        <td><input type=button onclick="window.location='Admin_CS_Search.asp';" value="Hủy bỏ"></td>
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
    <center><a href="?action=add">Thêm mới một tài khoản</a></center>            
    <%
    if (Request("action")="add") then 
    %>
    <h1 align=center>Thêm mới một Ca Sĩ</h1>
    <center><font color=red><%=Session("product_add_error")%></font></center>
    <form method=POST action="Admin_CS_View.asp">
        <table border=0 align=center width=400>
            <tr>
                <td>Bí Danh</td>
                <td><input style="width:180px" type=text name=txtBiDanh></td>
            </tr>
            <tr>
                <td>Tên Ca Sĩ:</td>
                <td><input style="width:180px" type=text name=txtTenCaSi></td>
            </tr>
            <tr>
                <td>Ảnh Ca Sĩ :</td>
                <td><input type=file style="width:180px" name=txtAnhCS></td>
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
