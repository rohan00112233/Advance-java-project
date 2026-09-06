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

// This servlet displays all food items for the admin.
@WebServlet("/admin-food")
public class AdminFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // This method runs when the admin opens /admin-food.
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Create an object of FoodDAO.
        FoodDAO foodDAO = new FoodDAO();

        // Retrieve all food items from the database.
        List<Food> foodList = foodDAO.getAllFoods();

        // Send the food list to the admin JSP page.
        request.setAttribute("foodList", foodList);

        // Open the admin food management JSP page.
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("admin-food.jsp");

        dispatcher.forward(request, response);
    }
}