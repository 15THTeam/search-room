<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header">
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
                <div class="navbar-header">
                    <a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"></i></a>
                    <a href="#" class="navbar-brand">
                        <div class="brand-text hidden-sm-down">
                            <span><strong>Web management</strong></span>
                        </div>
                    </a>
                </div>
                <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                    <li class="nav-item">
                        <a href="<c:url value="/logout"/>" class="nav-link logout">Logout
                            <i class="fa fa-sign-out"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>