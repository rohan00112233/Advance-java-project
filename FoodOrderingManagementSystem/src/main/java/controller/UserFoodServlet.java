package controller;

import java.io.IOException;
import java.util.List;

import dao.FoodDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Food;

// This servlet displays all available food items to the user.
@WebServlet("/user-food")
public class UserFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // This method runs when the user opens /user-food.
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Create an object of FoodDAO.
        FoodDAO foodDAO = new FoodDAO();

        // Retrieve all food items from the database.
        List<Food> foodList = foodDAO.getAllFoods();

        // Send the food list to the JSP page.
        request.setAttribute("foodList", foodList);

        // Open the user menu JSP page.
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("user-menu.jsp");

        dispatcher.forward(request, response);
    }
}