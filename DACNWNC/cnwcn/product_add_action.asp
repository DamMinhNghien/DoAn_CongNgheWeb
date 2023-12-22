<!--#include file="connection.asp"-->
<%
	pname=Request.Form("txtPname")
	pdesc=Request.Form("taPdesc")
	pimage=Request.Form("txtPimage")
	cid=Request.Form("slCid")
	pprice = Request.Form("txtPprice")
	pquantity = Request.Form("txtPquantity")
	pstatus=Request.Form("rdPstatus")
	'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
	sql="select * From Product where pname='" & pname &"'"
	rs.open sql, conn 
	if (not rs.eof) then
		Session("product_add_error")="Tên sản phẩm: " & pname &" đã có rồi!"
		Response.Redirect("product_add.asp")	
    else 
		sql = "insert into product(pname,pdesc,pimage,cid,pstatus,pprice,pquantity) values ('" & pname & "','" & pdesc & "','" & pimage & "'," & cid & "," & pstatus & "," &pprice & "," & pquantity & ")"
		'Response.write(sql)
		conn.execute sql 
		conn.close
		Session("product_add_error")=""
		Session("product_error")="Thêm mới thành công"
		Response.Redirect("product_view.asp")
	end if		
	
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
	
	</body>
</html>