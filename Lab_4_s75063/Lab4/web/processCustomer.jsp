<%-- 
    Document   : processCustomer
    Created on : Apr 21, 2026, 1:55:44 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Discount Result</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
            // Fixed price
            final double price = 10.0;
            // Retrieve form data
            String cust_no = request.getParameter("customerCode");
            String cust_type = request.getParameter("customerType");
            int quantity = 0;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (Exception e) {
                quantity = 0;
            }

            // Business logic
            double total = 0;
            String message = "";
            if (cust_type != null && cust_type.equals("1") && quantity > 100) {
                message = "You're entitled to 10% discount";
                total = quantity * price * 0.9;
            } else if (cust_type != null && cust_type.equals("2") && quantity > 100) {
                message = "You're entitled to 25% discount";
                total = quantity * price * 0.75;
            } else {
                message = "You're not entitled to any discount";
                total = quantity * price;
            }

            // Display customer type
            String custTypeDisplay = (cust_type != null && cust_type.equals("1"))
                    ? "Normal Customer" : "Privilege Customer";
        %>

        <div class="container">
            <h1>Customer Discount Result</h1>

            <div class="card">
                <h2 class="form-title">Transaction Summary</h2>

                <div class="form-group">
                    <label>Customer Code:</label>
                    <p><%= cust_no%></p>
                </div>

                <div class="form-group">
                    <label>Quantity:</label>
                    <p><%= quantity%></p>
                </div>

                <div class="form-group">
                    <label>Customer Type:</label>
                    <p><%= custTypeDisplay%></p>
                </div>

                <div class="form-group">
                    <label>Status:</label>
                    <p><%= message%></p>
                </div>

                <div class="form-group">
                    <label>Total Amount:</label>
                    <p>RM <%= String.format("%.2f", total)%></p>
                </div>

                <div class="button-group">
                    <button onclick="window.history.back();" class="btn">Back</button>
                </div>
            </div>
        </div>
    </body>
</html>