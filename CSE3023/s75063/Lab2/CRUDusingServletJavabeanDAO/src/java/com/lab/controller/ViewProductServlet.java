package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.label.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chiaying
 */
public class ViewProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

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
            out.println("<title>Servlet ViewProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewProductServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        List<Product> listProduct = productDAO.selectAllProduct();//Panggil DAO

        out.println("<h2>Product List (Using DAO)</h2>");
        out.println("<table border='1'><tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Qunatity</th><th>Actions</th></tr>");

        for (Product product : listProduct) {
            out.print("<tr>");
            out.print("<td>" + product.getId() + "</td>");
            out.print("<td>" + product.getName() + "</td>");
            out.print("<td>" + product.getCategory() + "</td>");
            out.print("<td>" + product.getPrice() + "</td>");
            out.print("<td>" + product.getQuantity() + "</td>");
            out.print("<td><a href='UpdateProductServlet?id=" + product.getId() + "'>Edit</a> | ");
            out.print("<a href='DeleteProductServlet?id=" + product.getId() + "'>Delete</a></td>");
            out.println("</tr>");
        }
        out.println("</table>");
        out.println("<br><a href='add_product.html'>Add New Product</a>");
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
