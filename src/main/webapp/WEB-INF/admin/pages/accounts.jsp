<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<section class="charts">
    <div class="container-fluid">
        <header>
            <h1 class="h3"><spring:message code="label.account"/></h1>
        </header>
        <div class="col-lg-6 my-table">
            <div class="card">
                <div class="card-header d-flex align-items-center">
                    <h2 class="h5 display"><spring:message code="account.list.title"/></h2>
                </div>
                <div class="card-block">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><spring:message code="label.no"/></th>
                            <th><spring:message code="label.username"/></th>
                            <th><spring:message code="label.role"/></th>
                            <th><spring:message code="label.edit.role"/></th>
                            <th><spring:message code="label.delete"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <% int count = 0; %>
                        <c:forEach items="${accountList}" var="account">
                            <tr>
                                <th scope="row"><%= ++count %>
                                </th>
                                <td>${account.username}</td>
                                <td>${account.role}</td>
                                <td>
                                    <a href="<c:url value="/admin/edit-role?username=${account.username}&role=${account.role}"/>">
                                        <spring:message code="label.change"/>
                                    </a>
                                </td>
                                <td><a href="<c:url value="/admin/delete?username=${account.username}"/>"
                                       onclick="return confirm('Are you sure?');"><spring:message code="label.delete"/></a>
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