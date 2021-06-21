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
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/Tweets")
@MultipartConfig(maxFileSize = 16177215)
public class Tweets extends HttpServlet {

    private SimpleDateFormat format;

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException, Exception {

        HttpSession session = request.getSession(true);
        String userid = (String) session.getAttribute("uid");
        String uname = (String) session.getAttribute("uname");
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

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);
        System.out.println("current Date " + time);

        Connection conn = SQLconnection.getconnection();

        try {
            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();
            String sql = "INSERT INTO tweet (uid, username, msg, photo, reply, time) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, userid);
            statement.setString(2, uname);
            statement.setString(3, msg);

            if (inputStream != null) {
                statement.setBlob(4, inputStream);
            }
            statement.setString(5, "0");
            statement.setString(6, time);
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("block1.jsp?success");
            } else {
                response.sendRedirect("tweet.jsp?Failed");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Tweets.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Tweets.class.getName()).log(Level.SEVERE, null, ex);
        }
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
