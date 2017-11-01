<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="main">
    <div class="shop_top">
        <div class="container">
            <h3 class="m_3"><spring:message code="customer.posts.title"/></h3>
            <div class="close_but"><i class="close1"> </i></div>
            <p style="font-weight: bold; color: #2cde70">${message}</p>
            <div class="row shop_box-top">
                <c:choose>
                    <c:when test="${empty postList}">
                        <h3 align="center">
                            <spring:message code="no.post.title.head"/>
                            <br/>
                            <spring:message code="label.click"/>
                            <a href="<c:url value="/rooms/update"/>"><spring:message code="label.here"/> </a>
                            <spring:message code="no.post.title.tail"/>
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${postList}" var="post">
                            <div class="col-md-3 shop_box">
                                <a href="<c:url value="/detail?post-id=${post.postId}"/>">
                                    <img src="/image/${post.image}" class="img-responsive" style="height: 196px;"/>
                                    <c:if test="${post.isApproved() == true}">
                                        <span class="new-box">
                                            <span class="new-label"><spring:message code="label.approve"/></span>
                                        </span>
                                    </c:if>
                                    <div class="shop_desc">
                                        <h3><a href="<c:url value="/detail?post-id=${post.postId}"/>">${post.title}</a>
                                        </h3>
                                        <p>${post.address}</p>
                                        <span class="actual">
                                            <fmt:formatNumber type="number" maxFractionDigits="3"
                                                              value="${post.price}"/> VND
                                        </span>
                                        <br/>
                                        <ul class="buttons">
                                            <li class="cart">
                                                <a href="<c:url value="/rooms/edit?post-id=${post.postId}"/>">
                                                    <spring:message code="label.edit"/>
                                                </a>
                                            </li>
                                            <li class="shop_btn">
                                                <a href="<c:url value="/rooms/delete?post-id=${post.postId}"/>">
                                                    <spring:message code="label.delete"/>
                                                </a>
                                            </li>
                                            <div class="clear"></div>
                                        </ul>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>