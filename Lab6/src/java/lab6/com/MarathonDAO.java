package lab6.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MarathonDAO {

    private Connection connection;
    private int result = 0;

    public MarathonDAO() throws ClassNotFoundException, SQLException {
        // This calls your Database utility class we fixed earlier
        connection = Database.getConnection();
    }

    public int addDetails(Marathon marathon) {
        try {
            String mySQL = "INSERT INTO Marathon(icno, name, category) values (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(mySQL);

            // CRITICAL: You must set the parameters for the '?' symbols
            preparedStatement.setString(1, marathon.getIcNo());
            preparedStatement.setString(2, marathon.getName());
            preparedStatement.setString(3, marathon.getCategory());

            // Optional: Keep these for debugging in the NetBeans console
            System.out.println("IC No     = " + marathon.getIcNo());
            System.out.println("Name      = " + marathon.getName());
            System.out.println("Category  = " + marathon.getCategory());

            // Execute the insert
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
