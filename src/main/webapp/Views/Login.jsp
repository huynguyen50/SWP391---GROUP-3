<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
        <title>Login Form</title>
    </head>
    <body>
        <div class="container">
            <!--left-->
            <div class="recruitmentContent">
                <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>
                <h1>Welcome to our company</h1>
                <div class="info-box">Recruitment information</div>
                <a href="#">Recruit now</a>
            </div>
            <!--right-->
            <div id="logreg-forms"> 
                <form class="form-signin" action="login" method="post">
                    <input type="text" name="username" value="" class="form-control" required="" autofocus="" placeholder="Username">
                    <input type="password" name="password" value="" class="form-control" required="" autofocus="" placeholder="Password">
                    <div class="remember-group"><input type="checkbox" name="rememberMe" value="true">Remember me</div>
                    <input type="submit" value="Login" class="submit">
                    <a href="ForgotPassword.jsp">Forgot password?</a>
                    <hr class="divider">
                    <p style="text-align: center; font-size: 20px">Or</p>
                    <button class="btn btn-primary">Login by gmail</button>
                </form>
            </div>
        </div>
    </body>
</html>
