/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.Searchcontrol;

import dao.DOCGIADAO;
import dao.NVDAO;
import dao.THEDGDAO;
import entity.DOCGIA;
import entity.NHANVIEN;
import entity.THEDG;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchTDG", urlPatterns = {"/searchTDG"})
public class SearchTDG extends HttpServlet {

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
            out.println("<title>Servlet SearchTDG</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchTDG at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        //processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        String hoten = request.getParameter("search");
        
        THEDGDAO dao = new THEDGDAO();
        List<THEDG> listtdg = dao.SearchByName(hoten);
        
        DOCGIADAO dgdao = new DOCGIADAO();
        List<DOCGIA> listdg = dgdao.LayDocGIa();
        
        NVDAO nvdao = new NVDAO();
        List<NHANVIEN> listnv = nvdao.LayNHANVIEN();
        
        request.setAttribute("listNV", listnv);
        request.setAttribute("listTDG", listtdg);
        request.setAttribute("listDG", listdg);
        request.setAttribute("searchTDG", hoten);
        request.getRequestDispatcher("thedocgia.jsp").forward(request, response);
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
