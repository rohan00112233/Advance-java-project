package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;

public class UserDAO {

    // Check username and password in the database.
    // If the credentials are correct,
    // return the complete User object.
    public User login(String username, String password) {

        User user = null;

        String sql =
                "SELECT * FROM users WHERE username = ? AND password = ?";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(sql);

            // Set username.
            preparedStatement.setString(1, username);

            // Set password.
            preparedStatement.setString(2, password);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            // If a matching account is found.
            if (resultSet.next()) {

                user = new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("role")
                );
            }

            // Close resources.
            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return user;
    }
}