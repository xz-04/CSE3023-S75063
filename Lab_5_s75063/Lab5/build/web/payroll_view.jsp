<%-- 
    Document   : payroll_view
    Created on : Apr 29, 2026, 4:12:20 PM
    Author     : chiaying
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee List</title>
    </head>
    <body>
        <table border="1" cellpadding="8">
            <thead>
                <tr style="background-color: lightgray;">
                    <th>No.</th>
                    <th>Emp ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Basic Salary</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${employeeList}" var="employee" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${employee.empId}</td>
                    <td>${employee.name}</td>
                    <td>${employee.department}</td>
                    <td>${employee.basicSalary}</td>
                    <td>
                            <c:choose>
                                <c:when test="${employee.basicSalary >= 3000}">
                                    <span class="senior">Senior</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="junior">Junior</span>
                                </c:otherwise>
                            </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </body>
</html>
