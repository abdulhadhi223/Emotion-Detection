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
                                    <a class="nav-link" href="people.jsp">People</a>
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
                            <%
                                String id = (String) session.getAttribute("uid");
                                String name = (String) session.getAttribute("uname");
                                String email = (String) session.getAttribute("umail");
                                System.out.println("Seseeion Values : " + id + name + email);
                                Statement st = SQLconnection.getconnection().createStatement();
                                ResultSet rt = st.executeQuery("select * from user_reg where  id='" + id + "' ");
                                if (rt.next()) {
                                    String dob = rt.getString("dob");
                                    String address = rt.getString("address");

                            %>
                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                                <div class="page-wrapper">
                                    <div class="row">
                                        <div class="container">
                                            <center><h1 class="title-section"><span class="title-regular"><strong>Your Profile</strong></span><br/></h1></center>
                                            <form method="post" action="">
                                                <br><br>
                                                <img src="Getimage?id=<%=id%>" width="300" height="300" class="float-right">
                                                <div class="form-group">
                                                    <label>Name :</label><br><input type="text" readonly="" value="<%=name%>" style="width: 320px;height: 40px;color: black;" class="form-group" name="username" placeholder="Enter Your Name">
                                                </div>
                                                <div class="form-group">
                                                    <label>D O B :</label><br><input type="date" readonly="" value="<%=dob%>" style="width: 320px;height: 40px;color: black;" class="form-group" name="username" placeholder="Enter Your Name">
                                                </div>
                                                <div class="form-group">
                                                    <label>Email :</label><br><input type="text" readonly="" value="<%=email%>" style="width: 320px;height: 40px;color: black;" class="form-group" name="email" placeholder="Enter Your Email ID">
                                                </div>
                                                <div class="form-group">
                                                    <label>Address :</label><br><textarea type="text" readonly="" style="width: 320px;height: 40px;color: black;" class="form-group" name="email" placeholder="Enter Your Email ID"><%=address%></textarea>
                                                </div>
                                            </form> 
                                            <%
                                                }
                                            %>
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