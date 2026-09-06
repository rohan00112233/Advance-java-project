package controller;

import java.io.IOException;

import dao.FoodDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Food;

// This servlet displays the details of one selected food item.
@WebServlet("/food-details")
public class FoodDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // This method runs when the user clicks "View Details".
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Read the food ID from the URL.
        String idParameter = request.getParameter("id");

        // Convert the ID from String to int.
        int id = Integer.parseInt(idParameter);

        // Create an object of FoodDAO.
        FoodDAO foodDAO = new FoodDAO();

        // Retrieve the selected food item from the database.
        Food food = foodDAO.getFoodById(id);

        // Send the food object to the JSP page.
        request.setAttribute("food", food);

        // Open the food details JSP page.
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("food-details.jsp");

        dispatcher.forward(request, response);
    }
}