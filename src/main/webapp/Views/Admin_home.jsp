<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_home.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
</head>
<body>
    <div class="dashboard-container">
         Sidebar 
        <aside class="sidebar">
            <div class="sidebar-header">
                <div class="logo">
                    <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
                        <rect width="32" height="32" rx="8" fill="#3B82F6"/>
                        <path d="M16 8L24 20H8L16 8Z" fill="white"/>
                    </svg>
                    <span>Admin</span>
                </div>
            </div>
            
            <nav class="sidebar-nav">
                <a href="#" class="nav-item active">
                    <span class="icon">📊</span>
                    <span>Overview</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">📈</span>
                    <span>Analytics</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">👥</span>
                    <span>Users</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">📝</span>
                    <span>Content</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">💾</span>
                    <span>Database</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">⚡</span>
                    <span>Functions</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">🔍</span>
                    <span>Monitoring</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">🔒</span>
                    <span>Security</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">🔌</span>
                    <span>Integrations</span>
                </a>
                <a href="#" class="nav-item">
                    <span class="icon">⚙️</span>
                    <span>Settings</span>
                </a>
            </nav>
        </aside>

         Main Content 
        <main class="main-content">
             Top Bar 
            <header class="top-bar">
                <div class="search-box">
                    <span class="search-icon">🔍</span>
                    <input type="text" placeholder="Search...">
                </div>
                
                <div class="top-bar-actions">
                    <select class="env-selector">
                        <option>Production</option>
                        <option>Staging</option>
                        <option>Development</option>
                    </select>
                    
                    <select class="time-selector">
                        <option>Last 24 hours</option>
                        <option>Last 7 days</option>
                        <option>Last 30 days</option>
                    </select>
                    
                    <button class="notification-btn">
                        🔔
                        <span class="badge">3</span>
                    </button>
                    
                    <div class="user-menu">
                        <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=Admin" alt="User">
                        <span>${userName}</span>
                    </div>
                </div>
            </header>

             Dashboard Content 
            <div class="dashboard-content">
                <h1 class="page-title">Dashboard Overview</h1>
                
                 Stats Cards 
                <div class="stats-grid" id="statsGrid">
                     Stats will be loaded via JavaScript 
                </div>

                 Charts Section 
                <div class="charts-section">
                    <div class="chart-card">
                        <div class="chart-header">
                            <h3>Edge Requests</h3>
                            <span class="chart-info">Total requests over time</span>
                        </div>
                        <canvas id="edgeRequestsChart"></canvas>
                    </div>

                    <div class="chart-card">
                        <div class="chart-header">
                            <h3>Data Transfer</h3>
                            <span class="chart-info">Bandwidth usage</span>
                        </div>
                        <canvas id="dataTransferChart"></canvas>
                    </div>

                    <div class="chart-card">
                        <div class="chart-header">
                            <h3>Users by Device</h3>
                            <span class="chart-info">Device distribution</span>
                        </div>
                        <canvas id="deviceChart"></canvas>
                    </div>
                </div>

                 Activity Section 
                <div class="activity-section">
                    <div class="activity-card">
                        <h3>Recent Activity</h3>
                        <div class="activity-list" id="activityList">
                             Activity items will be loaded via JavaScript 
                        </div>
                    </div>

                    <div class="referrals-card">
                        <h3>Top Referrals</h3>
                        <div class="referrals-list">
                            <div class="referral-item">
                                <span class="referral-name">Google Search</span>
                                <span class="referral-count">45,231</span>
                            </div>
                            <div class="referral-item">
                                <span class="referral-name">Direct Traffic</span>
                                <span class="referral-count">32,108</span>
                            </div>
                            <div class="referral-item">
                                <span class="referral-name">Social Media</span>
                                <span class="referral-count">18,456</span>
                            </div>
                            <div class="referral-item">
                                <span class="referral-name">Email Campaign</span>
                                <span class="referral-count">12,893</span>
                            </div>
                            <div class="referral-item">
                                <span class="referral-name">Referral Links</span>
                                <span class="referral-count">8,742</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
</body>
</html>
