package com.hrm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.InputStream;
import java.util.Properties;

public final class DBConnection {

    DBConnection() {
        throw new UnsupportedOperationException("Utility class");
    }

    public static Connection getConnection() throws SQLException {
        Properties props = new Properties();

        try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                throw new SQLException("Không tìm thấy file cấu hình db.properties trong resources/");
            }
            props.load(input);
        } catch (Exception e) {
            throw new SQLException("Lỗi khi đọc file db.properties", e);
        }

        String url = props.getProperty("db.url");
        String user = props.getProperty("db.user");
        String password = props.getProperty("db.password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Không tìm thấy MySQL JDBC Driver", e);
        }
    }
}
