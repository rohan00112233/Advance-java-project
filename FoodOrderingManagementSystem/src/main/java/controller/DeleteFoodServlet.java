package controller;

import java.io.IOException;

import dao.FoodDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-food")
public class DeleteFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get the food ID from the URL
        String idParameter = request.getParameter("id");

        // Convert the ID from String to int
        int id = Integer.parseInt(idParameter);

        // Create DAO object
        FoodDAO foodDAO = new FoodDAO();

        // Delete food from database
        boolean status = foodDAO.deleteFood(id);

        // If deletion is successful, go back to admin food list
        if (status) {

            response.sendRedirect("admin-food");

        } else {

            response.getWriter().println("Food could not be deleted.");
        }
    }
}