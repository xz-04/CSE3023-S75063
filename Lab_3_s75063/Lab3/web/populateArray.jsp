<%-- 
    Document   : populateArray
    Created on : Apr 14, 2026, 2:36:27 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            table {
                border-collapse: collapse;
                margin: auto;
                width: 60%;
                font-family: Arial;
                text-align: center;
            }

            th {
                background-color: #d4b25c;
                color: black;
                padding: 10px;
                border: 1px solid grey;
            }

            td {
                padding: 10px;
                background-color: #f2f2f2;
                border: 1px solid grey;
            }

            tr:nth-child(even) td {
                background-color: #e6e6e6;
            }

            h1 {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <h1>Read Java array and populate it into HTML table.</h1>
    <center>
        <fieldset>
            <%
                String[][] salesman = {{"Salesman", "Jan", "Feb", "Mar"},
                {"Salesman 1", "2500", "2100", "2200"},
                {"Salesman 2", "2000", "1900", "2400"},
                {"Salesman 3 ", "1800", "2200", "2450"}};

                out.println("<table>");

                for (int i = 0; i < salesman.length; i++) {
                    out.println("<tr>");

                    for (int j = 0; j < salesman[i].length; j++) {
                        if (i == 0) {
                            // Header row
                            out.println("<th>" + salesman[i][j] + "</th>");
                        } else {
                            out.println("<td>" + salesman[i][j] + "</td>");
                        }
                    }

                    out.println("</tr>");
                }
                out.println("</table>");


            %>
        </fieldset>
    </center>
    &copy;2026-Syafiq

</body>
</html>
