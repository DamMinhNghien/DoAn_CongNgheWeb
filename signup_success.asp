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
        <form  action="login.asp">
            <h1>Sign Up Successful</h1>
            <br>
            <button type="submit" class="btn">Back to Login</button>
            <%  session("signup_uname_error")=""%>
            <%  session("signup_unumber_error")=""%>
        </form>
    </div>
</body>

</html>