<%-- 
    Document   : bmiCalculator
    Created on : Apr 21, 2026, 4:05:53 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <rel link="stylesheet" href="style.css">
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <h1>BMI input</h1>

        <div class="card">
            <form action="processBMI.jsp" method="post">
                <label for="weight">Weight(kg):*</label>
                <input type="number" id="weight" name="weight" placeholder="weight in kg" step="0.01" required><br><br>

                <label for="height">Height(m):*</label>
                <input type="number" id="height" name="height" placeholder="height in m" step="0.01" required>

                <div class="button-group">
                    <button type="submit" class="btn btn-submit">Submit</button>
                    <button type="submit" class="btn btn-cancel">Cancel</button>
                </div>
            </form>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
