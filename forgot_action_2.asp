    <!--#include file="connection.asp"-->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form | Dan Aleko</title>
    <link rel="stylesheet" href="login_css.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
<%
    Set rs = Server.CreateObject("ADODB.Recordset")
uname=session("TKQUEN")
upass=Request.form("UPass")
urpass=Request.form("URPass")
if  upass <> urpass then
session("forgot_action_error")="Mật khẩu không khớp!"
response.redirect("forgot_action.asp")

else 
 sql = "UPDATE TaiKhoan SET MatKhau = '" & upass & "' where TenTK like '" & uname & "' "
rs.open sql, conn
    conn.execute(sql)
    response.redirect("forgot_success.asp")
end if 
    rs.close
    conn.close
%>
</body>

</html>