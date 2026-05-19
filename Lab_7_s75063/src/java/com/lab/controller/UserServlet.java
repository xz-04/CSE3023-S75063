package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.dao.StudentDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // max 16 MB
public class UserServlet extends HttpServlet {

    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = null;
        String contentType = request.getContentType();

        // Check if the request is actually a multipart/form-data payload (Registration)
        if (contentType != null && contentType.startsWith("multipart/form-data")) {
            Part actionPart = request.getPart("action");
            action = (actionPart != null) ? getValueFromPart(actionPart) : null;
        } else {
            // Standard payload (Login)
            action = request.getParameter("action");
        }

        // --- 1. HANDLE REGISTRATION ---
        if ("register".equals(action)) {
            StudentBean newStudent = new StudentBean();

            Part matricPart = request.getPart("matricNo");
            Part namePart = request.getPart("fullname");
            Part passPart = request.getPart("password");

            newStudent.setMatricNo((matricPart != null) ? getValueFromPart(matricPart) : null);
            newStudent.setFullname((namePart != null) ? getValueFromPart(namePart) : null);
            newStudent.setPassword((passPart != null) ? getValueFromPart(passPart) : null);

            InputStream inputStream = null;
            Part filePart = request.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
            }

            boolean isSuccess = studentDAO.registerStudent(newStudent, inputStream);
            if (isSuccess) {
                response.getWriter().println("Registration Successful! <a href='login.html'>Login here</a>");
            } else {
                response.getWriter().println("Registration Failed! Check database structure or logs.");
            }

            // --- 2. HANDLE LOGIN ---
        } else if ("login".equals(action)) {
            String matric = request.getParameter("matricNo");
            String pass = request.getParameter("password");

            StudentBean student = studentDAO.loginStudent(matric, pass);
            if (student != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedUser", student); // Binds student back into memory securely
                response.sendRedirect("dashboard.jsp");
            } else {
                response.getWriter().println("Invalid Credentials! <a href='login.html'>Try Again</a>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if ("logout".equals(action)) {
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("login.html");
        } else if ("delete".equals(action)) {
            if (session != null && session.getAttribute("loggedUser") != null) {
                StudentBean user = (StudentBean) session.getAttribute("loggedUser");
                studentDAO.deleteStudent(user.getMatricNo());
                session.invalidate();
            }
            response.sendRedirect("register.html");
        }
    }

    private String getValueFromPart(Part part) throws IOException {
        try (java.io.BufferedReader reader = new java.io.BufferedReader(
                new java.io.InputStreamReader(part.getInputStream(), "UTF-8"))) {
            StringBuilder value = new StringBuilder();
            char[] buffer = new char[1024];
            int length;
            while ((length = reader.read(buffer)) > 0) {
                value.append(buffer, 0, length);
            }
            return value.toString().trim();
        }
    }
}
