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
                            <a href="<c:url value="/rooms/add"/>"><spring:message code="label.here"/> </a>
                            <spring:message code="no.post.title.tail"/>
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${postList}" var="post">
                            <div class="col-md-3 shop_box">
                                <a href="<c:url value="/detail?post-id=${post.postId}"/>">
                                    <c:choose>
                                        <c:when test="${empty post.image}">
                                            <img src="<c:url value="/image/no-image.jpg"/>" class="img-responsive" style="height: 196px;"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/image/${post.image}" class="img-responsive" style="height: 196px;"/>
                                        </c:otherwise>
                                    </c:choose>
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
                                                <a href="<c:url value="/rooms/delete?page=${currentPage}&post-id=${post.postId}"/>">
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
            <c:if test="${not empty postList}">
                <ul class="pagination">
                    <li class="${currentPage == 1 ? 'disabled' : ''}">
                        <a href="<c:url value="/customer-posts?user=${user}&page=1"/>">&lt;&lt;</a>
                    </li>
                    <li class="${currentPage == 1 ? 'disabled' : ''}">
                        <a href="<c:url value="/customer-posts?user=${user}&page=${currentPage - 1}"/>">&lt;</a>
                    </li>
                    <c:forEach var="i" begin="1" end="${pageAmount}">
                        <li class="${i == currentPage ? 'disabled' : ''}">
                            <a href="<c:url value="/customer-posts?user=${user}&page=${i}"/>">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="${currentPage == pageAmount ? 'disabled' : ''}">
                        <a href="<c:url value="/customer-posts?user=${user}&page=${currentPage + 1}"/>">&gt;</a>
                    </li>
                    <li class="${currentPage == pageAmount ? 'disabled' : ''}">
                        <a href="<c:url value="/customer-posts?user=${user}&page=${pageAmount}"/>">&gt;&gt;</a>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>
</div>