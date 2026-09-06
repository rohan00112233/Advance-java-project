package test;

import java.util.List;

import dao.FoodDAO;
import model.Food;

public class TestGetAllFoods {

    public static void main(String[] args) {

        FoodDAO foodDAO = new FoodDAO();

        List<Food> foodList = foodDAO.getAllFoods();

        for (Food food : foodList) {

            System.out.println("ID: " + food.getId());
            System.out.println("Name: " + food.getName());
            System.out.println("Category: " + food.getCategory());
            System.out.println("Price: " + food.getPrice());
            System.out.println("Availability: " + food.getAvailability());

            System.out.println("----------------------");
        }
    }
}