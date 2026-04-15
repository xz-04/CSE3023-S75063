<%-- 
    Document   : memberRegister
    Created on : Apr 14, 2026, 11:39:44 AM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Passing data from main JSP page to other JSP page</h1>

        <form id="memberFrm" action="memberProcessing.jsp" method="post" onsubmit="return checkICNo()">
            <fieldset>
                <legend>Member Registration</legend>

                <label for="icno">IC. No</label>
                <input type="text" id="icno" name="my_icno" size="15" placeholder="E.g. 930123034567"><br/>

                <label for="name">Name</label>
                <input type="text" id="name" name="my_name" size="45" placeholder="Key-in your name"><br/>

                <p>
                    <input type="submit" id="btnSubmit" value="Submit">
                    <input type="reset" id="btnCancel" value="Cancel">
                </p>
            </fieldset>
        </form>

        &copy;2026-Syafiq
    </body>
</html>
