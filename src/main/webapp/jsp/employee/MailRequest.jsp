<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Submit Mail Request</title>
</head>
<body>
<h1 align="center">Submit Request</h1>

<form action="${pageContext.request.contextPath}/employee/requests" method="post" style="width:60%;margin:auto;">
    <p>Request Type:
        <select name="type" required>
            <option value="Leave">Leave</option>
            <option value="Resignation">Resignation</option>
            <option value="Complaint">Complaint</option>
            <option value="Other">Other</option>
        </select>
    </p>

    <p>Start Date: <input type="date" name="startDate" required /></p>
    <p>End Date: <input type="date" name="endDate" required /></p>

    <p>Reason:</p>
    <textarea name="reason" rows="4" cols="50" required></textarea>

    <p>
        <button type="submit">Submit</button>
        <a href="${pageContext.request.contextPath}/employee/MyRequests">Cancel</a>
    </p>
</form>
</body>
</html>
