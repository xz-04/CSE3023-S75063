<%-- 
    Document   : subjectInfo
    Created on : Apr 21, 2026, 2:46:29 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Subject Information</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="container">
            <h2 class="form-title">Calling SubjectInfo.Jsp Page</h2>

            <p>Code: <%= request.getParameter("code")%></p>
            <p>Subject: <%= request.getParameter("subject")%></p>
            <p>Credit: <%= request.getParameter("credit")%></p>
        </div>
    </body>
</html>