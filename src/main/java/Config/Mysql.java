package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Mysql {
    private static final String connectionURL = "jdbc:mysql://db4free.net:3306/thecoders";
    private static final String userName = "thecoders";
    private static final String password = "r7q7pAY4YVRScBg";

    public static synchronized Connection getMysqlConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(connectionURL, userName, password);
    }
}
