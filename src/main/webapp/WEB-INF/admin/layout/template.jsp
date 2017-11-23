<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><tiles:getAsString name="title"/></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link href="<c:url value="/resources/admin/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
    <!-- Google fonts - Roboto -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <!-- theme stylesheet-->
    <link href="<c:url value="/resources/admin/css/style.default.css"/>" rel="stylesheet" id="theme-stylesheet">
    <!-- jQuery Circle-->
    <link href="<c:url value="/resources/admin/css/grasp_mobile_progress_circle-1.0.0.min.css"/>" rel="stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link href="<c:url value="/resources/admin/css/custom.css"/>" rel="stylesheet">
    <!-- Favicon-->
    <link href="<c:url value="/resources/public/images/house.ico"/>" rel="icon"/>
    <!-- Font Awesome CDN-->
    <!-- you can replace it by local Font Awesome-->
    <script src="https://use.fontawesome.com/99347ac47f.js"></script>
    <!-- Font Icons CSS-->
    <link href="https://file.myfontastic.com/da58YPMQ7U5HY8Rb6UxkNf/icons.css" rel="stylesheet">
    <script src="<c:url value="/resources/admin/js/jquery.min.js"/>"></script>
</head>
<body>
    <section id="menu">
        <tiles:insertAttribute name="menu"/>
    </section>
    <div class="page home-page">
        <header id="header">
            <tiles:insertAttribute name="header"/>
        </header>
        <section id="body">
            <tiles:insertAttribute name="body"/>
        </section>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="<c:url value="/resources/admin/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/jquery.cookie.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/grasp_mobile_progress_circle-1.0.0.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/jquery.nicescroll.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/jquery.validate.min.js"/>"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>--%>
    <script src="<c:url value="/resources/admin/js/charts-custom.js"/>"></script>
    <script src="<c:url value="/resources/admin/js/front.js"/>"></script>
</body>
</html>
