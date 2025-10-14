<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Profile - HR Management System</title>
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
            <div class="profile-container">
                <div class="profile-header">
                    <h2><i class="fas fa-user-circle"></i> Employee Profile</h2>
                    <a href="${pageContext.request.contextPath}/employees/" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to List
                    </a>
                </div>

                <c:if test="${not empty employee}">
                    <div class="profile-card">
                        <div class="profile-avatar">
                            <div class="avatar-circle">
                                <i class="fas fa-user"></i>
                            </div>
                            <h3>${employee.fullName}</h3>
                            <span class="position">${employee.position}</span>
                        </div>

                        <div class="profile-info">
                            <div class="info-section">
                                <h4><i class="fas fa-info-circle"></i> Personal Information</h4>
                                <div class="info-grid">
                                    <div class="info-item">
                                        <label>Full Name:</label>
                                        <span>${employee.fullName}</span>
                                    </div>
                                    <div class="info-item">
                                        <label>Gender:</label>
                                        <span>${employee.gender}</span>
                                    </div>
                                    <div class="info-item">
                                        <label>Date of Birth:</label>
                                        <span><fmt:formatDate value="${employee.dob}" pattern="dd/MM/yyyy" /></span>
                                    </div>
                                    <div class="info-item">
                                        <label>Address:</label>
                                        <span>${employee.address}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="info-section">
                                <h4><i class="fas fa-briefcase"></i> Work Information</h4>
                                <div class="info-grid">
                                    <div class="info-item">
                                        <label>Employee ID:</label>
                                        <span>#${employee.employeeId}</span>
                                    </div>
                                    <div class="info-item">
                                        <label>Department:</label>
                                        <span>${employee.departmentName}</span>
                                    </div>
                                    <div class="info-item">
                                        <label>Position:</label>
                                        <span>${employee.position}</span>
                                    </div>
                                    <div class="info-item">
                                        <label>Employment Period:</label>
                                        <span>${employee.employmentPeriod}</span>
                                    </div>
                                    <div class="info-item">
                                        <label>Status:</label>
                                        <span class="status-badge status-${employee.status.toLowerCase()}">${employee.status}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="info-section">
                                <h4><i class="fas fa-address-book"></i> Contact Information</h4>
                                <div class="info-grid">
                                    <div class="info-item">
                                        <label>Email:</label>
                                        <span><a href="mailto:${employee.email}">${employee.email}</a></span>
                                    </div>
                                    <div class="info-item">
                                        <label>Phone:</label>
                                        <span><a href="tel:${employee.phone}">${employee.phone}</a></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${empty employee}">
                    <div class="error-message">
                        <i class="fas fa-exclamation-triangle"></i>
                        <p>Employee not found.</p>
                    </div>
                </c:if>
            </div>
        </main>

        <footer class="footer">
            <p>&copy; 2025 HR Management System. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>