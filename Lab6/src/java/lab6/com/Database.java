package lab6.com;

// 1. Corrected Imports: Use java.sql instead of com.sun.jdi
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

    private static Connection myConnection = null;
    // 2. Fixed double assignment in myURL
    private static String myURL = "jdbc:mysql://localhost:3306/CSE3023";    

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (myConnection != null && !myConnection.isClosed()) {
            return myConnection;
        }

        Class.forName("com.mysql.jdbc.Driver");
        // If this fails, it will now throw an exception up to the JSP 
        // so you can see the REAL error (Access Denied, DB not found, etc.)
        myConnection = DriverManager.getConnection(myURL, "root", "");
        return myConnection;
    }
}
