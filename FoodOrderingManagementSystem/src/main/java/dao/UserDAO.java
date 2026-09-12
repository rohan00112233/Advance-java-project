package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;

public class UserDAO {

    // Login method
    public User login(String username, String password) {

        User user = null;

        String sql =
                "SELECT * FROM users WHERE username = ? AND password = ?";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(sql);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                user = new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("role")
                );
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return user;
    }


    // Registration method
    public boolean register(
            String username,
            String password,
            String role) {

        String sql =
                "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(sql);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, role);

            int rows =
                    preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            /*
             * If one row was inserted successfully,
             * registration was successful.
             */
            return rows > 0;

        } catch (Exception e) {

            /*
             * Print the REAL database error in Eclipse console.
             *
             * This is important because a registration failure
             * does not always mean that the username already exists.
             */
            e.printStackTrace();

            return false;
        }
    }
}