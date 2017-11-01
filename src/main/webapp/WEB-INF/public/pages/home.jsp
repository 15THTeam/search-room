<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="banner">
    <!-- start slider -->
    <div id="fwslider">
        <div class="slider_container">
            <div class="slide">
                <img src="<c:url value="/resources/public/images/slider1.jpg"/>" class="img-responsive"/>
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <h1 class="title"><spring:message code="banner.title"/></h1>
                        <div class="button">
                            <a href="<c:url value="/rooms"/>">
                                <spring:message code="label.detail.button"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Duplicate to create more slides -->
            <div class="slide">
                <img src="<c:url value="/resources/public/images/slider2.jpg"/>" class="img-responsive"/>
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <h1 class="title"><spring:message code="banner.title"/></h1>
                        <div class="button">
                            <a href="<c:url value="/rooms"/>">
                                <spring:message code="label.detail.button"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!--/slide -->
        </div>
        <div class="timers"></div>
        <div class="slidePrev"><span></span></div>
        <div class="slideNext"><span></span></div>
    </div>
    <!--/slider -->
</div>
<div class="features">
    <div class="container">
        <h3 class="m_3"><spring:message code="newest.title"/></h3>
        <div class="close_but"><i class="close1"> </i></div>
        <div class="row">
            <c:forEach items="${postNewsList}" var="postNews">
                <div class="col-md-3 top_box home-post">
                    <div class="view view-ninth">
                        <a href="<c:url value="/detail?post-id=${postNews.postId}"/>">
                            <img src="/image/${postNews.image}" class="img-responsive" style="height: 196px;"/>
                            <div class="mask mask-1"></div>
                            <div class="mask mask-2"></div>
                            <div class="content">
                                <h2>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${postNews.price}"/>
                                    VND
                                </h2>
                                <p>${postNews.address}</p>
                            </div>
                        </a>
                    </div>
                    <h4 class="m_4"><a href="<c:url value="/detail?post-id=${postNews.postId}"/>">${postNews.title}</a>
                    </h4>
                    <p class="m_5">${postNews.roomType}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>