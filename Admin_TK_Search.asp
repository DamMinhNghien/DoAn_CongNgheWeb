<!--#include file="connection.asp"-->
<%
	rs.cursorLocation = 3
	rs.pagesize = 2 
	str  = Request.Querystring("search-box")
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
		 <style type="text/css">
		
	.frmSearch {
    border: 1px solid #a8d4b1;
    background-color: #c6f7d0;
    margin: 10px 0;
    padding: 20px;
    border-radius: 4px;
}

/* Định nghĩa lớp country-list */
#country-list {
    float: left;
    list-style: none;
    margin-top: -3px;
    padding: 0;
    width: 190px;
    position: absolute;
}

/* Định nghĩa lớp cho mỗi item trong country-list */
#country-list li {
    padding: 10px;
    background: #f0f0f0;
    border-bottom: #bbb9b9 1px solid;
    text-align: center; /* Can giữa nội dung */
    line-height: 20px; /* Đảm bảo nội dung giữa các chiều cao */
}


/* Hiệu ứng khi di chuột qua mỗi item trong country-list */
#country-list li:hover {
    background: #ece3d2;
    cursor: pointer;
}

/* Định nghĩa lớp search-box */
#search-box {
    padding: 10px;
    border: 1px solid #a8d4b1;
    border-radius: 4px;
}
		</style>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
		<script>
		$(document).ready(function(){
			$("#search-box").keyup(function(){
				$.ajax({
				type: "GET",
				url: "seggustionTK.asp",
				data:'keyword='+$(this).val(),
				beforeSend: function(){
					$("#search-box").css("background","#FFF url(LoaderIcon.gif) no-repeat 165px");
				},
				success: function(data){
					$("#suggesstion-box").show();
					$("#suggesstion-box").html(data);

				}
				});
			});
		});
		
		function selectCountry(val) {
		$("#search-box").val(val);
		$("#suggesstion-box").hide();
		}
		
		</script>
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
        <a href="#" id="logout" onclick="logout()" style="background-color: red; color: white; padding: 10px; text-decoration: none; font-size: 16px; cursor: pointer;">Logout</a>
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
			<form name=f method=get >
		    <div class="frmSearch">
			<input type=text name=search-box id="search-box" >
			<input type=submit value="Search">
			<div id="suggesstion-box"></div>
			
		</div>
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
						
						<td><img src="images/<%=rs("anh")%>" width=200></td>
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
