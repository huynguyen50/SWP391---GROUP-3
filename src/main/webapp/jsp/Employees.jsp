<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.hrm.util.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRM System - Human Resource Management</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <a href="index.jsp" class="logo">🏢 HRM System</a>
            <nav>
                <ul class="nav-menu">
                    <li><a href="index.jsp">🏠 Dashboard</a></li>
                    <li><a href="employees.jsp">👥 Employees</a></li>
                    <li><a href="tasks.jsp">📋 Tasks</a></li>
                    <li><a href="mail-requests.jsp">📧 Mail Requests</a></li>
                    <li><a href="recruitment.jsp">🎯 Recruitment</a></li>
                    <li><a href="payroll.jsp">💰 Payroll</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container">
        <div class="mt-4">
            <h1 class="text-center mb-4">🏢 Human Resource Management System</h1>
            <p class="text-center mb-5">Quản lý nhân sự chuyên nghiệp và hiệu quả</p>
        </div>

        <!-- Statistics Dashboard -->
        <div class="dashboard-grid">
            <!-- Total Employees Card -->
            <div class="card stat-card">
                <div class="card-icon">👥</div>
                <div class="stat-number" id="totalEmployees">0</div>
                <div class="stat-label">Tổng Nhân Viên</div>
            </div>

            <!-- Active Employees Card -->
            <div class="card stat-card">
                <div class="card-icon">✅</div>
                <div class="stat-number" id="activeEmployees">0</div>
                <div class="stat-label">Nhân Viên Đang Làm Việc</div>
            </div>

            <!-- Pending Tasks Card -->
            <div class="card stat-card">
                <div class="card-icon">📋</div>
                <div class="stat-number" id="pendingTasks">0</div>
                <div class="stat-label">Công Việc Chờ Xử Lý</div>
            </div>

            <!-- Pending Requests Card -->
            <div class="card stat-card">
                <div class="card-icon">📧</div>
                <div class="stat-number" id="pendingRequests">0</div>
                <div class="stat-label">Yêu Cầu Chờ Duyệt</div>
            </div>

            <!-- Open Positions Card -->
            <div class="card stat-card">
                <div class="card-icon">🎯</div>
                <div class="stat-number" id="openPositions">0</div>
                <div class="stat-label">Vị Trí Tuyển Dụng</div>
            </div>

            <!-- Total Departments Card -->
            <div class="card stat-card">
                <div class="card-icon">🏢</div>
                <div class="stat-number" id="totalDepartments">0</div>
                <div class="stat-label">Tổng Phòng Ban</div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="card mt-5">
            <div class="card-header">
                <h2 class="card-title">⚡ Hành Động Nhanh</h2>
            </div>
            <div class="dashboard-grid">
                <a href="employees?action=create" class="btn btn-primary w-100">
                    ➕ Thêm Nhân Viên Mới
                </a>
                <a href="tasks?action=create" class="btn btn-success w-100">
                    📋 Tạo Công Việc Mới
                </a>
                <a href="mail-requests?action=create" class="btn btn-warning w-100">
                    📧 Gửi Yêu Cầu Mới
                </a>
                <a href="recruitment?action=create" class="btn btn-info w-100">
                    🎯 Đăng Tin Tuyển Dụng
                </a>
            </div>
        </div>

        <!-- Recent Activities -->
        <div class="card mt-5">
            <div class="card-header">
                <h2 class="card-title">📊 Hoạt Động Gần Đây</h2>
            </div>
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Thời Gian</th>
                            <th>Người Thực Hiện</th>
                            <th>Hành Động</th>
                            <th>Đối Tượng</th>
                            <th>Trạng Thái</th>
                        </tr>
                    </thead>
                    <tbody id="recentActivities">
                        <tr>
                            <td colspan="5" class="text-center">
                                <div class="spinner"></div>
                                <p>Đang tải dữ liệu...</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Employee Status Overview -->
        <div class="dashboard-grid mt-5">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">📈 Trạng Thái Nhân Viên</h3>
                </div>
                <div id="employeeStatusChart">
                    <div class="text-center">
                        <div class="spinner"></div>
                        <p>Đang tải biểu đồ...</p>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">🏢 Phân Bổ Theo Phòng Ban</h3>
                </div>
                <div id="departmentChart">
                    <div class="text-center">
                        <div class="spinner"></div>
                        <p>Đang tải biểu đồ...</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 HRM System. All rights reserved.</p>
            <p>Developed with ❤️ using Java, JSP & CSS</p>
        </div>
    </footer>

    <!-- JavaScript -->
    <script src="js/dashboard.js"></script>
    <script>
        // Load dashboard data when page loads
        document.addEventListener('DOMContentLoaded', function() {
            loadDashboardData();
            loadRecentActivities();
            loadCharts();
        });

        // Auto-refresh every 30 seconds
        setInterval(function() {
            loadDashboardData();
            loadRecentActivities();
        }, 30000);
    </script>
</body>
</html>