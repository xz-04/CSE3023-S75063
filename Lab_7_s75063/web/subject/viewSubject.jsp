<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lab.bean.StudentBean" %>
<%@ page import="com.lab.bean.SubjectBean" %>
<%@ page import="java.util.List" %>
<%
    StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }

    List<SubjectBean> subjects = (List<SubjectBean>) request.getAttribute("subjectList");
    if (subjects == null) {
        response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Your Registered Subjects</title>
    </head>
    <body>
        <h2>Registered Subjects List (View)</h2>
        <p>Welcome, <strong><%= loggedUser.getFullname()%> (<%= loggedUser.getMatricNo()%>)</strong></p>
        <hr>

        <div style="margin-bottom: 15px;">
            <button type="button" onclick="window.location.href = '<%= request.getContextPath()%>/subject/registerSubject.jsp'">[+] Register Another Subject</button>
            <button type="button" onclick="window.location.href = '<%= request.getContextPath()%>/dashboard.jsp'">Go To Main Dashboard</button>
        </div>

        <table border="1" cellpadding="8" cellspacing="0" style="width: 80%; border-collapse: collapse;">
            <thead style="background-color: #f2f2f2;">
                <tr>
                    <th>Registration ID</th>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Actions Management</th>
                </tr>
            </thead>
            <tbody>
                <% if (subjects.isEmpty()) { %>
                <tr>
                    <td colspan="4" style="text-align: center; color: gray;">You have not registered for any subjects yet.</td>
                </tr>
                <% } else {
                for (SubjectBean subject : subjects) {%>
                <tr>
                    <td><%= subject.getId()%></td>
                    <td><%= subject.getSubjectCode()%></td>
                    <td><%= subject.getSubjectName()%></td>
                    <td style="text-align: center;">
                        <button type="button" onclick="window.location.href = '<%= request.getContextPath()%>/SubjectServlet?action=editForm&id=<%= subject.getId()%>'">Edit</button>
                        <button type="button" onclick="if (confirm('Are you sure you want to drop <%= subject.getSubjectCode()%>?')) {
                                    window.location.href = '<%= request.getContextPath()%>/SubjectServlet?action=delete&id=<%= subject.getId()%>'; }" style="color: red;">Delete</button>
                    </td>
                </tr>
                <%  }
                }%>
            </tbody>
        </table>
    </body>
</html>