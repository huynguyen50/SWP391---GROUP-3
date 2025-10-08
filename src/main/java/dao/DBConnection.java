package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName
                + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, userID, password);
    }

    private final String serverName = "localhost";
    private final String dbName = "hrm_db";
    private final String portNumber = "3306";
    private final String userID = "root";
    private final String password = "Hahahaha2%";

    // ✅ Thêm hàm main để test
    public static void main(String[] args) {
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();
            System.out.println("Kết nối thành công!");
            conn.close();
        } catch (Exception e) {
            System.out.println("Lỗi kết nối: " + e.getMessage());
        }
    }
}
