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
<div class="top-align" >
        <a href="app.asp">SpotiFake</a>
    <br>
    <br>
    <div class="wrapper">
        <form method="post" action="login_action.asp">
            <h1>Login</h1>
            <div class="input-box">
                <input style="border-color: black;" type="text" placeholder="Username"name="UName" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input style="border-color: black;" type="password" placeholder="Password"name="UPass" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="remember-forgot">
            
                <a style="text-decoration: underline;     font-weight: bold;" href="forgot.asp">Forgot Password</a>
            </div>
             <center>
                <font color="red" style="font-size: 12px;">
                    <%=Session("login_error")%>
                </font>
            </center>
             <%  session("login_error")=""%>
            <button type="submit" class="btn">Login</button>
            <div class="register-link">
    
                <p>Dont have an account?<br><br> <a style="color:white ;text-decoration: underline;font-weight: bold;" href="signup.asp">Sign up for SpotiFake</a></p>
            </div>
        </form>
    </div>
    </div>
</body>

</html>