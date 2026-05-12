<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 3. Create student's object using JSP Standard Action tag --%>
<%-- Ensure the class matches your package and class name --%>
<jsp:useBean id="studentBean" class="lab6.com.Book" scope="request" />

<%-- 4. Assign data entry from insertStudent.jsp into Bean --%>
<jsp:setProperty name="studentBean" property="*" />

<!DOCTYPE html>
<html>
    <head>
        <title>Processing Student Record</title>
    </head>
    <body>
        <h2>Registration Status</h2>

        <%
            // 5. Load the database driver and create a connection
            String url = "jdbc:mysql://localhost:3306/CSE3023";
            String user = "root";
            String pass = ""; // Enter your MySQL password if any

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Load Driver
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pass);

                // 6. Create a PreparedStatement's object
                // Note: SQL columns must match your database table structure
                String sql = "INSERT INTO student (stuid, stuname, stuprogram) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);

                // We use the bean getters to set the values
                // Note: studentBean.getStuno() will run your Regex logic!
                pstmt.setString(1, studentBean.getStuno());
                pstmt.setString(2, studentBean.getName());
                pstmt.setString(3, studentBean.getProgram());

                // Execute and check result
                int row = pstmt.executeUpdate();

                if (row > 0) {
                    out.println("<p style='color:green;'>Record inserted successfully!</p>");
                    out.println("<b>Student No:</b> " + studentBean.getStuno() + "<br>");
                    out.println("<b>Name:</b> " + studentBean.getName() + "<br>");
                }

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                // Close resources
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
            conn.close();
        %>
        <br>
        <a href="insertStudent.jsp">Back to Registration</a>
    </body>
</html>