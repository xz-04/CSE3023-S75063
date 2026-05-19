<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lab.bean.StudentBean" %>
<%
    StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register New Subject</title>
    </head>
    <body>
        <h2>Register New Subject</h2>
        <p>Logged in as: <strong><%= loggedUser.getFullname()%> (<%= loggedUser.getMatricNo()%>)</strong></p>
        <hr>

        <form action="<%= request.getContextPath()%>/SubjectServlet" method="POST">
            <input type="hidden" name="action" value="add">

            <table cellpadding="5">
                <tr>
                    <td>Subject Code:</td>
                    <td><input type="text" name="subjectCode" placeholder="e.g., BITM 2113" required></td>
                </tr>
                <tr>
                    <td>Subject Name:</td>
                    <td><input type="text" name="subjectName" placeholder="e.g., Web Development" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">Register Subject</button>
                        <button type="button" onclick="window.location.href = '<%= request.getContextPath()%>/SubjectServlet?action=view'">Cancel & View List</button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>