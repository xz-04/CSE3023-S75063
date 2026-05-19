<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lab.bean.StudentBean" %>
<%@ page import="com.lab.bean.SubjectBean" %>
<%
    StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }

    SubjectBean subject = (SubjectBean) request.getAttribute("editSubject");
    if (subject == null) {
        response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Subject Details</title>
    </head>
    <body>
        <h2>Update Registered Subject (Kemaskini)</h2>
        <hr>

        <form action="<%= request.getContextPath()%>/SubjectServlet" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= subject.getId()%>">

            <table cellpadding="5">
                <tr>
                    <td>Subject Registration ID:</td>
                    <td><input type="text" value="<%= subject.getId()%>" disabled style="background-color: #eee;"></td>
                </tr>
                <tr>
                    <td>Subject Code:</td>
                    <td><input type="text" name="subjectCode" value="<%= subject.getSubjectCode()%>" required></td>
                </tr>
                <tr>
                    <td>Subject Name:</td>
                    <td><input type="text" name="subjectName" value="<%= subject.getSubjectName()%>" required style="width: 250px;"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">Save Changes</button>
                        <button type="button" onclick="window.location.href = '<%= request.getContextPath()%>/SubjectServlet?action=view'">Cancel</button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>