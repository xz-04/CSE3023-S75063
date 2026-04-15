<%-- 
    Document   : registerClub
    Created on : Apr 14, 2026, 8:15:54 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <style>
            .form-group {
                margin-bottom: 10px;
            }

            .form-group label {
                display: inline-block;
                width: 110px;   /* 🔥 controls alignment */
            }

            .form-group input,
            .form-group select {
                width: 150px;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>Registration</h1>
        <form id="registration" action="processRegistration.jsp" method="post">
            <fieldset>
                <legend>Registration form</legend>

                <div class="form-group">
                    <label for="student_name">Student Name : </label>
                    <input type="text" id="student_name" name="student_name" placeholder="Name" required><br/>

                    <label for="matric_no">Matric No. : </label>
                    <input type="text" id="matric_no" name="matric_no" placeholder="Matric no" required><br/>

                    <label for="selected_club">Selected Club : </label>
                    <input type="text" id="selected_club" name="selected_club" placeholder="Club" required>
                </div>

                <input type="submit" id="btnSubmit" value="Submit">
                <input type="reset" id="btnCancel" value="Cancel">
            </fieldset>
        </form>
        <%@ include file="footer.jsp" %>
    </body>
</html>
