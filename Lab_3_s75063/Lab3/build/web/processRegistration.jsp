<%-- 
    Document   : processRegistration
    Created on : Apr 14, 2026, 8:21:00 PM
    Author     : chiaying
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <fieldset>
            <h1>Details of registration : </h1>
            <%
                String student_name = "";
                String matric_no = "";
                String selected_club = "";

                student_name = request.getParameter("student_name");
                matric_no = request.getParameter("matric_no");
                selected_club = request.getParameter("selected_club");

                // Sove the result to arraylist
                ArrayList<String[]> registered_student_list = (ArrayList<String[]>) application.getAttribute("studentList");

                if (registered_student_list == null) {
                    registered_student_list = new ArrayList<String[]>();
                }

                if (student_name != null && matric_no != null && selected_club != null) {
                    String[] student = {student_name, matric_no, selected_club};
                    registered_student_list.add(student);

                    application.setAttribute("studentList", registered_student_list);
                }
            %>

            <p>Student Name : <%= student_name%></p>
            <p>Matric No. : <%= matric_no%></p>
            <p>Selected Club : <%= selected_club%></p>
        </fieldset>
        <%@ include file="footer.jsp" %>
    </body>
</html>
