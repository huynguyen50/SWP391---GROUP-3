<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Department Management</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #555; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        a.btn { background: #007bff; color: white; padding: 5px 10px; text-decoration: none; border-radius: 4px; }
        a.btn:hover { background: #0056b3; }
    </style>
</head>
<body>
<h1 align="center">Department Management</h1>
<div style="text-align:center;">
    <a href="${pageContext.request.contextPath}/admin/departments?action=new" class="btn">+ Add Department</a>
</div>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Department Name</th>
        <th>Description</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="d" items="${departments}">
        <tr>
            <td>${d.departmentId}</td>
            <td>${d.deptName}</td>
            <td>${d.description}</td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/departments?action=edit&id=${d.departmentId}">Edit</a> |
                <a href="${pageContext.request.contextPath}/admin/departments?action=delete&id=${d.departmentId}"
                   onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
