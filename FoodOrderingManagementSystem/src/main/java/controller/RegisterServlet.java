package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get the values entered in the registration form.
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword =
                request.getParameter("confirmPassword");

        UserDAO userDAO = new UserDAO();

        // Check whether both passwords are the same.
        if (!password.equals(confirmPassword)) {

            response.sendRedirect(
                    "register.jsp?error=password"
            );

            return;
        }

        // Check whether the username is already registered.
        if (userDAO.usernameExists(username)) {

            response.sendRedirect(
                    "register.jsp?error=exists"
            );

            return;
        }

        // Create a new User object.
        // The role is set to USER inside UserDAO.
        User user = new User(
                username,
                password,
                "USER"
        );

        // Save the new user in the database.
        boolean registered =
                userDAO.register(user);

        if (registered) {

            // Registration successful.
            response.sendRedirect(
                    "login.jsp?registered=true"
            );

        } else {

            // Registration failed.
            response.sendRedirect(
                    "register.jsp?error=failed"
            );
        }
    }
}