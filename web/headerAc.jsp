<%-- 
    Document   : headerAc
    Created on : Jan 9, 2018, 11:07:36 PM
    Author     : SHUBHAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <nav class="navbar navbar-inverse" style="border-bottom:8px solid #007AF4;">
    <div class="container-fluid">
        <a class="navbar-brand">
            <img src="images/f.jpg" alt="logo" style="width:75px;height: 45px;">
        </a>
        <!-- Logo -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">SJ Fee Manager</a>
        </div>

        <!-- Menu Items -->
        <div class="collapse navbar-collapse" id="mainNavBar">
            <ul class="nav navbar-nav">
                <li><a data-toggle="tab" href="#home">Home</a></li>
                <li><a data-toggle="tab" href="#student">Student</a></li>
                <li><a data-toggle="tab" href="#course">Course</a></li>
                <li><a data-toggle="tab" href="#cp">Change Password</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> About</a></li>
                <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
            </ul>
        </div>

    </div>
</nav>
