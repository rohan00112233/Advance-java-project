
package test;

import dao.FoodDAO;
import model.Food;

public class TestUpdateFood {

    public static void main(String[] args) {

        // Create an object of FoodDAO.
        FoodDAO foodDAO = new FoodDAO();

        // Create a Food object with the ID of the record to update.
        // Here, ID 1 means the Pizza record will be updated.
        Food food = new Food(
                1,
                "Burger",
                "Fast Food",
                300.0,
                "Yes"
        );

        // Call the updateFood() method.
        boolean status = foodDAO.updateFood(food);

        // Display the result.
        if (status) {

            System.out.println("Food updated successfully!");

        } else {

            System.out.println("Failed to update food!");

        }
    }
}