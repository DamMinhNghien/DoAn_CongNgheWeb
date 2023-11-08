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
unumber = Request.Form("UNumber")

If unumber = "" Then
    unumber = Session("SDTQUEN")
End If

Set rs = Server.CreateObject("ADODB.Recordset")
Set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "select TenTK from TaiKhoan where SDT like '" & unumber & "'"
sql = "select * from TaiKhoan where SDT like '" & unumber & "'"
rs.open sql, conn
rs1.open sql1, conn

if(rs.eof)then
session("forgot_error")="Số điện thoại không tồn tại!"
response.redirect("forgot.asp")
response.write("3")
else
%>
    <div class="wrapper">
    <%
    uname = rs("TenTK")
session("SDTQUEN")=unumber
session("TKQUEN")=uname
%>
    <form method=POST action="forgot_action_2.asp">
            <h3>Tài khoản: <%=rs("TenTK")%> </h3>
            <div class="input-box">
                <input style="border-color: black;" type="password" placeholder="Nhập mật khẩu mới"name="UPass" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
              <div class="input-box">
                <input style="border-color: black;" type="password" placeholder="Xác nhận mật khẩu mới"name="URPass" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
                 <center>
                <font color="red" style="font-size: 12px;">
                    <%=Session("forgot_action_error")%>
                </font>
            </center>
             <%  session("forgot_action_error")=""%>
            <button type="submit" class="btn">Confirm changes</button>
           <% end if 
           rs.close
           rs1.close
           conn.close 
           %>
    </form>
    </div>
</body>

</html>