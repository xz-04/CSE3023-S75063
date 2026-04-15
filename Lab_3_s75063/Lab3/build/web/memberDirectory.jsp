<%-- 
    Document   : mamberDirectory.jsp
    Created on : Apr 14, 2026, 8:59:42 PM
    Author     : chiaying
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Directory</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>Club Member</h1>
        <%
            ArrayList<String[]> studentList = (ArrayList<String[]>) application.getAttribute("studentList");

            if (studentList == null) {
                studentList = new ArrayList<String[]>();
            }

            // display the number of records
            out.println("<p>The number of club member is " + studentList.size() + "</p>");

            // start table
            out.println("<table border='1'>");
            out.println("<tr><th>No</th><th>Member Name</th><th>Matric No.</th><th>Selected Club</th></tr>");

            //populate list of students
            for (int i = 0; i < studentList.size(); i++) {
                String[] s = studentList.get(i);
                out.println("<tr>");
                out.println("<td>" + (i + 1) + "</td>");
                out.println("<td>" + s[0] + "</td>");
                out.println("<td>" + s[1] + "</td>");
                out.println("<td>" + s[2] + "</td>");
                out.println("</tr>");
            }

            //end table
            out.println("</table>");

        %>
        <br>
        <%@ include file="footer.jsp" %>
    </body>
</html>
