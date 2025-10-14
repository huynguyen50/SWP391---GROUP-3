<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Request Approval</title>
    <style>
        table { border-collapse: collapse; width: 90%; margin: 20px auto; }
        th, td { border: 1px solid #333; padding: 8px; }
        th { background: #f2f2f2; }
        button { margin: 2px; }
    </style>
</head>
<body>
<h1 align="center">Request Approval</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Employee</th>
        <th>Type</th>
        <th>Reason</th>
        <th>Start</th>
        <th>End</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${requests}">
        <tr>
            <td>${r.requestId}</td>
            <td>${r.employeeName}</td>
            <td>${r.type}</td>
            <td>${r.reason}</td>
            <td>${r.startDate}</td>
            <td>${r.endDate}</td>
            <td>${r.status}</td>
            <td>
                <form action="${pageContext.request.contextPath}/manager/requests" method="post" style="display:inline;">
                    <input type="hidden" name="requestId" value="${r.requestId}" />
                    <input type="hidden" name="action" value="approve" />
                    <button type="submit">Approve</button>
                </form>
                <form action="${pageContext.request.contextPath}/manager/requests" method="post" style="display:inline;">
                    <input type="hidden" name="requestId" value="${r.requestId}" />
                    <input type="hidden" name="action" value="reject" />
                    <button type="submit">Reject</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
