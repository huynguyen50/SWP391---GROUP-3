<%@ page import="java.util.List, java.util.Map" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Employees - HRMS</title>
        <link rel="stylesheet" href="Admin/Admin_home.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    </head>

    <body>
        <div class="dashboard-container">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="sidebar-header">
                    <div class="logo">
                        <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" alt="Logo" width="32">
                        <span>Admin Panel</span>
                    </div>
                </div>

                <div class="sidebar-nav">
                    <a href="${pageContext.request.contextPath}/admin?action=dashboard"
                       class="nav-item ${activePage == 'dashboard' ? 'active' : ''}">🏠 Dashboard</a>

                    <a href="${pageContext.request.contextPath}/admin?action=employees"
                       class="nav-item ${activePage == 'employees' ? 'active' : ''}">👥 Employees</a>

                    <a href="${pageContext.request.contextPath}/admin?action=departments"
                       class="nav-item ${activePage == 'departments' ? 'active' : ''}">🏢 Departments</a>

                    <a href="${pageContext.request.contextPath}/admin?action=profile"
                       class="nav-item ${activePage == 'profile' ? 'active' : ''}">👤 Profile</a>

                </div>


            </aside>

            <div class="main-content">
                <header class="top-bar">
                    <div class="search-box">
                        <span class="search-icon"> </span>
                        <input type="text" placeholder="Search...">
                    </div>
                    <div class="top-bar-actions">
                        <select class="env-selector">
                            <option>Production</option>
                            <option>Staging</option>
                        </select>
                        <select class="time-selector">
                            <option>Today</option>
                            <option>This Week</option>
                            <option>This Month</option>
                        </select>
                        <button class="notification-btn" >
                            🔔
                            <span class="badge">3</span>
                        </button>
                        <div class="user-menu">
                            <img src="https://i.pravatar.cc/32" alt="User">
                            <span>Admin</span>
                        </div>
                    </div>
                </header>
                <div class="dashboard-content">
                    <h1 class="page-title">Employee Management</h1>
                    <div class="table-section">
                        <table class="employee-table">
                            <table>
                                <tr>
                                    <th>ID</th>
                                    <th>Họ tên</th>
                                    <th>Giới tính</th>
                                    <th>Email</th>
                                    <th>Chức vụ</th>
                                    <th>Trạng thái</th>
                                </tr>

                                <%
                                    List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("employeeList");
                                    if (list != null && !list.isEmpty()) {
                                        for (Map<String, Object> emp : list) {
                                %>
                                <tr>
                                    <td><%= emp.get("EmployeeID") %></td>
                                    <td><%= emp.get("FullName") %></td>
                                    <td><%= emp.get("Gender") %></td>
                                    <td><%= emp.get("Email") %></td>
                                    <td><%= emp.get("Position") %></td>
                                    <td>
                                        <span class="status-badge <%= emp.get("Status").toString().toLowerCase() %>">
                                            <%= emp.get("Status") %>
                                        </span>
                                    </td>

                                </tr>
                                <%      }
            } else { %>
                                <tr><td colspan="6">Không có dữ liệu nhân viên</td></tr>
                                <% } %>
                            </table>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="dashboard.js"></script>
</body>

</html>
