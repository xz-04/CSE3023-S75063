<%-- 
    Document   : jspParameter
    Created on : Apr 21, 2026, 2:45:03 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Using JSP Standard Action</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Using jsp:include and jsp:param to display information on JSP Page</h1>
            <%
                String sCode = "CSE3023";
                String sSubject = "Web-based Application Development";
                String sCredit = "3(2+1)";
            %>

            <div class="card">
                <jsp:include page="subjectInfo.jsp" flush="true">
                    <jsp:param name="code" value="<%= sCode%>" />
                    <jsp:param name="subject" value="<%= sSubject%>" />
                    <jsp:param name="credit" value="<%= sCredit%>" />
                </jsp:include>
            </div>
        </div>
    </body>
</html>
