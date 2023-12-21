<!--#include file="connection.asp"-->

<%
idbinhluan = Request.QueryString("IDbinhluan")
idTK = Request.QueryString("IDTK")
idBaiHat = Request.QueryString("IDBaiHat")

SQL = "UPDATE BinhLuan SET LuotThich = LuotThich + 1 WHERE IDBinhLuan = '" & idbinhluan & "'"
conn.execute SQL
SQL="INSERT INTO ThongKeLike (IDTK, IDBaiHat, IDBinhLuan) VALUES ('" & idTK & "', '" & idBaiHat & "', '" & idbinhluan & "')"
conn.execute SQL
conn.close
%>
