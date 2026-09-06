package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Food;
import util.DBConnection;

public class FoodDAO {

    // This method adds a new food item into the database.
    public boolean addFood(Food food) {

        boolean status = false;

        String sql = "INSERT INTO food (name, category, price, availability) VALUES (?, ?, ?, ?)";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, food.getName());
            statement.setString(2, food.getCategory());
            statement.setDouble(3, food.getPrice());
            statement.setString(4, food.getAvailability());

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                status = true;
            }

            statement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;
    }

    // This method retrieves all food items from the database.
    public List<Food> getAllFoods() {

        List<Food> foodList = new ArrayList<>();

        String sql = "SELECT * FROM food";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String category = resultSet.getString("category");
                double price = resultSet.getDouble("price");
                String availability = resultSet.getString("availability");

                Food food = new Food(
                        id,
                        name,
                        category,
                        price,
                        availability
                );

                foodList.add(food);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return foodList;
    }

    // This method retrieves one food item using its ID.
    public Food getFoodById(int id) {

        Food food = null;

        String sql = "SELECT * FROM food WHERE id = ?";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {

                String name = resultSet.getString("name");
                String category = resultSet.getString("category");
                double price = resultSet.getDouble("price");
                String availability = resultSet.getString("availability");

                food = new Food(
                        id,
                        name,
                        category,
                        price,
                        availability
                );
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return food;
    }

    // This method updates an existing food item using its ID.
    public boolean updateFood(Food food) {

        boolean status = false;

        String sql = "UPDATE food SET name = ?, category = ?, price = ?, availability = ? WHERE id = ?";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            // Set the updated food name.
            statement.setString(1, food.getName());

            // Set the updated food category.
            statement.setString(2, food.getCategory());

            // Set the updated food price.
            statement.setDouble(3, food.getPrice());

            // Set the updated availability.
            statement.setString(4, food.getAvailability());

            // Use the food ID to identify the record to update.
            statement.setInt(5, food.getId());

            int rowsUpdated = statement.executeUpdate();

            if (rowsUpdated > 0) {
                status = true;
            }

            statement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;
    }
    
    // This method deletes a food item using its ID.
    public boolean deleteFood(int id) {

        boolean status = false;

        // SQL query to delete a food record.
        String sql = "DELETE FROM food WHERE id = ?";

        try {

            // Get a connection to the database.
            Connection connection = DBConnection.getConnection();

            // Prepare the SQL query.
            PreparedStatement statement = connection.prepareStatement(sql);

            // Set the ID of the food item to delete.
            statement.setInt(1, id);

            // Execute the delete query.
            int rowsDeleted = statement.executeUpdate();

            // If at least one row was deleted, the operation was successful.
            if (rowsDeleted > 0) {
                status = true;
            }

            // Close the statement and connection.
            statement.close();
            connection.close();

        } catch (Exception e) {

            // Print any database error.
            e.printStackTrace();

        }

        // Return the delete result.
        return status;
    }
}