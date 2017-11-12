<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<section class="charts">
    <div class="container-fluid">
        <header>
            <h1 class="h3"><spring:message code="approve.room.title"/></h1>
        </header>
        <div class="col-lg-6 my-table">
            <div class="card">
                <div class="card-header d-flex align-items-center">
                    <h2 class="h5 display"><spring:message code="room.list.title"/></h2>
                </div>
                <div class="card-block">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><spring:message code="label.no"/></th>
                            <th><spring:message code="label.customer"/></th>
                            <th><spring:message code="label.updated.at"/></th>
                            <th><spring:message code="label.is.approve"/></th>
                            <th><spring:message code="label.detail"/></th>
                            <th><spring:message code="label.delete"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="currentPage" value="${currentPage}"/>
                        <%
                            int count = (int)pageContext.getAttribute("currentPage");
                            count = (count - 1) * 10 + 1;
                        %>
                        <c:forEach items="${postList}" var="post">
                            <tr>
                                <th scope="row"><%= count++ %></th>
                                <td>${post.fullName}</td>
                                <td>${post.createdAt}</td>
                                <td align="center">
                                    <c:if test="${post.isApproved() == true}">
                                        <a href="<c:url value="/admin/do-approve?page=${currentPage}&id=${post.id}&approve=0"/>">
                                            <img src="<c:url value="/resources/admin/img/check-icon.png"/>"/>
                                        </a>
                                    </c:if>
                                    <c:if test="${post.isApproved() == false}">
                                        <a href="<c:url value="/admin/do-approve?page=${currentPage}&id=${post.id}&approve=1"/>">
                                            <img src="<c:url value="/resources/admin/img/uncheck-icon.png"/>"/>
                                        </a>
                                    </c:if>
                                </td>
                                <td>
                                    <a href="<c:url value="/detail?post-id=${post.id}"/>" target="_blank">
                                        <spring:message code="label.detail"/>
                                    </a>
                                </td>
                                <td>
                                    <a href="<c:url value="/rooms/delete?page=${currentPage}&post-id=${post.id}"/>"
                                       onclick="return confirm('<spring:message code="message.confirm"/>');">
                                        <spring:message code="label.delete"/>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <c:if test="${not empty postList}">
            <ul class="pagination">
                <li class="${currentPage == 1 ? 'disabled' : ''}">
                    <a href="<c:url value="/admin/approve?page=1"/>">&lt;&lt;</a>
                </li>
                <li class="${currentPage == 1 ? 'disabled' : ''}">
                    <a href="<c:url value="/admin/approve?page=${currentPage - 1}"/>">&lt;</a>
                </li>
                <c:forEach var="i" begin="1" end="${pageAmount}">
                    <li class="${i == currentPage ? 'disabled' : ''}">
                        <a href="<c:url value="/admin/approve?page=${i}"/>">${i}</a>
                    </li>
                </c:forEach>
                <li class="${currentPage == pageAmount ? 'disabled' : ''}">
                    <a href="<c:url value="/admin/approve?page=${currentPage + 1}"/>">&gt;</a>
                </li>
                <li class="${currentPage == pageAmount ? 'disabled' : ''}">
                    <a href="<c:url value="/admin/approve?page=${pageAmount}"/>">&gt;&gt;</a>
                </li>
            </ul>
        </c:if>
    </div>
</section>