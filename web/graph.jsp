<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE HTML>
<html>
    <head>
    <form>
        <input type="button" style="float: right;background-color: #1DA1F2;width: 100px;height: 25px;" value="Go back!" class="btn-primary" onclick="history.back()">
    </form>
    <h1 align="center">Performance Analysis</h1>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
       
            google.charts.load('current', {'packages': ['bar']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Emotions', 'Tweet counts', ],
                    ['Happy', 4.3, ],
                    ['Sad', 2.8, ],
                    ['Surprise', 3.5, ],
                    ['Anger', 3.1, ],
                    ['Disgust', 1.2, ],
                ]);

                var options = {
                    chart: {
                        title: 'Tweet',
                        subtitle: 'Emotions',
                    }
                };

                var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
           
    </script>
    

</head>
<body>

    <div align="center" id="columnchart_material"  style="width: 800px; height: 500px;"></div>









</body>
</html>

