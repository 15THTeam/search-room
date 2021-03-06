<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="header-left">
                    <div class="logo">
                        <a href=<c:url value="/"/>>
                            <img src="<c:url value="/resources/public/images/logo.png"/>" width="80"/>
                        </a>
                    </div>
                    <div class="menu">
                        <a class="toggleMenu" href="#">
                            <img src=<c:url value="/resources/public/images/nav.png"/>/>
                        </a>
                        <ul class="icon1 sub-icon1" style="display:flex;">
                            <li>
                                <a href="<c:url value="/rooms?page=1"/>" class="header-menu">
                                    <spring:message code="label.menu.rooms"/>
                                </a>
                            </li>
                            <c:if test="${empty LOGGED_IN_USER.username}">
                                <li>
                                    <a href="<c:url value="/login"/>" class="header-menu">
                                        <spring:message code="label.menu.login"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/register"/>" class="header-menu">
                                        <spring:message code="label.menu.register"/>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${not empty LOGGED_IN_USER.username}">
                                <c:if test="${LOGGED_IN_USER.role == \"CUSTOMER\"}">
                                    <li>
                                        <a href="<c:url value="/rooms/add"/>" class="header-menu">
                                            <spring:message code="label.menu.post"/>
                                        </a>
                                    </li>
                                </c:if>
                                <li>
                                    <a href="#" class="header-menu">
                                        <spring:message code="label.menu.welcome"/> ${LOGGED_IN_USER.username}
                                    </a>
                                    <ul class="sub-icon1 list" style="display:flex; flex-direction: column;font-size: 18px;">
                                        <c:if test="${LOGGED_IN_USER.role == \"CUSTOMER\"}">
                                            <li>
                                                <a href="<c:url value="/customer-posts?user=${LOGGED_IN_USER.username}&page=1"/>" style="color:black;">
                                                    <spring:message code="label.menu.my.post"/>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="<c:url value="/customer-info"/>" style="color:black;">
                                                    <spring:message code="label.menu.account.info"/>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="<c:url value="/change-password"/>" style="color:black;">
                                                <spring:message code="label.menu.change.password"/>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="<c:url value="/logout"/>" style="color:black;">
                                                <spring:message code="label.menu.logout"/>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                        <script type="text/javascript"
                                src=<c:url value="/resources/public/js/responsive-nav.js"/>></script>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="header_right">
                    <!-- start search-->
                    <div class="search-box">
                        <div id="sb-search" class="sb-search">
                            <form action="<c:url value="/rooms/search"/>">
                                <input class="sb-search-input"
                                       placeholder="<spring:message code="placeholder.menu.search"/>"
                                       type="search" name="search" id="search">
                                <input class="sb-search-submit" type="submit" value="">
                                <span class="sb-icon-search"> </span>
                            </form>
                        </div>
                    </div>
                    <!----search-scripts---->
                    <script src=<c:url value="/resources/public/js/classie.js"/>></script>
                    <script src=<c:url value="/resources/public/js/uisearch.js"/>></script>
                    <script>
                        new UISearch(document.getElementById('sb-search'));
                    </script>
                    <!----//search-scripts---->
                </div>
            </div>
        </div>
    </div>
</div>