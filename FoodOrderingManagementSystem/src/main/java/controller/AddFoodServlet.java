package controller;

import java.io.IOException;

import dao.FoodDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Food;

// This servlet receives the Add Food form data.
@WebServlet("/add-food")
public class AddFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // This method runs when the Add Food form is submitted.
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Read the values entered in the form.
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String availability = request.getParameter("availability");

        // Create a Food object using the form values.
        Food food = new Food(
                name,
                category,
                price,
                availability
        );

        // Create the DAO object.
        FoodDAO foodDAO = new FoodDAO();

        // Insert the food item into the database.
        boolean status = foodDAO.addFood(food);

        // If insertion is successful, return to the admin page.
        if (status) {

            response.sendRedirect("admin-food");

        } else {

            response.getWriter().println("Food could not be added.");

        }
    }
}