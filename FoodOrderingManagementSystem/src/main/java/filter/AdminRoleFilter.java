package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebFilter({
    "/admin-food",
    "/add-food",
    "/edit-food",
    "/delete-food",
    "/admin-food.jsp",
    "/add-food.jsp",
    "/edit-food.jsp"
})
public class AdminRoleFilter implements Filter {

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest =
                (HttpServletRequest) request;

        HttpServletResponse httpResponse =
                (HttpServletResponse) response;

        HttpSession session =
                httpRequest.getSession(false);

        /*
         * Get the logged-in User object from the session.
         *
         * LoginServlet stores it after successful login.
         */
        User user = null;

        if (session != null) {
            user = (User) session.getAttribute("user");
        }

        /*
         * Allow access only when:
         *
         * 1. A user is actually logged in.
         * 2. The logged-in user's role is ADMIN.
         */
        if (user != null &&
                "ADMIN".equals(user.getRole())) {

            chain.doFilter(request, response);

        } else {

            /*
             * If the user is not logged in or is not an ADMIN,
             * send them to the login page.
             */
            httpResponse.sendRedirect(
                    httpRequest.getContextPath() + "/login.jsp"
            );
        }
    }
}