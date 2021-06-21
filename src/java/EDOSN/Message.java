/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package EDOSN;

import DBconnection.SQLconnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/Msg")
@MultipartConfig(maxFileSize = 16177215)
public class Message extends HttpServlet {


    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        String userid = (String) session.getAttribute("uid");
        String uname = (String) session.getAttribute("uname");
        String fid = (String) session.getAttribute("sfid");
        String fname = (String) session.getAttribute("sfname");
        String msg = request.getParameter("msg");
        session.setAttribute("message", msg);
        InputStream inputStream = null;
        Part filePart = request.getPart("file");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            inputStream = filePart.getInputStream();
        }

        Connection conn = SQLconnection.getconnection();

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);
        System.out.println("current Date " + time);

        try {
            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();

            String sql = "INSERT INTO message (uid, username, fid, fname, msg, photo, time) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, userid);
            statement.setString(2, uname);
            statement.setString(3, fid);
            statement.setString(4, fname);
            statement.setString(5, msg);

            if (inputStream != null) {
                statement.setBlob(6, inputStream);
            }
            
            statement.setString(7, time);
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("msg.jsp?success");
            } else {
                response.sendRedirect("msg.jsp?Failed");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
