<!--#include file="connectionDA.asp"-->

<%
	action =Request("action")
	adIDPlayList= Request("IDPlayList")
	select case action		
	
	case "add_new"
		adIDBHAB=Request.Form("txtIDBHAB")
		adIDdelete=Request.Form()
		'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
		sql="select * From BaiHatPlayListCN where IDPlayList='" & adIDPlayList & "' and IDBaiHat='" & adIDBHAB & "'" 
		rs.open sql, conn 

		if (not rs.eof) then
			Session("product_error")="Bài Hát đã tồn tại trong album !"	
		else 
			sql = "insert into BaiHatPlayListCN(IDPlayList,IDBaiHat) values ('" & adIDPlayList & "','" & adIDBHAB& "')"
			'Response.write(sql)
			conn.execute sql 
			Session("product_error")="Thêm mới thành công"
			response.redirect("Admin_BHAB_View.asp")
		end if
		rs.close 
	
	
	case "delete"
' Kiểm tra xem có bài hát nào thuộc chủ đề có ID là adIDChuDe hay không

    ' Nếu không có bài hát, thực hiện xóa chủ đề
    sqlDelete = "DELETE FROM BaiHatPlayListCN WHERE IDPlayList =" & adIDPlayList&" and IDBaiHat="&adIDBHAB&"" 
    conn.execute sqlDelete
    response.redirect("Admin_AB_Search.asp")



	end select 
    sql = "SELECT f.*, BaiHatPlayListCN.*, CaSi.*FROM BaiHat f Full JOIN BaiHatPlayListCN ON f.IDBaiHat = BaiHatPlayListCN.IDBaiHat Full JOIN CaSi ON f.BiDanh = CaSi.BiDanh;"
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
			<center><a href="Admin_AB_Search.asp">về trang quản lý Album	</a></center>
		<br>
			<table border=1 width=100% align=center>
				<tr>
					
					<th>Tên bài hát </th>
					<th>Ca sĩ  </th>
                    	<th>Ảnh  </th>
					<th>Sửa</th>
				
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
					if ((action="delete") and (rs("IDPlayList")=cint(adIDPlayList))) then
					%>
						<tr>
                    <td><%=rs("TenBaiHat")%></td>
                        <td><%=rs("BiDanh")%>-<%=rs("TenCaSi")%></td>
                   <td><%=rs("AnhBH")%></td>
                    <td><a onclick="return confirm('Bạn có chắc muốn xoá  hay ko?');"  href="Admin_AB_View.asp?action=delete&IDBaiHat=<%=rs("IDBaiHat")%>">Xóa</a></td>
                     
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
			<center><a href="?action=add">Thêm mới Bài hát vào album</a></center>			
			<%
				if (Request("action")="add") then 
				rs4.open "select * from BaiHat inner join CaSi on BaiHat.BiDanh=CaSi.BiDanh", conn
				
			%>
			<h1 align=center>Thêm mới Bài hát vào album </h1>
		<center><font color=red><%=Session("product_add_error")%></font></center>
		<form method=POST action="Admin_AB_View.asp">
			<table border=0 align=center width=400>
				
				<tr>
						<td>Tên Album:</td>
						<td>
							<select name=txtIDBHAB>
								<% while not rs4.eof 
								%>
									<option value="<%=rs4("IDBaiHat")%>"><%=rs4("TenBaiHat")%>-<%=rs4("TenCaSi")%>-<%=rs4("BiDanh")%></option>
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
