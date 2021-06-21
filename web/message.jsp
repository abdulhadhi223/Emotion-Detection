<%-- 
    Document   : User_login
    Created on : 4 Feb, 2021, 6:26:39 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBconnection.SQLconnection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Site Metas -->
        <title>Emotion Detection in Online Social Networks</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <!-- Design fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700" rel="stylesheet"> 
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <!-- FontAwesome Icons core CSS -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <!-- Animate styles for this template -->
        <link href="css/animate.css" rel="stylesheet">
        <!-- Responsive styles for this template -->
        <link href="css/responsive.css" rel="stylesheet">
        <!-- Colors for this template -->
        <link href="css/colors.css" rel="stylesheet">
        <!-- Version Marketing CSS for this template -->
        <link href="css/version/marketing.css" rel="stylesheet">
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 1px solid white;
            padding: 10px;
        }


        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #1DA1F2;
            color: white;
        }
    </style>
    <body>
        <div id="wrapper">
            <header class="market-header header">
                <div class="container-fluid">
                    <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarCollapse">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="User_Home.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="profile.jsp">Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="tweet.jsp">Tweet</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="timeline.jsp">Timeline</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="people.jsp">People</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="index.html">Logout</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div><!-- end container-fluid -->
            </header><!-- end market-header -->
            <section id="cta" class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-12 align-self-center">
                            <h2><b>Emotion Detection in Online Social Networks:
                                    A Multi-label Learning Approach</b></h2>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section lb">
                <div class="container">
                    <div class="row">
                        <div class="row">
                            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                                <div class="sidebar">
                                    <div class="widget">
                                        <h2 class="widget-title">MENU</h2>
                                        <div class="link-widget">
                                            <ul>
                                                <li><a href="User_Home.jsp">Home</a></li>
                                                <li><a href="profile.jsp">Profile</a></li>
                                                <li><a href="tweet.jsp">Tweet</a></li>
                                                <li><a href="message.jsp">Message</a></li>
                                                <li><a href="view_messages.jsp">View Message</a></li>
                                                <li><a href="followers.jsp">Followers</a></li>
                                                <li><a href="following.jsp">Following</a></li>
                                            </ul>
                                        </div><!-- end link-widget -->
                                    </div><!-- end widget -->
                                </div><!-- end sidebar -->
                            </div>
                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                                <div class="page-wrapper">
                                    <div class="row">
                                        <div class="container">
                                            <center><h1 class="title-section"><span class="title-regular"><strong>Message</strong></span><br/></h1></center><br>
                                            <table>
                                                <img src="images/twtmsg.jpg" width="300" height="300" class="float-right">
                                                <tr>
                                                    <th style="text-align: center;width: 200px; font-size: 16px; color: black">User Name</th>
                                                    <th style="text-align: center;width: 200px;  font-size: 16px; color: black">Chat</th>
                                                </tr>
                                                <tr>
                                                    <%
                                                        String id = (String) session.getAttribute("uid");
                                                        String name = (String) session.getAttribute("uname");
                                                        String email = (String) session.getAttribute("umail");
                                                        Connection con5 = SQLconnection.getconnection();
                                                        Statement st5 = con5.createStatement();
                                                        String sql3 = "select * from user_reg where id!='" + id + "'";
                                                        try {
                                                            ResultSet rs5 = st5.executeQuery(sql3);
                                                            while (rs5.next()) {
                                                    %>
                                                    <td style="font-size: 16px; color: #000033"><center><%=rs5.getString("name")%></center></td>  
                                                <td style="font-size: 16px; color: #000033"><center><a href="msg.jsp?fid=<%=rs5.getString("id")%>&fname=<%=rs5.getString("name")%>" class="btn btn-link btn-lg">Message</a></center></td>  
                                                </tr>
                                                <%
                                                        }
                                                    } catch (Exception ex) {
                                                        ex.printStackTrace();
                                                    }

                                                %>
                                            </table><br><br><br><br><br><br>
                                            </center>
                                        </div>
                                    </div>
                                </div><!-- end page-wrapper -->
                            </div>
                        </div><!-- end col -->
                    </div><!-- end row -->
                </div><!-- end container -->
            </section>
            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <br>
                            <br>
                            <div class="copyright">&copy;2021.</div>
                        </div>
                    </div>
                </div><!-- end container -->
            </footer><!-- end footer -->
        </div><!-- end wrapper -->
        <!-- Core JavaScript
        ================================================== -->
        <script src="js/jquery.min.js"></script>
        <script src="js/tether.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/animate.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>