
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
    </head>
    <body>
        <h1>Welcome ${sessionScope.systemUser.username}</h1>
        <form action="/HRMS/logout" method="post">
         <button name="logout" value="logout">Logout</button>   
        </form>
        
    </body>
</html>
