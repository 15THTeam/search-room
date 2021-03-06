<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="main">
    <div class="shop_top">
        <div class="container">
            <h4>${message}</h4>
            <h3 class="m_3"><spring:message code="room.list.title"/></h3>
            <div class="close_but"><i class="close1"> </i></div>
            <div class="row shop_box-top">
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
                        </a>
                        <c:if test="${post.isApproved() == true}">
                            <span class="new-box">
                                <span class="new-label"><spring:message code="label.approve"/></span>
                            </span>
                        </c:if>
                        <div class="shop_desc">
                            <h3><a href="<c:url value="/detail?post-id=${post.postId}"/>">${post.title}</a></h3>
                            <p>${post.address}</p>
                            <span class="actual">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${post.price}"/> VND
                            </span>
                            <br/>
                            <ul class="buttons">
                                <li class="shop_btn">
                                    <a href="<c:url value="/detail?post-id=${post.postId}"/>">
                                        <spring:message code="post.read.more"/>
                                    </a>
                                </li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${not empty postList}">
                <ul class="pagination">
                    <li class="${currentPage == 1 ? 'disabled' : ''}">
                        <a href="<c:url value="/rooms?page=1"/>">&lt;&lt;</a>
                    </li>
                    <li class="${currentPage == 1 ? 'disabled' : ''}">
                        <a href="<c:url value="/rooms?page=${currentPage - 1}"/>">&lt;</a>
                    </li>
                    <c:forEach var="i" begin="1" end="${pageAmount}">
                        <li class="${i == currentPage ? 'disabled' : ''}">
                            <a href="<c:url value="/rooms?page=${i}"/>">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="${currentPage == pageAmount ? 'disabled' : ''}">
                        <a href="<c:url value="/rooms?page=${currentPage + 1}"/>">&gt;</a>
                    </li>
                    <li class="${currentPage == pageAmount ? 'disabled' : ''}">
                        <a href="<c:url value="/rooms?page=${pageAmount}"/>">&gt;&gt;</a>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>
</div>