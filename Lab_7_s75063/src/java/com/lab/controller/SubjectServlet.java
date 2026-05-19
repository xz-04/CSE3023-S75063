package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SubjectServlet extends HttpServlet {

    private SubjectDAO subjectDAO = new SubjectDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Session Management: Secure identity verification
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }
        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String matricNo = loggedUser.getMatricNo();

        if ("view".equals(action)) {
            // Securely route POST requests for 'view' over to the doGet processor
            doGet(request, response);

        } else if ("add".equals(action)) {
            String code = request.getParameter("subjectCode");
            String name = request.getParameter("subjectName");

            try {
                boolean success = subjectDAO.registerSubject(matricNo, code, name);
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
                } else {
                    response.getWriter().println("Failed to register subject!");
                }
            } catch (Exception e) {
                // This will print the exact reason (e.g., Unknown column, Foreign key failure) directly to your screen!
                response.getWriter().println("<h2>Database Error Encountered:</h2>");
                response.getWriter().println("<pre style='color:red;'>");
                e.printStackTrace(response.getWriter());
                response.getWriter().println("</pre>");
            }

        } else if ("update".equals(action)) {
            // --- UPDATE ACTION ---
            int id = Integer.parseInt(request.getParameter("id"));
            String code = request.getParameter("subjectCode");
            String name = request.getParameter("subjectName");

            // Ownership verification is safely checked inside the SQL layer
            boolean success = subjectDAO.updateSubject(id, matricNo, code, name);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
            } else {
                response.getWriter().println("Failed to update subject! <a href='" + request.getContextPath() + "/SubjectServlet?action=view'>Back</a>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Session Management: Secure identity verification
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }
        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String matricNo = loggedUser.getMatricNo();

        if ("view".equals(action)) {
            // --- READ ACTION ---
            List<SubjectBean> subjects = subjectDAO.getSubjectsByStudent(matricNo);
            request.setAttribute("subjectList", subjects);

            // FIXED: Added leading forward slash to prevent 404 resource mapping issues
            request.getRequestDispatcher("/subject/viewSubject.jsp").forward(request, response);

        } else if ("delete".equals(action)) {
            // --- DELETE ACTION ---
            int id = Integer.parseInt(request.getParameter("id"));

            // Deleting requires both entry primary key and owner's matric number for security
            boolean success = subjectDAO.deleteSubject(id, matricNo);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
            } else {
                response.getWriter().println("Failed to delete subject! <a href='" + request.getContextPath() + "/SubjectServlet?action=view'>Back</a>");
            }

        } else if ("editForm".equals(action)) {
            // --- RENDER UPDATE FORM ACTION ---
            int id = Integer.parseInt(request.getParameter("id"));
            SubjectBean targetSubject = subjectDAO.getSubjectByIdAndStudent(id, matricNo);

            if (targetSubject != null) {
                request.setAttribute("editSubject", targetSubject);

                // FIXED: Added leading forward slash to prevent 404 resource mapping issues
                request.getRequestDispatcher("/subject/updateSubject.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
            }
        }
    }
}
