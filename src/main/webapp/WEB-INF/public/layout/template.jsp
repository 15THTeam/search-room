<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title><tiles:getAsString name="title"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="<c:url value="/resources/public/images/house.ico"/>" rel="icon"/>
    <link href="<c:url value="/resources/public/css/bootstrap.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/public/css/style.css"/>" rel='stylesheet' type='text/css'/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <script src="<c:url value="/resources/public/js/jquery.min.js"/>"></script>
    <!--<script src="js/jquery.easydropdown.js"></script>-->
    <!--start slider -->
    <link rel="stylesheet" href="<c:url value="/resources/public/css/fwslider.css"/>" media="all">
    <script src="<c:url value="/resources/public/js/jquery-ui.min.js"/>"></script>
    <script src="<c:url value="/resources/public/js/fwslider.js"/>"></script>
    <!--end slider -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function () {
                $(".dropdown dd ul").toggle();
            });

            $(".dropdown dd ul li a").click(function () {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });

            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function (e) {
                var $clicked = $(e.target);
                if (!$clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });

            $("#flagSwitcher").click(function () {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
    </script>
</head>
<body>
    <header id="header">
        <tiles:insertAttribute name="header"/>
    </header>
    <section id="content">
        <tiles:insertAttribute name="body"/>
    </section>
    <footer id="footer">
        <tiles:insertAttribute name="footer"/>
    </footer>
</body>
</html>