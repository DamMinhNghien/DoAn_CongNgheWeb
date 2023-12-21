<!--#include file="connection.asp"-->
<%
    UID = Request.Form("txtUID")
    TenTK = Request.Form("txtTenTK")
    MatKhau = Request.Form("txtMatKhau")
    SDT = Request.Form("txtSDT")
    Image = Request.form("txtNewImage")

     Set rs2 = Server.CreateObject("ADODB.Recordset")
Set rs1 = Server.CreateObject("ADODB.Recordset")
sql2="select * from TaiKhoan where TenTK like '" & TenTK & "' and IDTK <> '" & UID & "' "
sql1="select * from TaiKhoan where SDT like '" & SDT & "' and IDTK <> '" & UID & "'"
rs2.open sql2, conn
rs1.open sql1, conn
if(not rs2.eof and not rs1.eof) then 
    session("acc_uname_error") = "Tên đăng nhập và số điện thoại đã tồn tại!"
    session("acc_unumber_error") = ""
    Response.Redirect("app_account.asp")
elseif (not rs2.eof) then 
    session("acc_uname_error")="Tên đăng nhập đã tồn tại!"
    session("acc_unumber_error")=""
    Response.Redirect("app_account.asp")
elseif(not rs1.eof) then 
    session("acc_unumber_error")="Số điện thoại đã được đăng kí!"
     session("acc_uname_error")=""
    Response.Redirect("app_account.asp")
elseif(Image="") then 
 sql = "UPDATE TaiKhoan SET TenTK = '" & TenTK & "', MatKhau = '" & MatKhau & "', SDT = '" & SDT & "' WHERE IDTK = " & UID 
    conn.execute sql 
     Response.Redirect("app_account.asp")
else
   
    sql = "UPDATE TaiKhoan SET TenTK = '" & TenTK & "', MatKhau = '" & MatKhau & "', SDT = '" & SDT & "', anh = '" & Image & "' WHERE IDTK = " & UID 
    conn.execute sql 
     Response.Redirect("app_account.asp")
    end if
    conn.close
%>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
    </body>
</html>
