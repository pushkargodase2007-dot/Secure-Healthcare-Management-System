package HealthCare.Management;

import HealthCare.SQLconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class getdata extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           HttpSession session = request.getSession(true);
            String id = request.getParameter("pid");
            String did = (String) session.getAttribute("did");
            String dname = (String) session.getAttribute("dname");
            String dmail = (String) session.getAttribute("dmail");
            System.out.println(" \n id :" + id + "\n uid:" + did);
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            try {
                ResultSet rs = st.executeQuery("Select * from patients where id ='" + id + "' ");
                if (rs.next()) {
                   String pid = rs.getString("pid");
                   String pname = rs.getString("name");
                    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                    Date date = new Date();
                    String time = dateFormat.format(date);
                    System.out.println("Date and Time : " + time);
                    int i = st1.executeUpdate("INSERT into mdatarequest(dname, did, dmail, pid, pname, reqstatus, reqtime, accesspol, dkey) values('" + dname + "','" + did + "','" + dmail + "','" + pid + "','" + pname + "','waiting', '" + time + "','waiting','Not Generated')");
                    if (i != 0) {
                        response.sendRedirect("DoctorHome.jsp?Sent");
                    }
                } else {
                    response.sendRedirect("DoctorHome.jsp?Failed");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } catch (SQLException ex) {
            Logger.getLogger(getdata.class.getName()).log(Level.SEVERE, null, ex);
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
