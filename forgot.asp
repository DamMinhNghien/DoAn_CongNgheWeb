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
    <div class="wrapper">
    <form method=POST action="forgot_action.asp">
           <h3>Nhập số điện thoại đã đăng kí</h3>
            <div class="input-box"> 
                <input style="border-color: black;" type="number" placeholder="Nhập SĐT" name="UNumber" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
      
             <center>
                <font color="red" style="font-size: 12px;">
                    <%=Session("forgot_error")%>
                </font>
            </center>
             <%  session("forgot_error")=""%>
            <button type="submit" class="btn">Confirm Phone Number</button>
           </form>
       
    </div>
</body>

</html>