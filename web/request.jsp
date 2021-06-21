<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import=" java.security.MessageDigest"%>
<%

    String str = request.getParameter("id");
    session.setAttribute("str1", str);
    String[] temp;

    String delimiter = ",";

    temp = str.split(delimiter, 4);
    for (int i = 0; i < temp.length; i++) {
    }
    int id = Integer.parseInt((temp[0]));
    String name = temp[1];
    int fid = Integer.parseInt((temp[2]));
    String fname = temp[3];
    String status = "Following";
    ResultSet rs = null;
    PreparedStatement psmt1 = null;

    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);
    System.out.println("current Date " + time);

    try {

        Connection con = SQLconnection.getconnection();

        String sql = null;

        psmt1 = con.prepareStatement("insert into follow(uid,name,fid,fname,status,time) values(?,?,?,?,?,?)");
        psmt1.setInt(1, id);
        psmt1.setString(2, name);
        psmt1.setInt(3, fid);
        psmt1.setString(4, fname);
        psmt1.setString(5, status);
        psmt1.setString(6, time);
        int row = psmt1.executeUpdate();
        if (row > 0) {
            response.sendRedirect("people.jsp?following_successfully");
        } else {
            response.sendRedirect("people.jsp?following_failed");
        }
        con.close();
        psmt1.close();

    } catch (Exception ex) {

        out.println("Error in connection : " + ex);

    }

%>
