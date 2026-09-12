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

@WebServlet("/edit-food")
public class EditFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // This method opens the edit form with existing food details
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get food ID from the URL
        String idParameter = request.getParameter("id");

        // Convert ID from String to int
        int id = Integer.parseInt(idParameter);

        // Create DAO object
        FoodDAO foodDAO = new FoodDAO();

        // Get existing food from database
        Food food = foodDAO.getFoodById(id);

        // Send food object to JSP
        request.setAttribute("food", food);

        // Open edit form
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("edit-food.jsp");

        dispatcher.forward(request, response);
    }

    // This method receives the edited food details
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get values entered in the form
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String availability = request.getParameter("availability");

        // Create Food object with updated values
        Food food = new Food(
                id,
                name,
                category,
                price,
                availability
        );

        // Create DAO object
        FoodDAO foodDAO = new FoodDAO();

        // Update food in database
        boolean status = foodDAO.updateFood(food);

        // If update is successful, go back to admin food list
        if (status) {

            response.sendRedirect("admin-food");

        } else {

            response.getWriter().println("Food could not be updated.");
        }
    }
}