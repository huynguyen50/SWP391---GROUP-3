<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Form</title>
</head>
<body>
    <h1>${employee != null ? "Edit Employee" : "Add New Employee"}</h1>

    <form action="${pageContext.request.contextPath}/admin/employees" method="post">
        <input type="hidden" name="id" value="${employee.employeeId}" />

        <p>Full Name: <input type="text" name="fullName" value="${employee.fullName}" required /></p>
        <p>Gender:
            <select name="gender">
                <option value="Male" ${employee.gender == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${employee.gender == 'Female' ? 'selected' : ''}>Female</option>
            </select>
        </p>
        <p>Date of Birth: <input type="date" name="dob" value="${employee.dob}" required /></p>
        <p>Address: <input type="text" name="address" value="${employee.address}" required /></p>
        <p>Phone: <input type="text" name="phone" value="${employee.phone}" required /></p>
        <p>Email: <input type="email" name="email" value="${employee.email}" required /></p>

        <p>Department:
            <select name="departmentId">
                <option value="">-- Select Department --</option>
                <option value="1" ${employee.departmentId == 1 ? 'selected' : ''}>Human Resources</option>
                <option value="2" ${employee.departmentId == 2 ? 'selected' : ''}>IT</option>
                <option value="3" ${employee.departmentId == 3 ? 'selected' : ''}>Finance</option>
                <option value="4" ${employee.departmentId == 4 ? 'selected' : ''}>Marketing</option>
            </select>
        </p>

        <p>Position: <input type="text" name="position" value="${employee.position}" required /></p>
        <p>Hire Date: <input type="date" name="hireDate" value="${employee.hireDate}" required /></p>
        <p>Salary: <input type="text" name="salary" value="${employee.salary}" required pattern="\\d+(\\.\\d{1,2})?"</p>
        <p>Active:
            <input type="checkbox" name="active" value="true" ${employee.active ? "checked" : ""} />
        </p>

        <p>
            <button type="submit">Save</button>
            <a href="${pageContext.request.contextPath}/admin/employees">Cancel</a>
        </p>
    </form>
</body>
</html>
