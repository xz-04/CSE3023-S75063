<%@page import="java.sql.*, lab6.com.Database" %>
<%
    // Update this line to use CF3107
    String url = "jdbc:mysql://localhost:3306/CF3107";
    String dbUser = "root";
    String dbPass = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // Ensure the query matches your table name
        String sql = "SELECT * FROM userprofile WHERE username=? AND password=?";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, request.getParameter("username"));
        pstmt.setString(2, request.getParameter("password"));

        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Success: Set session and redirect to main.jsp
            session.setAttribute("user", rs.getString("username"));
            session.setAttribute("fname", rs.getString("firstname"));
            session.setAttribute("lname", rs.getString("lastname"));
            response.sendRedirect("main.jsp");
        } else {
            // Fail: Redirect back with message
            response.sendRedirect("login.jsp?msg=Invalid username or password..!");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>