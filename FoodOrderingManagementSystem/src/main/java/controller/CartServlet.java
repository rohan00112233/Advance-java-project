package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

// This servlet displays the food items stored in the user's cart.
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // This method runs when the user clicks "View Cart".
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current user's session.
        HttpSession session = request.getSession();

        // Retrieve the cart stored in the session.
        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        // Send the cart list to the JSP page.
        request.setAttribute("cart", cart);

        // Open the cart JSP page.
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("cart.jsp");

        dispatcher.forward(request, response);
    }
}