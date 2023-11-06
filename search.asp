<!--#include file="connection.asp"-->
<%
Dim searchKeyword
searchKeyword = Request("keyword") ' Lấy giá trị từ ô nhập

If searchKeyword <> "" Then
    ' Tạo truy vấn SQL để tìm kiếm các bản ghi có chứa từ khóa trong TenChuDe hoặc TenBaiHat
    Dim strSQL
    strSQL = "SELECT TenBaiHat AS Ten FROM BaiHat WHERE TenBaiHat LIKE '%" & searchKeyword & "%' " &_
             "UNION ALL " &_
             "SELECT TenChuDe AS Ten FROM ChuDe WHERE TenChuDe LIKE '%" & searchKeyword & "%'"

    Dim rs
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open strSQL, conn

    ' Hiển thị kết quả
    Response.Write "<h2>Kết quả tìm kiếm cho: " & searchKeyword & "</h2>"
    If Not rs.EOF Then
        Do While Not rs.EOF
            
            Response.Write "<p>Tên : " & rs("Ten") & "</p>"
            rs.MoveNext
        Loop
    Else
        Response.Write "<p>Không tìm thấy kết quả.</p>"
    End If

    ' Đóng Recordset
    rs.Close
    Set rs = Nothing
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

