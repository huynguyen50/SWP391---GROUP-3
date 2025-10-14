<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/Admin_home.css">
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

        <nav class="sidebar-nav">
            <a href="#" class="nav-item active">
                <span class="icon">🏠</span>
                <span>Dashboard</span>
            </a>
            <a href="#" class="nav-item">
                <span class="icon">👥</span>
                <span>Users</span>
            </a>
            <a href="#" class="nav-item">
                <span class="icon">📦</span>
                <span>Products</span>
            </a>
            <a href="#" class="nav-item">
                <span class="icon">📈</span>
                <span>Analytics</span>
            </a>
            <a href="#" class="nav-item">
                <span class="icon">⚙️</span>
                <span>Settings</span>
            </a>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Top Bar -->
        <header class="top-bar">
            <div class="search-box">
                <span class="search-icon">🔍</span>
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
                <button class="notification-btn">
                    🔔
                    <span class="badge">3</span>
                </button>
                <div class="user-menu">
                    <img src="https://i.pravatar.cc/32" alt="User">
                    <span>Admin</span>
                </div>
            </div>
        </header>

        <!-- Dashboard Content -->
        <section class="dashboard-content">
            <h1 class="page-title">Dashboard Overview</h1>

            <!-- Stats Grid -->
            <div id="statsGrid" class="stats-grid"></div>

            <!-- Charts Section -->
            <div class="charts-section">
                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Edge Requests</h3>
                        <div class="chart-info">Requests handled by edge servers</div>
                    </div>
                    <canvas id="edgeRequestsChart" height="180"></canvas>
                </div>

                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Data Transfer</h3>
                        <div class="chart-info">Weekly GB transferred</div>
                    </div>
                    <canvas id="dataTransferChart" height="180"></canvas>
                </div>

                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Devices</h3>
                        <div class="chart-info">User devices distribution</div>
                    </div>
                    <canvas id="deviceChart" height="200"></canvas>
                </div>
            </div>

            <!-- Activity Section -->
            <div class="activity-section">
                <div class="activity-card">
                    <h3>Recent Activity</h3>
                    <div id="activityList" class="activity-list"></div>
                </div>

                <div class="referrals-card">
                    <h3>Top Referrals</h3>
                    <div class="referrals-list">
                        <div class="referral-item">
                            <span class="referral-name">Google</span>
                            <span class="referral-count">1,204</span>
                        </div>
                        <div class="referral-item">
                            <span class="referral-name">Facebook</span>
                            <span class="referral-count">865</span>
                        </div>
                        <div class="referral-item">
                            <span class="referral-name">Twitter</span>
                            <span class="referral-count">432</span>
                        </div>
                        <div class="referral-item">
                            <span class="referral-name">LinkedIn</span>
                            <span class="referral-count">312</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

<script src="dashboard.js"></script>
</body>
</html>
