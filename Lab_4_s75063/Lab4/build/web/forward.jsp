<%-- 
    Document   : forward
    Created on : Apr 21, 2026, 2:55:53 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Using JSP Standard Action (Forward)</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Using jsp:forward to display user information</h1>
            <jsp:forward page="forwardInfo.jsp">
                <jsp:param name="uname" value="Wan Nural Jawahir Hj Wan Yussof" />
                <jsp:param name="email" value="wannurwy@umt.edu.my" />
                <jsp:param name="nationality" value="Malaysia" />
                <jsp:param name="background" value="Lecturer" />
            </jsp:forward>
        </div>
    </body>
</html>
