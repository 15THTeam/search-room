<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="charts">
    <div class="container-fluid">
        <header>
            <h1 class="h3">Approve rooms</h1>
        </header>
            <div class="col-lg-6 my-table">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h2 class="h5 display">Room List</h2>
                    </div>
                    <div class="card-block">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Customer</th>
                                <th>Updated at</th>
                                <th>Is approved</th>
                                <th>Detail</th>
                                <th>Delete</th>
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
                                    <td><a href="<c:url value="/detail?post-id=${post.id}"/>" target="_blank">Detail</a></td>
                                    <td><a href="<c:url value="/delete?post-id=${post.id}"/>"
                                           onclick="return confirm('Are you sure?');">Delete</a>
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