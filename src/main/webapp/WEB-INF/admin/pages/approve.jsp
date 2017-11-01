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
                                <th><spring:message code="label.id"/></th>
                                <th><spring:message code="label.customer"/></th>
                                <th><spring:message code="label.updated.at"/></th>
                                <th><spring:message code="label.is.approve"/></th>
                                <th><spring:message code="label.detail"/></th>
                                <th><spring:message code="label.delete"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${postList}" var="post">
                                <tr>
                                    <th scope="row">${post.id}</th>
                                    <td>${post.fullName}</td>
                                    <td>${post.createdAt}</td>
                                    <td align="center">
                                        <c:if test="${post.isApproved() == true}">
                                            <a href="<c:url value="/admin/do-approve?id=${post.id}&approve=0"/>">
                                                <img src="<c:url value="/resources/admin/img/check-icon.png"/>"/>
                                            </a>
                                        </c:if>
                                        <c:if test="${post.isApproved() == false}">
                                            <a href="<c:url value="/admin/do-approve?id=${post.id}&approve=1"/>">
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
                                        <a href="<c:url value="/delete?post-id=${post.id}"/>"
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
    </div>
</section>