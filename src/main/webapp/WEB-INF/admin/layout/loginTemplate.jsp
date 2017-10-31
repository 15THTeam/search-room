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
    <link rel="stylesheet" href="<c:url value="/resources/admin/css/bootstrap.min.css"/>">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="<c:url value="/resources/admin/css/style.default.css"/>" id="theme-stylesheet">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="<c:url value="/resources/admin/css/grasp_mobile_progress_circle-1.0.0.min.css"/>">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="<c:url value="/resources/admin/css/custom.css"/>">
    <!-- Favicon-->
    <link href="<c:url value="/resources/public/images/house.ico"/>" rel="icon"/>
    <!-- Font Awesome CDN-->
    <!-- you can replace it by local Font Awesome-->
    <script src="https://use.fontawesome.com/99347ac47f.js"></script>
    <!-- Font Icons CSS-->
    <link rel="stylesheet" href="https://file.myfontastic.com/da58YPMQ7U5HY8Rb6UxkNf/icons.css">
</head>
<body>
    <section id="body">
        <tiles:insertAttribute name="body"/>
    </section>
</body>
</html>
