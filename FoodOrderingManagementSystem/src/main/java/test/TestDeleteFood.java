package test;

import dao.FoodDAO;

public class TestDeleteFood {

    public static void main(String[] args) {

        // Create an object of FoodDAO.
        FoodDAO foodDAO = new FoodDAO();

        // Delete the food item whose ID is 1.
        boolean status = foodDAO.deleteFood(1);

        // Display the result.
        if (status) {

            System.out.println("Food deleted successfully!");

        } else {

            System.out.println("Failed to delete food!");

        }
    }
}