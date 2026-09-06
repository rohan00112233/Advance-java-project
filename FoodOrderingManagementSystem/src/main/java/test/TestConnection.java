package test;

import java.sql.Connection;

import util.DBConnection;

public class TestConnection {

    public static void main(String[] args) {

        Connection connection = DBConnection.getConnection();

        if (connection != null) {
            System.out.println("MySQL connection successful!");
        } else {
            System.out.println("MySQL connection failed!");
        }
    }
}