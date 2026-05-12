<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%-- 6. Rename title as Lab 6 - Task 4 --%>
        <title>Lab 6 - Task 4</title>

        <%-- 15. Enhance the CSS for the table --%>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
            }
            table {
                width: 80%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th {
                background-color: #4CAF50;
                color: white;
                padding: 12px;
                text-align: left;
            }
            td {
                border: 1px solid #ddd;
                padding: 8px;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            h1 {
                color: #333;
            }
        </style>
    </head>
    <body>
        <%-- 7. Rename h1 --%>
        <h1>Lab 6 - Task 4: Retrieving record via JSP Page</h1>

        <%-- 9. Use a Java scriptlet to create the structure of HTML table --%>
        <table>
            <tr>
                <th>Student No</th>
                <th>Name</th>
                <th>Program</th>
            </tr>

            <%
                // 10. Load the database driver and connect to the database
                String url = "jdbc:mysql://localhost:3306/CSE3023";
                String user = "root";
                String pass = ""; // Update if you have a password

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, pass);

                    // 11. Create Statement for the query
                    stmt = conn.createStatement();

                    // 12. Perform query to retrieve records from StudentTable
                    String sql = "SELECT * FROM Student";
                    rs = stmt.executeQuery(sql);

                    // 13. Fetch the record into HTML table
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("stuid")%></td>
                <td><%= rs.getString("stuname")%></td>
                <td><%= rs.getString("stuprogram")%></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                } finally {
                    // 14. Close the database connection
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                }
            %>
        </table>
    </body>
</html>