<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Employee List</title>
</head>
<body>
    <h1>Employee List</h1>

    <p>
        <a href="${pageContext.request.contextPath}/admin/employees?action=new">
            Add Employee
        </a>
    </p>

    <table border="1" cellspacing="0" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Gender</th>
            <th>Date of Birth</th>
            <th>Department</th>
            <th>Position</th>
            <th>Hire Date</th>
            <th>Salary</th>
            <th>Email</th>
            <th>Active</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="e" items="${employees}">
            <tr>
                <td>${e.employeeId}</td>
                <td>${e.fullName}</td>
                <td>${e.gender}</td>
                <td>${e.dob}</td>
                <td>${e.departmentName}</td>
                <td>${e.position}</td>
                <td>${e.hireDate}</td>
                <td>${e.salary}</td>
                <td>${e.email}</td>
                <td><c:out value="${e.active ? 'Yes' : 'No'}"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/employees?action=edit&id=${e.employeeId}">Edit</a> |
                    <a href="${pageContext.request.contextPath}/admin/employees?action=delete&id=${e.employeeId}" 
                       onclick="return confirm('Are you sure you want to delete this employee?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
