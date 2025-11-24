package com.horizon.lab3sessionjsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/detail")
public class InfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false); // Don't create new session

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Session Information</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 40px; }");
        out.println(".error { color: red; padding: 10px; background-color: #f8d7da; border: 1px solid #f5c6cb; }");
        out.println(".info { background-color: #e9ecef; padding: 15px; border-radius: 5px; margin: 10px 0; }");
        out.println(".session-info { background-color: #f8f9fa; padding: 15px; border: 1px solid #dee2e6; border-radius: 5px; margin: 10px 0; }");
        out.println("a { display: inline-block; margin: 10px; padding: 10px 15px; text-decoration: none; background-color: #007bff; color: white; border-radius: 4px; }");
        out.println("a:hover { background-color: #0056b3; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Session Information</h1>");

        if (session == null || session.getAttribute("login") == null) {
            // No session or user not logged in
            out.println("<div class='error'>You must log in to view this information</div>");
            out.println("<a href='login.jsp'>Go to Login</a>");
        } else {
            // Session exists, display information
            String login = (String) session.getAttribute("login");
            String sessionId = session.getId();
            long creationTime = session.getCreationTime();
            long lastAccessedTime = session.getLastAccessedTime();
            long currentTime = System.currentTimeMillis();

            // Calculate time elapsed since session creation
            long elapsedTime = currentTime - creationTime;
            long hours = elapsedTime / (1000 * 60 * 60);
            long minutes = (elapsedTime % (1000 * 60 * 60)) / (1000 * 60);
            long seconds = (elapsedTime % (1000 * 60)) / 1000;

            // Format dates
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String creationTimeStr = sdf.format(new Date(creationTime));
            String lastAccessedTimeStr = sdf.format(new Date(lastAccessedTime));
            String currentTimeStr = sdf.format(new Date(currentTime));

            out.println("<div class='info'>");
            out.println("<p><strong>User Login:</strong> " + login + "</p>");
            out.println("</div>");

            out.println("<div class='session-info'>");
            out.println("<p><strong>System Date:</strong> " + currentTimeStr + "</p>");
            out.println("<p><strong>Session Creation Date:</strong> " + creationTimeStr + "</p>");
            out.println("<p><strong>Last Accessed Time:</strong> " + lastAccessedTimeStr + "</p>");
            out.println("<p><strong>Session ID:</strong> " + sessionId + "</p>");
            out.println("<p><strong>Time Since Session Creation:</strong> " +
                    hours + " hours, " + minutes + " minutes, " + seconds + " seconds</p>");
            out.println("</div>");

            // Logout link
            out.println("<a href='logout'>Logout</a>");
        }

        out.println("<br><a href='index.jsp'>Back to Home</a>");
        out.println("</body>");
        out.println("</html>");
    }
}