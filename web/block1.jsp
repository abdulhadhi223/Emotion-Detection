<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    Connection con = SQLconnection.getconnection();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    Statement st4 = con.createStatement();
    Statement st5 = con.createStatement();
    Statement st6 = con.createStatement();

    String msg = (String) session.getAttribute("message");
    System.out.println("Checking  : " + msg);
    boolean bol = false;

    String ms = msg.toLowerCase();

    Statement st = con.createStatement();
    Statement sd = con.createStatement();
    String Query = "select * from emotion_words";
    ResultSet rs = st.executeQuery(Query);

    String temp1 = "";

    ResultSet rt;
    StringBuffer sb = new StringBuffer();
    String[] sens = ms.split(" ");

    for (String sen : sens) {
        String[] words = sen.split(" ");
        for (String word : words) {
            rt = sd.executeQuery("SELECT * FROM emotion_words where words='" + word + "'");
            if (!rt.next()) {
                sb.append(word + " ");
            }
        }
        temp1 = sb.toString();
    }
    String[] word = temp1.split(" ");
    try {
        while (rs.next()) {
            String val1 = rs.getString("happy").toLowerCase();
            String val2 = rs.getString("sad").toLowerCase();
            String val3 = rs.getString("surprise").toLowerCase();
            String val4 = rs.getString("anger").toLowerCase();
            String val5 = rs.getString("disgust").toLowerCase();
            System.out.println("val1 is :" + val1);
            for (String msg1 : word) {
                if (val1.indexOf(msg1) >= 0) {

                    st1.executeUpdate("update tweet set status='1' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val2.indexOf(msg1) >= 0) {

                    st2.executeUpdate("update tweet set status='2' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val3.indexOf(msg1) >= 0) {
                    st3.executeUpdate("update tweet set status='3' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {

                if (val4.indexOf(msg1) >= 0) {
                    st4.executeUpdate("update tweet set status='4' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val5.indexOf(msg1) >= 0) {
                    st5.executeUpdate("update tweet set status='5' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
        }
        if (bol == true) {
            st6.executeUpdate("update tweet set status='0' where msg='" + msg + "'");

            response.sendRedirect("tweet.jsp?sucess");
        } else {
            response.sendRedirect("tweet.jsp?tweet_added");
        }
    } catch (Exception ex) {
        System.out.println(ex);
    }

%>

