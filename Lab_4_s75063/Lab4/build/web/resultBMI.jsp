<%-- 
    Document   : resultBMI
    Created on : Apr 21, 2026, 4:44:29 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>BMI Result</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

        <%@ include file="header.jsp" %>

        <h1>BMI Result</h1>

        <%
            // Retrieve values from processBMI.jsp
            String bmiStr = request.getParameter("bmi");
            String category = request.getParameter("category");

            // Convert and format BMI
            double bmi = Double.parseDouble(bmiStr);
            String formattedBMI = String.format("%.2f", bmi);
        %>

        <div class="card">
            <p><strong>Your BMI:</strong> <%= formattedBMI%></p>
            <p><strong>Category:</strong> <%= category%></p>
        </div>

        <%@ include file="footer.jsp" %>

    </body>
</html>
