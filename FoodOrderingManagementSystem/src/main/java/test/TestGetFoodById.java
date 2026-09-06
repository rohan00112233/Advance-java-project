package test;

import dao.FoodDAO;
import model.Food;

public class TestGetFoodById {

    public static void main(String[] args) {

        FoodDAO foodDAO = new FoodDAO();

        Food food = foodDAO.getFoodById(1);

        if (food != null) {

            System.out.println("Food found!");

            System.out.println("ID: " + food.getId());
            System.out.println("Name: " + food.getName());
            System.out.println("Category: " + food.getCategory());
            System.out.println("Price: " + food.getPrice());
            System.out.println("Availability: " + food.getAvailability());

        } else {

            System.out.println("Food not found!");

        }
    }
}