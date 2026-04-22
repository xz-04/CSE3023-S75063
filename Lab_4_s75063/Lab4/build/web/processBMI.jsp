<%-- 
    Document   : processBMI
    Created on : Apr 21, 2026, 4:31:51 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%
            //retrieve value
            String weightstr = request.getParameter("weight");
            String heightstr = request.getParameter("height");

            //convert input
            double weight = Double.parseDouble(weightstr);
            double height = Double.parseDouble(heightstr);

            //calculate bmi
            double bmi = weight / (height * height);

            //bmi category
            String category = "";
            if (bmi < 18.5) {
                category = "Underweight";
            } else if (bmi <= 25) {
                category = "Normal weight";
            } else {
                category = "Overweight";
            }

            //format 2 decimal
            String bmiFormatted = String.format("%.2f", bmi);
        %>

        <jsp:forward page="resultBMI.jsp">
            <jsp:param name="bmi" value="<%= bmiFormatted%>" />
            <jsp:param name="category" value="<%= category%>" />
        </jsp:forward>
        <%@ include file="footer.jsp" %>
    </body>
</html>
