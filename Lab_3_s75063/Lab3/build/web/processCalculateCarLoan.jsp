<%-- 
    Document   : processCalculateCarLoan
    Created on : Apr 14, 2026, 3:24:45 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Perform Car Loan Calculation</h1>
        <fieldset>
            <h2>Details of car loan:</h2>
            <%
                double loan_amount = 0;
                int loan_period = 0;

                loan_amount = Double.parseDouble(request.getParameter("loan_amount"));
                loan_period = Integer.parseInt(request.getParameter("loan_period"));
            %>

            <p>Loan Request : <%= loan_amount%></p>
            <p>Period of payment : <%= loan_period%></p>
            <p>Total Loan(+interest) : <%= loan_amount * 3.5 * loan_period%></p>

        </fieldset>
            &copy;2026-Syafiq
    </body>
</html>
