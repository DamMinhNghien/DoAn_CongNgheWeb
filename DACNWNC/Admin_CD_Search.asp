  <!--#include file="connectionDA.asp"-->
<%
	rs.cursorLocation = 3
	rs.pagesize = 2 
	str = Request("txtSearch")
	sql = "select * from ChuDe where  TenChuDe like '%" & str & "%'"
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
	<script>
    function reloadPage() {
        // Sử dụng cả hai cách dưới đây đều đúng
        location.reload();
        // hoặc
        // window.location.reload();
    }
</script>
	<head>
		<meta charset="utf-8">
	</head>
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
        #logout {
    background-color: red;
    color: white;
    padding: 10px;
    text-decoration: none;
    font-size: 16px;
    cursor: pointer;
}

#logout:hover {
    background-color: darkred;
}

    </style>
</head>
<body>
    <div class="header">
        <div class="header-logo">Quản Lý Admin</div>
        <a href="#" id="logout" onclick="logout()">Logout</a>
    </div>

    <div id="navbar">
        <a href="Admin_CS_Search.asp" class="nav-link"onclick="openPage('CaSi')">Ca Sĩ</a>
                <a href="Admin_BH_Search.asp" class="nav-link"onclick="openPage('BaiHat')">Bài Hát</a>
         <a href="Admin_CD_Search.asp" class="nav-link" onclick="openPage('ChuDe')" style="background-color: green; color: white;">Chủ đề</a>
        <a href="Admin_TK_Search.asp" class="nav-link" onclick="openPage('TaiKhoan')">Tài Khoản</a>
        <a href="Admin_BXH_Search.asp" class="nav-link"onclick="openPage('BXH')">BXH</a>
        <a href="Admin_AB_Search.asp" class="nav-link" onclick="openPage('PlayListCaNhan')">Album </a>
    </div>
	</br>
	<body>
		<center>
			<form action="Admin_CD_Search.asp" method="POST">
				Nhập tên sản phẩm cần tìm:
				<input type="text" size="50" name="txtSearch" value="<%=str%>">
				<input type="submit" name="cmd" value="Tìm kiếm">
			</form>
		</center>
        <center><a href="Admin_CD_View.asp?action=add">Thêm mới một chủ đề </a></center>
		
		<table align="center" border="1" width="100%">
			<tr>
				<tr>
					<th>Mã chủ đề</th>
					<th>Tên chủ đề </th>
					<th>Ảnh mô tả</th>
					<th>Mô tả chủ đề</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
			</tr>
			<% 
			If Not rs.eof Then 
				While Not rs.eof And rs.absolutepage = p
			%>
				<tr>
					<td><%=rs("IDChuDe")%></td>
						<td><%=rs("TenChuDe")%></td>
						<td><%=rs("AnhPLM")%></td>
						<td><%=rs("MoTaChuDe")%></td>
						<td><a href="Admin_CD_View.asp?action=edit&IDChuDe=<%=rs("IDChuDe")%>">Sửa</a></td>
						<td><a onclick="return confirm('Bạn có chắc muốn xoá <%=rs("TenChuDe")%> hay ko?');"  href="Admin_CD_View.asp?action=delete&IDChuDe=<%=rs("IDChuDe")%>">Xóa</a></td>
				</tr>
			<%
				rs.movenext
				Wend
			Else
				Response.write("<tr><td colspan='7'>Không tồn tại chủ đề có tên " & str & "</td></tr>")
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
