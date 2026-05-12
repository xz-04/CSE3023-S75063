<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Author Entry Form</title>
        <style>
            table {
                margin: 20px;
                border: 1px solid #ccc;
                padding: 10px;
            }
            td {
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <h2>Lab 6 - Task 2: Insert Author Data</h2>
        <form action="processAuthor.jsp" method="POST">
            <table>
                <tr>
                    <td><label>Author No:</label></td>
                    <td><input type="text" name="authorNo" required /></td>
                </tr>
                <tr>
                    <td><label>Name:</label></td>
                    <td><input type="text" name="name" required /></td>
                </tr>
                <tr>
                    <td><label>Address:</label></td>
                    <td><input type="text" name="address" /></td>
                </tr>
                <tr>
                    <td><label>City:</label></td>
                    <td><input type="text" name="city" /></td>
                </tr>
                <tr>
                    <td><label>State:</label></td>
                    <td><input type="text" name="state" /></td>
                </tr>
                <tr>
                    <td><label>Zip:</label></td>
                    <td>
                        <select name="zip">
                            <option value="50000">50000</option>
                            <option value="60000">60000</option>
                            <option value="70000">70000</option>
                            <option value="80000">80000</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" /></td>
                    <td><input type="reset" value="Cancel" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>