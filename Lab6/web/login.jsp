<%-- 
    Document   : login
    Created on : May 12, 2026, 4:06:13 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <body>
        <h2>System Login</h2>
        <%
            String msg = request.getParameter("msg");
            if (msg != null)
                out.print("<p style='color:red'>" + msg + "</p>");
        %>
        <form action="doLogin.jsp" method="POST">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
