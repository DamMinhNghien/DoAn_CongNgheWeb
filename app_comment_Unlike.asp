<!--#include file="connection.asp"-->

<%
idbinhluan = Request.QueryString("IDbinhluan")
idTK = Request.QueryString("IDTK")
idBaiHat = Request.QueryString("IDBaiHat")

SQL = "UPDATE BinhLuan SET LuotThich = LuotThich - 1 WHERE IDBinhLuan = '" & idbinhluan & "'"
conn.execute SQL
SQL="DELETE FROM ThongKeLike WHERE IDBinhLuan = '" & idbinhluan & "' AND IDTK = '" & idTK & "' AND IDBaiHat = '" & idBaiHat & "'"
conn.execute SQL
conn.close
%>
