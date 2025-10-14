<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Department Form</title>
</head>
<body>
<h1 align="center">${department != null ? "Edit Department" : "Add Department"}</h1>

<form action="${pageContext.request.contextPath}/admin/departments" method="post" style="width:50%;margin:auto;">
    <input type="hidden" name="id" value="${department.departmentId}" />

    <p>Department Name: <input type="text" name="deptName" value="${department.deptName}" required /></p>
    <p>Description: <input type="text" name="description" value="${department.description}" /></p>

    <p>
        <button type="submit">Save</button>
        <a href="${pageContext.request.contextPath}/admin/departments">Cancel</a>
    </p>
</form>
</body>
</html>
