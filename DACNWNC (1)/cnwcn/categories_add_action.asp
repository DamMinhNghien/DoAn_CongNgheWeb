<!--#include file="connection.asp"-->
<%
	cname = Request.Form("txtCname")
	cdesc = Request.Form("taCdesc")
	cimage = Request.Form("txtCimage")
	corder = Request.Form("txtCorder")
	cstatus = Request.Form("rdCstatus")
	sql="select * from Categories where cname like '" & cname & "'"
	rs.open sql,conn 
	if (not rs.eof) then
		session("categories_add_error")="Danh mục " & cname & " đã tồn tại!"
		Response.Redirect("categories_add.asp")
	else 
		'chèn vào CSDL
		sql = "insert into categories(cname,cdesc,cimage,corder, cstatus) values ('" & cname & "','" & cdesc & "','" & cimage & "'," & corder & "," & cstatus & ")"
		conn.execute sql 
		session("categories_error")="Thêm mới thành công!"
		response.redirect("categories_view.asp")
	end if 
	rs.close
	conn.close
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
	</body>
</html>