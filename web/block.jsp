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

    Statement sr1 = con.createStatement();
    Statement sr2 = con.createStatement();
    Statement sr3 = con.createStatement();
    Statement sr4 = con.createStatement();
    Statement sr5 = con.createStatement();

    String msg = (String) session.getAttribute("message");
    String ms = msg.toLowerCase();

    System.out.println("Checking  : " + msg);

    boolean bol = false;
    Statement st = con.createStatement();
    Statement sd = con.createStatement();

    String temp1 = "";

    ResultSet rt;
    StringBuffer sb = new StringBuffer();
    String[] sens1 = ms.split(" ");

    for (String sen : sens1) {
        String[] words = sen.split(" ");
        for (String word : words) {
            rt = sd.executeQuery("SELECT * FROM emotion_words where words='" + word + "'");
            if (!rt.next()) {
                sb.append(word + " ");
            }
        }
        temp1 = sb.toString();
    }

    String[] msg1 = temp1.split(" ");

    ResultSet rs = st.executeQuery("select * from happy");
    while (rs.next()) {
        String val1 = rs.getString("happy").toLowerCase();
        for (String word : msg1) {
            if (word.indexOf(val1) >= 0) {

                String query = "update tweet set status='Happy' where msg='" + msg + "'";
                st1.executeUpdate(query);

                bol = false;
                break;

            }
        }

    }

    ResultSet rs1 = sr1.executeQuery("select * from sad");
    while (rs1.next()) {
        String val2 = rs1.getString("sad").toLowerCase();
        for (String word : msg1) {
            if (word.indexOf(val2) >= 0) {
                String query = "update tweet set status= concat(status,',Sad') where msg='" + msg + "'";

                st2.executeUpdate(query);

                bol = false;
                break;
            }
        }
    }

    ResultSet rs2 = sr2.executeQuery("select * from surprise");
    while (rs2.next()) {
        String val3 = rs2.getString("surprise").toLowerCase();
        for (String word : msg1) {
            if (word.indexOf(val3) >= 0) {
                String query = "update tweet set status= concat(status,',Surprise') where msg='" + msg + "'";
                st3.executeUpdate(query);

                bol = false;
                break;
            }
        }
    }

    ResultSet rs3 = sr3.executeQuery("select * from anger");
    while (rs3.next()) {
        String val4 = rs3.getString("anger").toLowerCase();
        for (String word : msg1) {
            if (word.indexOf(val4) >= 0) {
                String query = "update tweet set status= concat(status,',Anger') where msg='" + msg + "'";
                st4.executeUpdate(query);

                bol = false;
                break;

            }
        }
    }

    ResultSet rs4 = sr4.executeQuery("select * from disgust");
    while (rs4.next()) {
        String val5 = rs4.getString("disgust").toLowerCase();
        for (String word : msg1) {
            if (word.indexOf(val5) >= 0) {
                String query = "update tweet set status= concat(status,',Disgust') where msg='" + msg + "'";

                st5.executeUpdate(query);

                bol = false;
                break;
            }
        }
    }

    if (bol == true) {
        st6.executeUpdate("update tweet set status='Neutral' where msg='" + msg + "'");

        response.sendRedirect("tweet.jsp?sucess");
    } else {
        response.sendRedirect("tweet.jsp?tweet_added");
    }


%>

