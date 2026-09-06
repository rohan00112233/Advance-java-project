package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.FoodDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.Food;

@WebServlet("/add-cart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Read the food ID from the URL.
        String idParameter = request.getParameter("id");

        // Check whether the ID was received.
        if (idParameter == null || idParameter.isEmpty()) {

            response.sendRedirect("user-food");
            return;
        }

        // Convert the ID from String to int.
        int id = Integer.parseInt(idParameter);

        // Create the DAO object.
        FoodDAO foodDAO = new FoodDAO();

        // Find the selected food item in the database.
        Food food = foodDAO.getFoodById(id);

        // If the food item does not exist, return to the menu.
        if (food == null) {

            response.sendRedirect("user-food");
            return;
        }

        // Get the current user's session.
        HttpSession session = request.getSession();

        // Retrieve the existing cart from the session.
        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        // Create a new cart if no cart exists.
        if (cart == null) {

            cart = new ArrayList<>();

        }

        // Check whether the selected food is already in the cart.
        boolean foodAlreadyInCart = false;

        for (CartItem cartItem : cart) {

            if (cartItem.getFood().getId() == food.getId()) {

                // Increase quantity if the food already exists.
                cartItem.setQuantity(cartItem.getQuantity() + 1);

                foodAlreadyInCart = true;

                break;
            }
        }

        // Add a new cart item if it is not already present.
        if (!foodAlreadyInCart) {

            CartItem cartItem = new CartItem(food, 1);

            cart.add(cartItem);
        }

        // Save the cart in the session.
        session.setAttribute("cart", cart);

        // Redirect the user to the cart page.
        response.sendRedirect("cart");
    }
}