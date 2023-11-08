<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up SpotiFake</title>
    <link rel="stylesheet" href="login_css.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
<div class="top-align" >
        <a href="app.asp">SpotiFake</a>
    <br>
    <br>
    <div class="wrapper">
        <form method="POST" action="signup_action.asp">
            <h1>Sign Up</h1>
           
            <div class="input-box">
                <input style="border-color: black;" type="text" placeholder="Username" name="UName" required>
                <i class='bx bxs-user'></i>
            </div>
            
            <div class="input-box">
                <input style="border-color: black;" type="password" placeholder="Password" name="UPass" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="input-box">
                <input style="border-color: black;" type="number" placeholder="Phone Number" name="UNumber" required>
                <i class='bx bx-phone'></i>
            </div>
            <center>
                <font color="red" style="font-size: 12px;">
                    <%=Session("signup_uname_error")%>
                </font>
            </center>
            <center>
                <font color="red" style="font-size: 12px;">
                    <%=Session("signup_unumber_error")%>
                </font>
            </center>
             <%  session("signup_uname_error")=""%>
            <%  session("signup_unumber_error")=""%>
            
            <button type="submit" class="btn">Sign up</button>
            <div class="register-link">
            <a style="color:white ;text-decoration: underline;font-weight: bold;" href="login.asp">Login for SpotiFake</a>
        </div>
       </form>
    </div>
    </div>
</body>

</html>
