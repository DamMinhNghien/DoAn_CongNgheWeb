<!--#include file="connection.asp"-->
<%
uname=Request.form("UName")
upass=Request.form("UPass")
unumber=Request.form("UNumber")

Set rs = Server.CreateObject("ADODB.Recordset")
Set rs1 = Server.CreateObject("ADODB.Recordset")
sql="select * from TaiKhoan where TenTK like '" & uname & "'"
sql1="select * from TaiKhoan where SDT like '" & unumber & "'"
rs.open sql, conn
rs1.open sql1, conn
if(not rs.eof and not rs1.eof) then 
    session("signup_uname_error") = "Tên đăng nhập và số điện thoại đã tồn tại!"
    session("signup_unumber_error") = ""
    Response.Redirect("signup.asp")
elseif (not rs.eof) then 
    session("signup_uname_error")="Tên đăng nhập đã tồn tại!"
    session("signup_unumber_error")=""
    Response.Redirect("signup.asp")
elseif(not rs1.eof) then 
    session("signup_unumber_error")="Số điện thoại đã được đăng kí!"
     session("signup_uname_error")=""
    Response.Redirect("signup.asp")
else
    sql = "insert into TaiKhoan(TenTK, MatKhau, NgayLap, TrangThai, LoaiTK, SDT) values ('" & uname & "', '" & upass & "', GETDATE(),'active', 'user', " & unumber & ")"
    conn.execute(sql)
    response.redirect("signup_success.asp")
end if
    rs.close
    rs1.close
    conn.close
%>