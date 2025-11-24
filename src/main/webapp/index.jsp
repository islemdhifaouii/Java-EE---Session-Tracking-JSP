<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page - Session Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

        .header {
            margin-bottom: 30px;
        }

        .header h1 {
            color: #333;
            font-size: 2.5rem;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .header p {
            color: #666;
            font-size: 1.1rem;
        }

        .message {
            padding: 15px;
            margin: 20px 0;
            border-radius: 10px;
            font-weight: 500;
            animation: slideIn 0.5s ease-out;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 2px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 2px solid #f5c6cb;
        }

        .info {
            background-color: #d1ecf1;
            color: #0c5460;
            border: 2px solid #bee5eb;
        }

        .nav-links {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin: 30px 0;
            flex-wrap: wrap;
        }

        .nav-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 15px 30px;
            text-decoration: none;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
            min-width: 180px;
        }

        .nav-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
        }

        .nav-btn:active {
            transform: translateY(-1px);
        }

        .user-info {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            animation: bounceIn 0.6s ease-out;
        }

        .user-info h3 {
            margin-bottom: 10px;
            font-size: 1.3rem;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                opacity: 1;
                transform: scale(1.05);
            }
            70% {
                transform: scale(0.9);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .feature {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            border-left: 4px solid #667eea;
        }

        .feature h4 {
            color: #333;
            margin-bottom: 10px;
        }

        .feature p {
            color: #666;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 10px;
            }

            .nav-links {
                flex-direction: column;
                align-items: center;
            }

            .nav-btn {
                width: 100%;
                max-width: 250px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>🔐 Session Management Lab</h1>
        <p>Java EE - Session Tracking & JSP Demonstration</p>
    </div>

    <!-- Display messages -->
    <% if (request.getParameter("message") != null) { %>
    <div class="message success">
        ✅ <%= request.getParameter("message") %>
    </div>
    <% } %>

    <% if (request.getParameter("error") != null) { %>
    <div class="message error">
        ❌ <%= request.getParameter("error") %>
    </div>
    <% } %>

    <!-- Navigation links -->
    <div class="nav-links">
        <a href="login.jsp" class="nav-btn">
            🔑 Login
        </a>
        <a href="detail" class="nav-btn">
            📊 Session Info
        </a>
    </div>

    <!-- Display login info if user is logged in -->
    <%
        jakarta.servlet.http.HttpSession userSession = request.getSession(false);
        if (userSession != null && userSession.getAttribute("login") != null) {
    %>
    <div class="user-info">
        <h3>👋 Welcome Back!</h3>
        <p>You are logged in as: <strong><%= userSession.getAttribute("login") %></strong></p>
    </div>
    <% } %>

    <div class="features">
        <div class="feature">
            <h4>🔐 Secure Login</h4>
            <p>Experience secure session-based authentication with proper credential validation.</p>
        </div>
        <div class="feature">
            <h4>📊 Session Tracking</h4>
            <p>Monitor session details including creation time, duration, and access patterns.</p>
        </div>
        <div class="feature">
            <h4>🚀 Modern UI</h4>
            <p>Enjoy a responsive and visually appealing user interface with smooth animations.</p>
        </div>
    </div>
</div>
</body>
</html>