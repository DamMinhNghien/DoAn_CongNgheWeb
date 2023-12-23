<!--#include file="connection.asp"-->
<%
	rs.cursorLocation = 3
	rs.pagesize = 2 
	str  = Request.Querystring("search-box")
	sql = "select * from BaiHat where TenBaiHat like '%" & str& "%'"
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
				url: "seggustionBH.asp",
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
         <a href="Admin_BH_Search.asp" class="nav-link" onclick="openPage('BaiHat')" style="background-color: green; color: white;">BaiHat</a>
        <a href="Admin_CD_Search.asp" class="nav-link" onclick="openPage('ChuDe')">Chủ Đề</a>
        <a href="Admin_TK_Search.asp" class="nav-link" onclick="openPage('TaiKhoan')">Tài Khoản</a>
        <a href="Admin_BXH_Search.asp" class="nav-link"onclick="openPage('BXH')">BXH</a>
        <a href="Admin_AB_Search.asp" class="nav-link" onclick="openPage('PlayListCaNhan')">Album </a>
    </div>
	</br>
	<body>
		<center>
			<form name=f method=get >
		    <div class="frmSearch">
			<input type=text name=search-box id="search-box" >
			<input type=submit value="Search">
			<div id="suggesstion-box"></div>
			
		</div>
		</form>	
		</center>
       
        <center><a href="Admin_BH_View.asp?action=add">Thêm mới bài hát  </a></center>
		
		<table align="center" border="1" width="100%">
			<tr>
				 <tr>
            <th>ID bài hát </th>
            <th>Tên bài hát  </th>
            <th>Tác Giả  </th>
            <th>Mô Tả </th>
            <th>Ngày phát hành</th>
             <th>Ảnh </th>
              <th>ID chủ đề</th>
               <th>Quốc gia</th>
                <th>Đường dẫn</th>
                  <th> Bí danh ca sĩ </th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
			</tr>
			<% 
			If Not rs.eof Then 
				While Not rs.eof And rs.absolutepage = p
			%>
				<tr>
                    <td><%=rs("IDBaiHat")%></td>
                    <td><%=rs("TenBaiHat")%></td>
                     <td><%=rs("TacGia")%></td>
                      <td><%=rs("MoTa")%></td>
                       <td><%=rs("NgayPhatHanh")%></td>
                   <td><img src="images/<%=rs("AnhBH")%>" width=200></td>
                    <td><%=rs("IDChuDe")%></td>
                    <td><%=rs("QuocGia")%></td>
                    <td><%=rs("DuongDan")%></td>
                   
                     <td><%=rs("BiDanh")%></td>
                    <td><a href="Admin_BH_View.asp?action=edit&IDBaiHat=<%=rs("IDBaiHat")%>">Sửa</a></td>
                    <td><a onclick="return confirm('Bạn có chắc muốn xoá <%=rs("IDBaiHat")%> hay ko?');"  href="Admin_BH_View.asp?action=delete&IDBaiHat=<%=rs("IDBaiHat")%>">Xóa</a></td>
                </tr>
			<%
				rs.movenext
				Wend
			Else
				Response.write("<tr><td colspan='7'>Không tồn tại top có tên " & str & "</td></tr>")
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
