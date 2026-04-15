<%-- 
    Document   : mainPage
    Created on : Apr 14, 2026, 4:24:01 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Include directive</title>

        
</head>
<body>
    <%@ include file="headerPage.jsp" %>

    <p>Java Server Page(JSP) is a technology for controlling the content
        or appearance of Web pages through the use of servlets, small
        programs that are specified in the Web page and run on the Web server
        to modify the Web page before it is sent to the user who requested it.</p>

    <%@ include file="footerPage.jsp" %>
</body>
</html>
