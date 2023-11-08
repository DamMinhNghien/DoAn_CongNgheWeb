<!--#include file="connection.asp"-->
<%
Dim searchKeyword
searchKeyword = Request("keyword") ' Lấy giá trị từ ô nhập

If searchKeyword <> "" Then
    ' Tạo truy vấn SQL để tìm kiếm các bản ghi có chứa từ khóa trong TenChuDe hoặc TenBaiHat
    Set rs = Server.CreateObject("ADODB.Recordset")
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    strSQL = "SELECT TenBaiHat FROM BaiHat  WHERE TenBaiHat LIKE '%" & searchKeyword & "%' ORDER By TenBaiHat " 
   strSQL1 = "SELECT TenChuDe FROM ChuDe  WHERE TenChuDe LIKE '%" & searchKeyword & "%' ORDER By TenChuDe " 

    rs.Open strSQL, conn
    rs1.Open strSQL1, conn
    ' Hiển thị kết quả
    Response.Write "<h2>Kết quả tìm kiếm cho: " & searchKeyword & "</h2>"
   If Not rs.EOF Then
        Do While Not rs.EOF 
           Response.Write "<p>TenBaiHat : " & rs("TenBaiHat") & "</p>"

            rs.MoveNext
        Loop
    Else
        Response.Write "<p>Không tìm thấy kết quả.</p>"
    End If
    if not rs1.EOF Then
    Do While Not rs1.EOF 
   
           Response.Write "<p>TenChuDe : " & rs1("TenChuDe") & "</p>"
            rs1.MoveNext
        Loop
    Else
        Response.Write "<p>Không tìm thấy kết quả.</p>"
    End If

    ' Đóng Recordset
    rs.Close
    rs1.close
   conn.close
End If
%>

<!-- Biểu mẫu HTML cho tìm kiếm -->


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<form method="post" action="search.asp"> <!-- Thay đổi action thành "timkiem.asp" -->
    <input type="text" name="keyword" placeholder="Nhập từ khóa tìm kiếm">
    <input type="submit" value="Tìm kiếm">
</form>
</body>
</html>

