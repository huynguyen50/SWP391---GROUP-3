<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Employee - HR Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <header class="header">
            <div class="header-content">
                <h1><i class="fas fa-users"></i> HR Management System</h1>
                <nav>
                    <a href="${pageContext.request.contextPath}/" class="nav-link">Home</a>
                    <a href="${pageContext.request.contextPath}/employees/" class="nav-link">Employees</a>
                    <a href="${pageContext.request.contextPath}/department/" class="nav-link">Departments</a>
                    <a href="${pageContext.request.contextPath}/guests/list" class="nav-link">Candidates</a>
                </nav>
            </div>
        </header>

        <main class="main-content">
            <div class="form-container">
                <div class="form-header">
                    <h2><i class="fas fa-user-plus"></i> Create New Employee</h2>
                    <a href="${pageContext.request.contextPath}/employees/" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to List
                    </a>
                </div>

                <c:if test="${not empty error}">
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle"></i>
                        <p>${error}</p>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/employees/insert" method="post" class="employee-form">
                    <div class="form-section">
                        <h3><i class="fas fa-info-circle"></i> Personal Information</h3>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="fullName">Full Name *</label>
                                <input type="text" id="fullName" name="fullName" required>
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select id="gender" name="gender">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dob">Date of Birth</label>
                                <input type="date" id="dob" name="dob">
                            </div>
                            <div class="form-group full-width">
                                <label for="address">Address</label>
                                <textarea id="address" name="address" rows="3"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3><i class="fas fa-address-book"></i> Contact Information</h3>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="email">Email *</label>
                                <input type="email" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="tel" id="phone" name="phone">
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3><i class="fas fa-briefcase"></i> Work Information</h3>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="departmentId">Department *</label>
                                <select id="departmentId" name="departmentId" required>
                                    <option value="">Select Department</option>
                                    <c:forEach items="${departments}" var="dept">
                                        <option value="${dept.departmentId}">${dept.deptName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="position">Position *</label>
                                <input type="text" id="position" name="position" required>
                            </div>
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select id="status" name="status">
                                    <option value="Active">Active</option>
                                    <option value="Probation">Probation</option>
                                    <option value="Intern">Intern</option>
                                    <option value="Resigned">Resigned</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="employmentPeriod">Employment Period</label>
                                <input type="text" id="employmentPeriod" name="employmentPeriod" placeholder="e.g., 2023-2025">
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Create Employee
                        </button>
                        <a href="${pageContext.request.contextPath}/employees/" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </main>

        <footer class="footer">
            <p>&copy; 2025 HR Management System. All rights reserved.</p>
        </footer>
    </div>

    <script>
        // Form validation
        document.querySelector('.employee-form').addEventListener('submit', function(e) {
            const email = document.getElementById('email').value;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            if (!emailRegex.test(email)) {
                e.preventDefault();
                alert('Please enter a valid email address.');
                return;
            }
        });
    </script>
</body>
</html>