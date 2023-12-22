<!--#include file="connection.asp"-->
<%
	cid = Request.QueryString("cid")
	sql = "delete from Categories where cid=" & cid 
	conn.execute sql 
	conn.close
	session("categories_error")="Xóa thành công!"
	Response.Redirect("categories_view.asp")
	
%>