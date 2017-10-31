<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="main">
    <div class="shop_top">
        <div class="container">
            <h4>${message}</h4>
            <h3 class="m_3">Room List</h3>
            <div class="close_but"><i class="close1"> </i></div>
            <div class="row shop_box-top">
                <c:forEach items="${postList}" var="post">
                    <div class="col-md-3 shop_box">
                        <a href="<c:url value="/detail?post-id=${post.postId}"/>">
                            <img src="/image/${post.image}" class="img-responsive" style="height: 196px;"/>
                        </a>
                        <c:if test="${post.isApproved() == true}">
                            <span class="new-box">
                                <span class="new-label">Approved</span>
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
                                <li class="shop_btn"><a href="<c:url value="/detail?post-id=${post.postId}"/>">Read
                                    More</a></li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>