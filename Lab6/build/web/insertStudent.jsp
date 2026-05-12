<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Registration</title>
        <style>
            body {
                font-family: "Times New Roman", Times, serif;
            }
            fieldset {
                width: 600px;
                border: 1px solid #ccc;
                padding: 10px;
            }
            legend {
                font-size: 14px;
            }
            .form-table td {
                padding: 5px;
            }
            .copyright {
                font-size: 12px;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>

        <form action="processStudent.jsp" method="POST">
            <fieldset>
                <legend>Student Registration</legend>
                <table class="form-table" border="0">
                    <tr>
                        <td>Student No</td>
                        <td>
                            <input type="text" name="stuno" placeholder="E.g.: UKXXXXX" 
                                   pattern="[A-Z]+[0-9]+" required>
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>
                            <input type="text" name="name" placeholder="Enter your name" 
                                   size="30" required>
                        </td>
                    </tr>
                    <tr>
                        <td>Program</td>
                        <td>
                            <select name="program">
                                <option value="BSc. Soft. Eng.">BSc. Soft. Eng.</option>
                                <option value="BSc. with IM">BSc. with IM</option>
                                <option value="BSc. in Networking">BSc. in Networking</option>
                                <option value="BSc. in Robotics">BSc. in Robotics</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Submit">
                            <input type="reset" value="Cancel">
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>

        <div class="copyright">
            ©2016-Mohamad Nor
        </div>

    </body>
</html>