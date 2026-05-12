<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Error Encountered</title>
    </head>
    <body>
        <form id="errorForm" action="insertStudent.jsp" method="post">
            <<h1>Lab 9 - Task 1 - Perform creating and retrieving records via JSP page</h1>
            <p><jsp:expression>exception.getMessage()</jsp:expression></p>
            <br>
        </form>
    </body>
</html>