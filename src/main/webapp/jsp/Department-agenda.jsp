<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department Agenda - HR Management System</title>
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
            <div class="agenda-container">
                <div class="agenda-header">
                    <h2><i class="fas fa-calendar-alt"></i> Department Agenda</h2>
                    <a href="${pageContext.request.contextPath}/department/" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to Departments
                    </a>
                </div>

                <c:if test="${not empty department}">
                    <div class="department-info">
                        <div class="dept-card">
                            <h3>${department.deptName}</h3>
                            <c:if test="${not empty department.managerName}">
                                <p><i class="fas fa-user-tie"></i> Manager: ${department.managerName}</p>
                            </c:if>
                            <p><i class="fas fa-users"></i> Total Employees: ${employees.size()}</p>
                        </div>
                    </div>

                    <div class="agenda-content">
                        <div class="agenda-section">
                            <h3><i class="fas fa-tasks"></i> Department Tasks</h3>
                            <c:choose>
                                <c:when test="${not empty tasks}">
                                    <div class="task-list">
                                        <c:forEach items="${tasks}" var="task">
                                            <div class="task-item status-${task.status.toLowerCase().replace(' ', '-')}">
                                                <div class="task-header">
                                                    <h4>${task.title}</h4>
                                                    <span class="task-status">${task.status}</span>
                                                </div>
                                                <p class="task-description">${task.description}</p>
                                                <div class="task-meta">
                                                    <div class="task-assign">
                                                        <i class="fas fa-user"></i> Assigned to: ${task.assignToName}
                                                    </div>
                                                    <div class="task-assigner">
                                                        <i class="fas fa-user-plus"></i> By: ${task.assignedByName}
                                                    </div>
                                                </div>
                                                <div class="task-dates">
                                                    <c:if test="${not empty task.startDate}">
                                                        <span class="task-date">
                                                            <i class="fas fa-calendar"></i> Start: <fmt:formatDate value="${task.startDate}" pattern="dd/MM/yyyy" />
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${not empty task.dueDate}">
                                                        <span class="task-date due-date">
                                                            <i class="fas fa-calendar-check"></i> Due: <fmt:formatDate value="${task.dueDate}" pattern="dd/MM/yyyy" />
                                                        </span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="no-data">
                                        <i class="fas fa-clipboard-list"></i>
                                        <p>No tasks found for this department.</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="agenda-section">
                            <h3><i class="fas fa-users"></i> Department Members</h3>
                            <c:choose>
                                <c:when test="${not empty employees}">
                                    <div class="employee-grid">
                                        <c:forEach items="${employees}" var="employee">
                                            <div class="employee-card">
                                                <div class="employee-avatar">
                                                    <i class="fas fa-user"></i>
                                                </div>
                                                <div class="employee-info">
                                                    <h4>${employee.fullName}</h4>
                                                    <p class="employee-position">${employee.position}</p>
                                                    <span class="status-badge status-${employee.status.toLowerCase()}">${employee.status}</span>
                                                </div>
                                                <div class="employee-contact">
                                                    <a href="mailto:${employee.email}" class="contact-link" title="Email">
                                                        <i class="fas fa-envelope"></i>
                                                    </a>
                                                    <a href="tel:${employee.phone}" class="contact-link" title="Phone">
                                                        <i class="fas fa-phone"></i>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/employees/view?id=${employee.employeeId}" class="contact-link" title="View Profile">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="no-data">
                                        <i class="fas fa-users"></i>
                                        <p>No employees found in this department.</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

                <c:if test="${empty department}">
                    <div class="error-message">
                        <i class="fas fa-exclamation-triangle"></i>
                        <p>Department not found.</p>
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