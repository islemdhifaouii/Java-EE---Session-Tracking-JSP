package com.horizon.lab3sessionjsp;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/verif")
public class Authentication extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Correct credentials
    private static final String CORRECT_LOGIN = "guest";
    private static final String CORRECT_PASSWORD = "horizon2024";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        // Validate credentials
        if (CORRECT_LOGIN.equals(login) && CORRECT_PASSWORD.equals(password)) {
            // Create session and store login
            HttpSession session = request.getSession();
            session.setAttribute("login", login);

            // Redirect to index with success message
            response.sendRedirect("index.jsp?message=Authentication successful!");
        } else {
            // Redirect back to login with error message
            response.sendRedirect("login.jsp?error=true");
        }
    }
}