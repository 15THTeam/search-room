<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<section class="charts">
    <div class="container-fluid">
        <header>
            <h1 class="h3"><spring:message code="label.room.type"/></h1>
        </header>
        <div class="row">
            <div class="col-lg-8">
                <div class="card room-type-form">
                    <div class="card-header d-flex align-items-center">
                        <h2 class="h5 display"><spring:message code="label.add.type"/></h2>
                    </div>
                    <div class="card-block">
                        <form:form commandName="roomType" class="form-inline" action="/admin/room-type/update">
                            <form:hidden path="id"/>
                            <div class="form-group">
                                <form:label path="description" for="inlineFormInput" class="sr-only">
                                    <spring:message code="label.name"/>
                                </form:label>
                                <form:input path="description" id="inlineFormInput" class="mx-sm-3 form-control"/>
                            </div>
                            <div class="form-group">
                                <c:if test="${!empty roomType.description}">
                                    <input type="submit" value="Edit" class="mx-sm-3 btn btn-primary"/>
                                </c:if>
                                <c:if test="${empty roomType.description}">
                                    <input type="submit" value="Add" class="mx-sm-3 btn btn-primary"/>
                                </c:if>
                                <a href="<c:url value="/admin/room-type"/>"><spring:message code="label.cancel"/></a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h2 class="h5 display"><spring:message code="room.type.list.title"/></h2>
                    </div>
                    <div class="card-block">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th><spring:message code="label.id"/></th>
                                <th><spring:message code="label.description"/></th>
                                <th><spring:message code="label.edit"/></th>
                                <th><spring:message code="label.delete"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${roomTypeList}" var="roomType">
                                <tr>
                                    <th scope="row">${roomType.id}</th>
                                    <td>${roomType.description}</td>
                                    <td>
                                        <a href="<c:url value="/admin/room-type/edit?id=${roomType.id}"/>">
                                            <spring:message code="label.edit"/>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="<c:url value="/admin/room-type/delete?id=${roomType.id}"/>">
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
    </div>
</section>