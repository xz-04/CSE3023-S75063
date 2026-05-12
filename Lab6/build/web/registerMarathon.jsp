<%-- 
    Document   : registerMarathon
    Created on : May 12, 2026, 3:29:13 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marathon Registration</title>
        <style>
            body {
                font-family: "Times New Roman", Times, serif;
                margin: 20px;
            }
            fieldset {
                width: 500px;
                border: 1px solid #ccc;
                padding: 10px;
            }
            legend {
                font-size: 14px;
            }
            .form-table td {
                padding: 5px;
            }
            .copyright {
                font-size: 12px;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <form action="processMarathon.jsp" method="POST">
            <fieldset>
                <legend>Marathon Registration</legend>
                <table class="form-table" border="0">
                    <tr>
                        <td>IC No</td>
                        <td>
                            <input type="text" name="icNo" placeholder="E.g.: 921110-10-2514" 
                                   pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" required>
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>
                            <input type="text" name="name" placeholder="Enter your name" 
                                   size="30" required>
                        </td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>
                            <select name="category">
                                <option value="5 KM">5 KM</option>
                                <option value="7 KM">7 KM</option>
                                <option value="10 KM">10 KM</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Submit">
                            <input type="reset" value="Cancel">
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>

        <div class="copyright">
            ©2016-Mohamad Nor
        </div>
    </body>
</html>
