<!--#include file="connection.asp"-->

<%
idTK = Request.QueryString("IDTK")
idBaiHat = Request.QueryString("IDBaiHat")
commentText = Request.QueryString("Comment")
NewIDBinhLuan = request.QueryString("IDComment")
Response.Write "IDTK: " & idTK & "<br>"
Response.Write "IDBaiHat: " & idBaiHat & "<br>"
Response.Write "CommentText: " & commentText & "<br>"
Response.Write "NewIDBinhLuan: " & NewIDBinhLuan & "<br>"
SQL = "INSERT INTO BinhLuan (IDTK, IDBaiHat, BinhLuan, NgayGio,LuotThich,IDBinhLuan) VALUES ('" & idTK & "', '" & idBaiHat & "', '" & commentText & "', GETDATE(),'0','" & NewIDBinhLuan & "')"
Response.Write SQL
conn.execute SQL
conn.close
%>
