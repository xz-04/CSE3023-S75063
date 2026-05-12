<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="authorBean" class="lab6.com.Author" scope="request" />
<jsp:setProperty name="authorBean" property="*" />

<%
    String url = "jdbc:mysql://localhost:3306/CSE3023";
    String username = "root";
    String password = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);

        // SQL now includes 'name'
        String sql = "INSERT INTO Author (authorNo, name, address, city, state, zip) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, authorBean.getAuthorNo());
        pstmt.setString(2, authorBean.getName());
        pstmt.setString(3, authorBean.getAddress());
        pstmt.setString(4, authorBean.getCity());
        pstmt.setString(5, authorBean.getState());
        pstmt.setString(6, authorBean.getZip());

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("<h3 style='color:green;'>Data Saved Successfully!</h3>");
            out.println("<p>Author: " + authorBean.getName() + " added.</p>");
        }

        pstmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Database Error: " + e.getMessage() + "</h3>");
    }
%>
<br>
<a href="insertAuthor.jsp">Add Another Author</a>