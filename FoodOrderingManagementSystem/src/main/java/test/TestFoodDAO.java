package test;

import dao.FoodDAO;
import model.Food;

public class TestFoodDAO {

    public static void main(String[] args) {

        Food food = new Food(
                "Pizza",
                "Fast Food",
                250.0,
                "Yes"
        );

        FoodDAO foodDAO = new FoodDAO();

        boolean status = foodDAO.addFood(food);

        if (status) {
            System.out.println("Food added successfully!");
        } else {
            System.out.println("Failed to add food!");
        }
    }
}