<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="side-navbar">
    <div class="side-navbar-wrapper">
        <div class="sidenav-header d-flex align-items-center justify-content-center">
            <div class="sidenav-header-inner text-center">
                <img src="<c:url value="/resources/admin/img/avatar.png"/>" alt="person" class="img-fluid rounded-circle"/>
                <h2 class="h5 text-uppercase">Welcome ${LOGGED_IN_USER.username}</h2>
                <span class="text-uppercase">Web Developer</span>
            </div>
            <div class="sidenav-header-logo">
                <a href="index.html" class="brand-small text-center">
                    <strong>VA</strong>
                </a>
            </div>
        </div>
        <div class="main-menu">
            <ul id="side-main-menu" class="side-menu list-unstyled">
                <li><a href="<c:url value="/admin/room-type"/>">
                    <i class="icon-home"></i><span>Room Type</span></a>
                </li>
                <li><a href="<c:url value="/admin/approve"/>">
                    <i class="icon-form"></i><span>Approve</span></a>
                </li>
                <li><a href="<c:url value="/admin/manage-accounts"/>">
                    <i class="icon-grid"></i><span>Accounts</span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>