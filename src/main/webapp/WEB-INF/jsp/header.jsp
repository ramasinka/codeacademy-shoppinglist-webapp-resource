<%--
  Created by IntelliJ IDEA.
  User: CodeAcademy
  Date: 2017.07.27
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <!-- Bootstrap core JavaScript -->
    <script src="../../vendor/popper/popper.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="www.codeacademy.lt">CodeAcademy</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">

            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/main">Home</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="/lists ">Shopping lists</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="/shareHistory">Share history</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <security:authorize access="isAuthenticated()">
                            <security:authentication property="principal"/>

                        </security:authorize>
                        <span class="glyphicon glyphicon-user pull-right"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Account Settings <span class="glyphicon glyphicon-cog pull-right"></span></a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#">User stats <span class="glyphicon glyphicon-stats pull-right"></span></a></li>
                        <li class="divider"></li>
                        <li><a href="#">Messages <span class="badge pull-right"> 42 </span></a></li>
                        <li class="divider"></li>
                        <li><a href="#">Favourites Snippets <span
                                class="glyphicon glyphicon-heart pull-right"></span></a></li>
                        <li class="divider"></li>
                        <li><a href="/logout" onclick="logOut()">Sign Out <span
                                class="glyphicon glyphicon-log-out pull-right"></span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>

<script>
    function logOut() {
        $.getJSON("http://localhost:8081/auth/logout", function (json) {
            console.log("LOG OUT SUCCESS!!!");
        });
        sessionStorage.removeItem("listId");
        sessionStorage.removeItem("userId");
    }
</script>
</html>
