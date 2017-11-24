<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<section class="charts">
    <div class="container-fluid">
        <header>
            <h1 class="h3"><spring:message code="label.account"/></h1>
        </header>
        <div class="col-lg-8">
            <div class="card add-admin-form">
                <div class="card-header d-flex align-items-center">
                    <h2 class="h5 display"><spring:message code="label.add.admin.account"/></h2>
                </div>
                <div class="card-block">
                    <form class="form-inline" method="post" action="<c:url value="/admin/add-admin-account"/>"
                          onsubmit="return validateForm();">
                        <div class="form-group">
                            <input name="username" type="text" id="inlineFormInput" class="mx-sm-3 form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="mx-sm-3 btn btn-primary"
                                   value="<spring:message code="button.add"/>" />
                            <spring:message code="label.cancel"/>
                        </div>
                    </form>
                </div>
            </div>
            <div id="required-user-name" style="color: red; padding-top: 80px;">
                <spring:message code="required.username"/>
            </div>
            <c:if test="${not empty duplicate}">
                <div style="color: red; padding-top: 80px;"><spring:message code="duplicate.username"/></div>
            </c:if>
            <c:if test="${not empty success}">
                <div style="color: #00a6ff; padding-top: 80px;"><spring:message code="add.account.success"/></div>
            </c:if>
        </div>
        <div style="clear: both;"></div>
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
                            <th><spring:message code="label.post.amount"/></th>
                            <th><spring:message code="label.delete"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <% int count = 0; %>
                        <c:forEach items="${accountList}" var="account">
                            <tr>
                                <th scope="row"><%= ++count %></th>
                                <td>${account.username}</td>
                                <td>${account.role}</td>
                                <td>${account.postAmount}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${account.postAmount == 0}">
                                            <a href="<c:url value="/admin/delete?username=${account.username}"/>"
                                               onclick="return confirm('<spring:message code="message.confirm"/>');">
                                                <spring:message code="label.delete"/>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <spring:message code="label.delete"/>
                                        </c:otherwise>
                                    </c:choose>
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

<script type="text/javascript">
    $(document).ready(() => {
        $('#duplicate-user-name').hide();
        $('#required-user-name').hide();
    });

    function validateForm() {
        let username = $('#inlineFormInput').val();
        let errUsername = $('#required-user-name');

        if (username === '') {
            errUsername.show();
            return false;
        } else {
            errUsername.hide();
            return true;
        }
    }
</script>