<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page login-page">
    <div class="container">
        <div class="form-outer text-center d-flex align-items-center">
            <div class="form-inner">
                <div class="logo text-uppercase">
                    <strong class="text-primary"><spring:message code="login.title"/></strong>
                </div>
                <p style="color: red;">${message}</p>
                <form:form commandName="account" id="login-form" onsubmit="return validateForm();">
                    <div class="form-group">
                        <form:label path="username" for="login-username" class="label-custom">
                            <spring:message code="label.username"/>
                        </form:label>
                        <form:input path="username" id="login-username" name="loginUsername" autocomplete="false"/>
                        <div id="required-username" class="error">
                            <spring:message code="required.username"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <form:label path="password" for="login-password" class="label-custom">
                            <spring:message code="label.password"/>
                        </form:label>
                        <form:password path="password" id="login-password" name="loginPassword" autocomplete="false"/>
                        <div id="required-password" class="error">
                            <spring:message code="required.password"/>
                        </div>
                    </div>
                    <input type="checkbox" name="remember-me" value="Y"/>
                    <spring:message code="label.remember.me"/>
                    <input class="btn btn-primary" type="submit" value="<spring:message code="button.login"/>"/>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="<c:url value="/resources/admin/js/tether.min.js"/>"></script>
<script src="<c:url value="/resources/admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/admin/js/jquery.cookie.js"/>"></script>
<script src="<c:url value="/resources/admin/js/grasp_mobile_progress_circle-1.0.0.min.js"/>"></script>
<script src="<c:url value="/resources/admin/js/jquery.nicescroll.min.js"/>"></script>
<script src="<c:url value="/resources/admin/js/jquery.validate.min.js"/>"></script>
<script src="<c:url value="/resources/admin/js/front.js"/>"></script>
<script type="text/javascript">
    $(document).ready(() => {
        $('#required-username').hide();
        $('#required-password').hide();
    });

    function validateForm() {
        if ($("#login-username").val() === '') {
            $("#required-username").show();
            return false;
        } else {
            $("#required-username").hide();
        }

        if ($("#login-password").val() === '') {
            $('#required-password').show();
            return false;
        } else {
            $('#required-password').hide();
        }

        return true;
    }
</script>