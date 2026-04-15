<%-- 
    Document   : feeCalculator
    Created on : Apr 14, 2026, 8:35:04 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fee Calculation</title>

    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>Fee Calculation</h1>
        <form id="feeCalculation" method="get">
            <fieldset>
                <legend>Fee Calculation</legend>
                <div class="form-group">
                    <label for="num">Number of activity joined : </label>
                    <input type="number" id="num" name="num" required><br/>

                    <input type="submit" value="Calculate"/>
                </div>

                <%
                    String num = "0";
                    int activity_fee = 10;
                    double total_fee = 0.0;

                    num = request.getParameter("num");

                    if (num != null && !num.isEmpty()) {
                        total_fee = Integer.parseInt(num) * activity_fee;
                    }


                %>

                Total Fee = RM<%= String.format("%.2f", total_fee)%>
            </fieldset>
        </form>
        <%@ include file="footer.jsp" %>
    </body>
</html>
