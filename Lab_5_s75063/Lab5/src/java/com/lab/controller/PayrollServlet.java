/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chiaying
 */
@WebServlet(name = "PayrollServlet", urlPatterns = {"/PayrollServlet"})
public class PayrollServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayrollServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayrollServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Employee> list = new ArrayList<>();
        
        //Adding sample data
        Employee e1 = new Employee();
        e1.setEmpId("e111");
        e1.setName("Ali bin Abu");
        e1.setDepartment("IT");
        e1.setBasicSalary(5000);
        
        Employee e2 = new Employee();
        e2.setEmpId("e222");
        e2.setName("Janet");
        e2.setDepartment("IT");
        e2.setBasicSalary(6000);
        
        Employee e3 = new Employee();
        e3.setEmpId("e333");
        e3.setName("Smith");
        e3.setDepartment("HR");
        e3.setBasicSalary(4000);
        
        Employee e4 = new Employee();
        e4.setEmpId("e444");
        e4.setName("Siti");
        e4.setDepartment("HR");
        e4.setBasicSalary(2500);
        
        Employee e5 = new Employee();
        e5.setEmpId("e555");
        e5.setName("Chris");
        e5.setDepartment("IT");
        e5.setBasicSalary(5000);
        
        list.add(e1);
        list.add(e2);
        list.add(e3);
        list.add(e4);
        list.add(e5);
        
        //Share data with JSP
        request.setAttribute("employeeList", list);
        
        //Forward to View
        RequestDispatcher rd = request.getRequestDispatcher("payroll_view.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
