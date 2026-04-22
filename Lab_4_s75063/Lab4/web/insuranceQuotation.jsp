<%-- 
    Document   : insuranceQuotation
    Created on : Apr 21, 2026, 3:13:16 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <h1>Insurance Quotation</h1>
            <form action="processInsuranceQuo.jsp" method="POST">
                <div class="card">
                    <fieldset>
                        <legend>Insurance Calculation</legend>

                        <label for="icno">IC No*</label>
                        <input type="text" id="icno" name="icno" placeholder="E.g. 821210-05-3478" required><br><br>

                        <label for="name">Name*</label>
                        <input type="text" id="name" name="name" placeholder="Enter name" required><br><br>

                        <label for="price">Market Price*</label>
                        <input type="number" id="price" name="price" placeholder="Price" required><br><br>

                        <label for="coverage">Coverage Type</label>
                        <select id="coverage" name="coverage">
                            <option value="1">Third Party</option>
                            <option value="2">Comprehensive</option>
                        </select><br><br>

                        <label for="ncd">No Claims Discount (NCD)</label>
                        <select id="ncd" name="ncd">
                            <option value="0.10">10%</option>
                            <option value="0.20">20%</option>
                            <option value="0.30">30%</option>
                        </select><br>

                        <div class="button-group">
                            <button type="submit" class="btn btn-submit">Submit</button>
                            <button type="submit" class="btn btn-cancel">Cancel</button>
                        </div>
                    </fieldset>
                </div>
            </form>
        </div>
    </body>
</html>
