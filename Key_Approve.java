package HealthCare.Management;

import HealthCare.SQLconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Key_Approve extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            String pid = request.getParameter("pid");
            String accesspol = request.getParameter("accesspol");
            System.out.println("id  "+id);
            System.out.println("pid  "+pid);
            System.out.println("accesspol  "+accesspol);
            
                Connection conn = SQLconnection.getconnection();
            Statement st = conn.createStatement();
            Statement sto = conn.createStatement();
            
            ResultSet rs = st.executeQuery("select * from medicalrecords where pid='" + pid + "'");
            rs.next();
            String dkey =rs.getString("skey");
            try {
                int i = sto.executeUpdate("update mdatarequest set reqstatus='Approved',accesspol='"+accesspol+"',dkey='"+dkey+"'  where id='" + id + "'");
                System.out.println("test print==" + id);
                if (i != 0) {
                    response.sendRedirect("AccessRequest.jsp?Approved");
                } else {
                    System.out.println("failed");
                    response.sendRedirect("AccessRequest.jsp?Failed");
                }
            } catch (IOException | SQLException ex) {
            }
        } catch (SQLException ex) {
            Logger.getLogger(DoctorActivate.class.getName()).log(Level.SEVERE, null, ex);
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
