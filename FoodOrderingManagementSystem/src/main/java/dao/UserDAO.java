package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;

public class UserDAO {

    // Login method
    // Checks username and password in the users table.
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

            // If matching username and password are found.
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


    // Check whether a username already exists.
    public boolean usernameExists(String username) {

        boolean exists = false;

        String sql =
                "SELECT id FROM users WHERE username = ?";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(sql);

            preparedStatement.setString(1, username);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                exists = true;
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return exists;
    }


    // Register a new user.
    // Every user registered through the website
    // will automatically receive the USER role.
    public boolean register(User user) {

        boolean registered = false;

        String sql =
                "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(sql);

            preparedStatement.setString(
                    1,
                    user.getUsername()
            );

            preparedStatement.setString(
                    2,
                    user.getPassword()
            );

            // Do not allow users to choose their role.
            preparedStatement.setString(
                    3,
                    "USER"
            );

            int rows =
                    preparedStatement.executeUpdate();

            if (rows > 0) {

                registered = true;
            }

            preparedStatement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return registered;
    }
}