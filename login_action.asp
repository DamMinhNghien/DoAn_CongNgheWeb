    <!--#include file="connection.asp"-->
    <%
    session.Timeout=15
    uname=Request.form("UName")
    upass=Request.form("UPass")

    Set rs = Server.CreateObject("ADODB.Recordset")
    Set rs1 = Server.CreateObject("ADODB.Recordset")
    sql="select * from TaiKhoan where TenTK like '" & uname & "' and MatKhau like '" & UPass & "' "

    rs.open sql, conn

    if (rs.eof) then 
        session("login_error")="Tên đăng nhập hoặc mật khẩu không đúng!"
        response.redirect("login.asp")
    else
    
    sql1="select IDTK from TaiKhoan where TenTK like '" & uname & "'"
    rs1.open sql1, conn
    uid= rs1("IDTK")
        session("UID") = uid
        session("UNAME") = uname
         response.redirect("app.asp")
        rs1.close
    end if
        rs.close
        conn.close
    %>