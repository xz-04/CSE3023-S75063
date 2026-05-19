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
        <title>Student Dashboard</title>
        <style>
            .profile-card {
                display: flex;
                align-items: center;
                background-color: #f9f9f9;
                padding: 15px;
                border-radius: 8px;
                border: 1px solid #ddd;
                margin-bottom: 20px;
                width: fit-content;
            }
            .profile-img {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                object-fit: cover;
                margin-right: 20px;
                border: 2px solid #333;
            }
            .menu-box {
                background-color: #eef2f7;
                padding: 20px;
                border-radius: 8px;
                border: 1px solid #b0c4de;
                width: fit-content;
            }
            .btn-group {
                display: flex;
                flex-direction: column;
                gap: 12px;
            }
            .btn {
                padding: 10px 20px;
                font-size: 14px;
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
                border: 1px solid #ccc;
                background-color: #fff;
                text-align: center;
            }
            .btn-primary {
                background-color: #0056b3;
                color: white;
                border-color: #004085;
            }
            .btn-secondary {
                background-color: #6c757d;
                color: white;
                border-color: #545b62;
            }
            .btn-danger {
                background-color: #dc3545;
                color: white;
                border-color: #bd2130;
            }
            .danger-zone {
                margin-top: 30px;
                padding: 15px;
                border: 1px dashed red;
                width: fit-content;
            }
        </style>
    </head>
    <body>

        <h2>Main Student Dashboard</h2>
        <hr>

        <div class="profile-card">
            <%
                String base64Image = loggedUser.getBase64Image();
                if (base64Image != null && !base64Image.isEmpty()) {
            %>
            <img src="data:image/jpeg;base64,<%= base64Image%>" alt="Profile Picture" class="profile-img">
            <% } else { %>
            <div class="profile-img" style="background-color: #ccc; display: flex; align-items: center; justify-content: center; font-size: 12px;">No Image</div>
            <% }%>
            <div>
                <h3>Welcome back, <%= loggedUser.getFullname()%>!</h3>
                <p><strong>Matric Number:</strong> <%= loggedUser.getMatricNo()%></p>
            </div>
        </div>

        <h3>Academic Management</h3>
        <div class="menu-box">
            <div class="btn-group">
                <form action="<%= request.getContextPath()%>/SubjectServlet" method="POST">
                    <input type="hidden" name="action" value="view">
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Manage & View Registered Subjects</button>
                </form>

                <button type="button" class="btn btn-secondary" style="width: 100%;" 
                        onclick="window.location.href = '<%= request.getContextPath()%>/subject/registerSubject.jsp'">
                   Register for a New Subject
                </button>
            </div>
        </div>

        <br>

        <form action="<%= request.getContextPath()%>/UserServlet" method="GET">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="btn" style="background-color: #e1e1e1;">Logout From System</button>
        </form>

        <div class="danger-zone">
            <h4 style="color: red; margin-top: 0;">Danger Zone</h4>
            <form action="<%= request.getContextPath()%>/UserServlet" method="GET" 
                  onsubmit="return confirm('Are you sure you want to delete your student account? All course registrations will be permanently lost.');">
                <input type="hidden" name="action" value="delete">
                <button type="submit" class="btn btn-danger">Delete Account Permanently</button>
            </form>
        </div>

    </body>
</html>