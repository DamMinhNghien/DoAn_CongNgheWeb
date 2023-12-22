<!--#include file="connection.asp"-->
<%
	rs.cursorLocation = 3
	rs.pagesize = 2 
	str = Request("txtSearch")
	sql = "select * from TaiKhoan where TenTK like '%" & str & "%'"
	rs.open sql, conn 'lấy dữ liệu
	 
	pagecount = rs.pagecount 
	p = CInt(Request("page"))

	' Check if p is within a valid range
	if (p < 1) then
		p = 1
	end if 
	if (p > pagecount) then 
		p = pagecount 
	end if

	' Check if rs is not null and has data
	If Not rs Is Nothing Then
		If Not rs.eof Then
			rs.absolutepage = p 
		End If
	End If
%>
<html>
	<head>
		<meta charset="utf-8">
	</head>

	<body>

		    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: relative;
        }

        #logout {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #333;
            color: white;
            padding: 10px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
        }

        #navbar {
            background-color: #333;
            overflow: hidden;
            text-align: center;
        }

            #navbar a {
                display: inline-block;
                color: white;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
                transition: background-color 0.3s;
            }

                #navbar a:hover {
                    background-color: #ddd;
                    color: black;
                }

                #navbar a.active {
                    background-color: red;
                    color: white;
                }

        #content {
            padding: 20px;
        }

        .header-logo {
            background-color: #333;
            text-align: center;
            color: green;
            font-weight: 700;
            font-size: 24px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-logo">Quản Lý Admin</div>
          <a href="login.asp" id="logout" onclick="logout()">Logout</a>
    </div>

    <div id="navbar">
        <a href="Admin_CS_Search.asp" class="nav-link" onclick="openPage('CaSi')">Ca Sĩ</a>
      <a href="Admin_BH_Search.asp" class="nav-link"onclick="openPage('BaiHat')">Bài Hát</a>
        <a href="Admin_CD_Search.asp" class="nav-link" onclick="openPage('ChuDe')">Chủ Đề</a>
		<a href="Admin_TK_Search.asp" class="nav-link" onclick="openPage('CaSi')" style="background-color: green; color: white;">Tài Khoản </a>
          <a href="Admin_BXH_Search.asp" class="nav-link"onclick="openPage('BXH')">BXH</a>
		<a href="Admin_AB_Search.asp" class="nav-link" onclick="openPage('PlayListCaNhan')">Album </a>
    </div>
	</br>
		<center>
			<form action="Admin_TK_Search.asp" method="POST">
				Nhập tên sản phẩm cần tìm:
				<input type="text" size="50" name="txtSearch" value="<%=str%>">
				<input type="submit" name="cmd" value="Tìm kiếm">
			</form>
		</center>
        <center><a href="Admin_TK_View.asp?action=add">Thêm mới một Tài khoản </a></center>
		
		<table align="center" border="1" width="100%">
			<tr>
				<th>Mã tài khoản </th>
					<th>Tên tài khoản </th>
					<th>Mật khẩu</th>
					<th>Ảnh </th>
					
					<th>Ngày lập</th>
					<th>Trạng thái</th>
					<th>Loại tài khoản </th>
                    <th>Số Điện Thoại </th>
					<th>Sửa</th>
					<th>Xóa</th>
			</tr>
			<% 
			If Not rs.eof Then 
				While Not rs.eof And rs.absolutepage = p
			%>
				<tr>
					<td><%=rs("IDTK")%></td>
						<td><%=rs("TenTK")%></td>
						<td><%=rs("MatKhau")%></td>
						<td><%=rs("Anh")%></td>
						<td><%=rs("NgayLap")%></td>
						<td><%
								if (rs("TrangThai")=1) then
									response.write("Hoạt động")
								else 
									response.write("Ngừng hoạt động")
								end if 
						%></td>
						<td><%=rs("LoaiTK")%></td>
						<td><%=rs("SDT")%></td>
						<td><a href="Admin_TK_View.asp?action=edit&IDTK=<%=rs("IDTK")%>">Sửa</a></td>
						<td><a onclick="return confirm('Bạn có chắc muốn xoá <%=rs("TenTK")%> hay ko?');"  href="Admin_TK_View.asp?action=delete&IDTK=<%=rs("IDTK")%>">Xóa</a></td>
						
				</tr>
			<%
				rs.movenext
				Wend
			Else
				Response.write("<tr><td colspan='7'>Không tồn tại sản phẩm có tên " & str & "</td></tr>")
			End If 
			%>
		</table>
		<center>
			<%
				For i = 1 To pagecount
					If i = p Then
						Response.write(" " & i & " ")
					Else 
						Response.write(" <a href=?page=" & i & "&txtSearch=" & Server.URLEncode(str) & ">" & i & "</a> ")
					End If 
				Next 
			%>
		</center>
        
	</body>
</html>
<%
	rs.close
	conn.close 
%>