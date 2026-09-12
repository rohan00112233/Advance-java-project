package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get username and password entered on the login page.
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create UserDAO object.
        UserDAO userDAO = new UserDAO();

        // Check the credentials in the database.
        User user = userDAO.login(username, password);

        // If a matching user is found.
        if (user != null) {

            // Create a new session for the logged-in user.
            HttpSession session = request.getSession();

            // Store the logged-in user's information.
            session.setAttribute("user", user);

            // Store the user's role in the session.
            session.setAttribute("role", user.getRole());

            // Send the user to the correct page.
            if ("ADMIN".equals(user.getRole())) {

                response.sendRedirect("admin-food");

            } else if ("USER".equals(user.getRole())) {

                response.sendRedirect("user-food");

            } else {

                // Unknown role.
                session.invalidate();
                response.sendRedirect("login.jsp?error=invalid");
            }

        } else {

            // Username or password is incorrect.
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}