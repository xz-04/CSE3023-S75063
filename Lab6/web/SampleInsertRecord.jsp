<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Lab 6 - Task 1</title>
    </head>
    <body>
        <h1>Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP’s page</h1>

        <%

            String url = "jdbc:mysql://localhost:3306/CSE3023";
            String username = "root";
            String password = "";

            Connection conn = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);
            } catch (Exception e) {
                e.printStackTrace();
            }

            Statement stmt = null;

            try {
                // 1. Load MySQL Driver
                Class.forName("com.mysql.jdbc.Driver");

                // 2. Establish Connection
                conn = DriverManager.getConnection(url, username, password);

                // 3. Create Statement
                stmt = conn.createStatement();

                // 4. Define SQL Query (Adjust column names based on your FirstTable schema)
                String sql = "INSERT INTO FirstTable (id, name, position) VALUES (1, 'John Doe', 'Engineer')";

                // 5. Execute Update
                int rowsAffected = stmt.executeUpdate(sql);

                if (rowsAffected > 0) {
                    out.println("<p style='color:green;'>Data inserted successfully into FirstTable!</p>");
                }

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                // Close resources
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
        %>
    </body>
</html>