<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My Requests</title>
    <style>
        table { border-collapse: collapse; width: 90%; margin: 20px auto; }
        th, td { border: 1px solid #333; padding: 8px; }
        th { background: #f2f2f2; }
    </style>
</head>
<body>
<h1 align="center">My Requests</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Type</th>
        <th>Reason</th>
        <th>Start</th>
        <th>End</th>
        <th>Status</th>
        <th>Response</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${requests}">
        <tr>
            <td>${r.requestId}</td>
            <td>${r.type}</td>
            <td>${r.reason}</td>
            <td>${r.startDate}</td>
            <td>${r.endDate}</td>
            <td>${r.status}</td>
            <td>${r.managerComment}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
