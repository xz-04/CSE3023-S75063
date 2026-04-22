<%-- 
    Document   : forwardInfo
    Created on : Apr 21, 2026, 2:56:45 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Using jsp:forward to display user info</h1>

            <%
                String name = request.getParameter("uname");
                String email = request.getParameter("email");
                String nationality = request.getParameter("nationality");
                String background = request.getParameter("background");
            %>

            <div class="card">
                <h2 class="form-title">Forwarded Info</h2>
                <p>Name: <%= name%></p>
                <p>Email: <%= email%></p>
                <p>Nationality: <%= nationality%></p>
                <p>Background: <%= background%></p>
            </div>
        </div>
    </body>
</html>
