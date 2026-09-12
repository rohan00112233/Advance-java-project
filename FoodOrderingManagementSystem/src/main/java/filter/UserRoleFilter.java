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
    "/user-food",
    "/food-details",
    "/add-cart",
    "/cart",
    "/user-menu.jsp",
    "/food-details.jsp",
    "/cart.jsp"
})
public class UserRoleFilter implements Filter {

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
         * First check whether the user is actually logged in.
         *
         * The LoginServlet stores the logged-in User object
         * inside the session using the attribute "user".
         */
        User user = null;

        if (session != null) {
            user = (User) session.getAttribute("user");
        }

        /*
         * Allow access only when:
         *
         * 1. A logged-in user exists.
         * 2. The user's role is USER.
         */
        if (user != null &&
                "USER".equals(user.getRole())) {

            chain.doFilter(request, response);

        } else {

            /*
             * If the user is not logged in or is an ADMIN,
             * send them back to the login page.
             */
            httpResponse.sendRedirect(
                    httpRequest.getContextPath() + "/login.jsp"
            );
        }
    }
}