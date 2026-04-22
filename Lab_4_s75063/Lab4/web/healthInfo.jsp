<%-- 
    Document   : healthInfo
    Created on : Apr 21, 2026, 4:45:50 PM
    Author     : chiaying
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Health Information</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

        <%@ include file="header.jsp" %>

        <h1>BMI Categories</h1>

        <%
            // Store categories in ArrayList
            ArrayList<String[]> bmiList = new ArrayList<>();

            bmiList.add(new String[]{"Below 18.5", "Underweight"});
            bmiList.add(new String[]{"18.5 - 25", "Normal"});
            bmiList.add(new String[]{"Above 25", "Overweight"});
        %>

        <table border="1" cellpadding="10">
            <tr>
                <th>BMI Range</th>
                <th>Category</th>
            </tr>

            <%
                // Display dynamically
                for (String[] row : bmiList) {
            %>
            <tr>
                <td><%= row[0]%></td>
                <td><%= row[1]%></td>
            </tr>
            <%
                }
            %>

        </table>

        <%@ include file="footer.jsp" %>

    </body>
</html>
