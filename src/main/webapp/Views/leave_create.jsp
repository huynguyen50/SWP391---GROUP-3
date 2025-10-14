<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Send Leave Application</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        form { width: 400px; }
        label { font-weight: bold; display: block; margin-top: 10px; }
        input, textarea { width: 100%; padding: 8px; margin-top: 5px; }
        .msg { color: green; margin-bottom: 15px; }
        input[type=submit] { background-color: #2196F3; color: white; border: none; cursor: pointer; }
        input[type=submit]:hover { background-color: #1976D2; }
        a { text-decoration: none; color: #333; display: inline-block; margin-top: 10px; }
    </style>
</head>
<body>

<h2>Send Leave Application</h2>

<c:if test="${not empty msg}">
    <div class="msg">${msg}</div>
</c:if>

<form action="${pageContext.request.contextPath}/request/leave/create" method="post">
    <label>Start Date:</label>
    <input type="date" name="start_date" required>

    <label>End Date:</label>
    <input type="date" name="end_date" required>

    <label>Reason:</label>
    <textarea name="reason" rows="4" required></textarea>

    <input type="submit" value="Gửi đơn nghỉ">
</form>

<a href="${pageContext.request.contextPath}/employee/dashboard">← Back To Dashboard</a>

</body>
</html>
