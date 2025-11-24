<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Session Management</title>
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
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            padding: 50px;
            max-width: 450px;
            width: 100%;
            animation: slideUp 0.6s ease-out;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            color: #333;
            font-size: 2.2rem;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .header p {
            color: #666;
            font-size: 1rem;
        }

        .error {
            background: linear-gradient(135deg, #ff6b6b, #ee5a52);
            color: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 500;
            animation: shake 0.5s ease-in-out;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-group label {
            color: #333;
            font-weight: 600;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .form-group input {
            padding: 15px 20px;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-group input:hover {
            border-color: #a5b4fc;
        }

        .submit-btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 16px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .back-link {
            text-align: center;
            margin-top: 25px;
        }

        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: color 0.3s ease;
        }

        .back-link a:hover {
            color: #764ba2;
        }

        .demo-credentials {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-top: 25px;
            border-left: 4px solid #667eea;
        }

        .demo-credentials h4 {
            color: #333;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .demo-credentials p {
            color: #666;
            font-size: 0.9rem;
            margin: 5px 0;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .password-container {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #666;
            cursor: pointer;
            font-size: 1.1rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px 25px;
                margin: 10px;
            }

            .header h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>🔑 User Login</h1>
        <p>Enter your credentials to access the session management system</p>
    </div>

    <!-- Display error message if authentication failed -->
    <% if (request.getParameter("error") != null) { %>
    <div class="error">
        ⚠️ Authentication failed! Please check your credentials.
    </div>
    <% } %>

    <form class="login-form" action="verif" method="post">
        <div class="form-group">
            <label for="login">👤 Username</label>
            <input type="text" id="login" name="login" required placeholder="Enter your username">
        </div>

        <div class="form-group">
            <label for="password">🔒 Password</label>
            <input type="password" id="password" name="password" required placeholder="Enter your password">
        </div>

        <button type="submit" class="submit-btn">
            🚀 Login to System
        </button>
    </form>

    <div class="demo-credentials">
        <h4>💡 Demo Credentials</h4>
        <p><strong>Username:</strong> guest</p>
        <p><strong>Password:</strong> horizon2024</p>
    </div>

    <div class="back-link">
        <a href="index.jsp">← Back to Home Page</a>
    </div>
</div>

<script>
    // Simple password visibility toggle
    document.addEventListener('DOMContentLoaded', function() {
        const passwordInput = document.getElementById('password');
        const formGroups = document.querySelectorAll('.form-group');

        // Add focus effects
        formGroups.forEach(group => {
            const input = group.querySelector('input');
            if (input) {
                input.addEventListener('focus', function() {
                    group.style.transform = 'scale(1.02)';
                });

                input.addEventListener('blur', function() {
                    group.style.transform = 'scale(1)';
                });
            }
        });
    });
</script>
</body>
</html>