<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<nav class="side-navbar">
    <div class="side-navbar-wrapper">
        <div class="sidenav-header d-flex align-items-center justify-content-center">
            <div class="sidenav-header-inner text-center">
                <img src="<c:url value="/resources/admin/img/avatar.png"/>" alt="person" class="img-fluid rounded-circle"/>
                <h2 class="h5 text-uppercase">
                    <spring:message code="label.menu.welcome"/> ${LOGGED_IN_USER.username}
                </h2>
                <span class="text-uppercase"><spring:message code="label.developer"/></span>
            </div>
            <div class="sidenav-header-logo">
                <a href="#" class="brand-small text-center">
                    <strong><spring:message code="label.name.responsive"/></strong>
                </a>
            </div>
        </div>
        <div class="main-menu">
            <ul id="side-main-menu" class="side-menu list-unstyled">
                <li><a href="<c:url value="/admin/room-type"/>">
                    <i class="icon-home"></i><span><spring:message code="label.room.type"/></span></a>
                </li>
                <li><a href="<c:url value="/admin/approve"/>">
                    <i class="icon-form"></i><span><spring:message code="label.approve"/></span></a>
                </li>
                <li><a href="<c:url value="/admin/manage-accounts"/>">
                    <i class="icon-grid"></i><span><spring:message code="label.account"/></span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>