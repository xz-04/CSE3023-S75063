<%-- 
    Document   : processMarathon
    Created on : May 12, 2026, 3:47:40 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="lab6.com.Database" %>
<%@page import="lab6.com.Marathon" %>
<%@page import="lab6.com.MarathonDAO" %>

<%-- IMPORTANT: You must define the bean and set properties from the form --%>
<jsp:useBean id="myMarathon" class="lab6.com.Marathon" scope="request"/>
<jsp:setProperty name="myMarathon" property="*"/>

<!DOCTYPE html>
<html>
    <head>
        <title>Marathon Process</title>
    </head>
    <body>
        <%
            int result;

            try {
                // Step 1: Create Database object...
                // Using the DAO which internally handles the connection logic
                lab6.com.MarathonDAO object1 = new lab6.com.MarathonDAO();

                // Step 2: Add the records...
                // Pass the 'myMarathon' bean populated by the JSP tags above
                result = object1.addDetails(myMarathon);

                // Step 3: Determine whether the transaction is success...
                if (result > 0) {
                    System.out.println("\tRecord successfully added into Marathon table...!");
                    out.print("<p>Record with IC No <b>" + myMarathon.getIcNo()
                            + "</b> successfully created..!</p>");

                    out.print("<p>Details of record are:</p>");
                    out.print("<p>Ic No     : " + myMarathon.getIcNo() + "</p>");
                    out.print("<p>Name      : " + myMarathon.getName() + "</p>");
                    out.print("<p>Category  : " + myMarathon.getCategory() + "</p>");
                } else {
                    out.print("<p style='color:red;'>Failed to insert record. Please try again.</p>");
                }

                // Step 4: Close database connection log
                System.out.println("Step 4: Database operations completed.");
                System.out.println("Database connection is closed...!");

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
        %>
        <br>
        <a href="insertMarathon.jsp">Register another participant</a>
    </body>
</html>