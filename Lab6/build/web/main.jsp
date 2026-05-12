<%-- 
    Document   : main
    Created on : May 12, 2026, 4:06:50 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h2>Welcome to the Main Page</h2>
        <p><b>Username:</b> <%= session.getAttribute("user")%></p>
        <p><b>First Name:</b> <%= session.getAttribute("fname")%></p>
        <p><b>Last Name:</b> <%= session.getAttribute("lname")%></p>
        <br>
        <a href="login.jsp">Logout</a>
    </body>
</html>
