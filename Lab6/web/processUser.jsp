<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Initialize the Bean --%>
<jsp:useBean id="user" class="lab6.com.UserBean" scope="request" />
<jsp:setProperty name="user" property="*" />

<!DOCTYPE html>
<html>
    <head>
        <title>Process Registration</title>
    </head>
    <body>
        <%
            // Connection parameters defined locally
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/CF3107";
            String dbUser = "root";
            String dbPass = "";

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // 1. Load the Driver
                Class.forName(driver);

                // 2. Establish Connection
                conn = DriverManager.getConnection(url, dbUser, dbPass);

                // 3. Prepare the SQL Statement
                String sql = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);

                // 4. Bind values from the UserBean
                pstmt.setString(1, user.getUsername());
                pstmt.setString(2, user.getPassword());
                pstmt.setString(3, user.getFirstname());
                pstmt.setString(4, user.getLastname());

                // 5. Execute Update
                int result = pstmt.executeUpdate();

                if (result > 0) {
                    out.println("<h3 style='color:green;'>Registration Successful!</h3>");
                    out.println("<p>Welcome, " + user.getFirstname() + "!</p>");
                    out.println("<a href='login.jsp'>Click here to Login</a>");
                }

            } catch (ClassNotFoundException e) {
                out.println("<p style='color:red;'>Driver Error: " + e.getMessage() + "</p>");
            } catch (SQLException e) {
                out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
            } finally {
                // 6. Close resources in the finally block to prevent memory leaks
                if (pstmt != null) try {
                    pstmt.close();
                } catch (SQLException ignore) {
                }
                if (conn != null) try {
                    conn.close();
                } catch (SQLException ignore) {
                }
            }
        %>
    </body>
</html>