<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="main">
    <div class="shop_top">
        <div class="container">
            <div class="col-md-6">
                <div class="login-page">
                    <h4 class="title"><spring:message code="account.title"/></h4>
                    <p><spring:message code="registered.customer.text"/></p>
                    <div class="button1">
                        <a href="<c:url value="/login"/>">
                            <input type="submit" name="Submit" value="<spring:message code="button.login"/>">
                        </a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="login-title">
                    <h4 class="title"><spring:message code="new.customer.title"/></h4>
                    <p style="color: #37ff1a">${notification}</p>
                    <div id="loginbox" class="loginbox">
                        <form:form commandName="account" name="register" id="login-form"
                                   onsubmit="return validateForm();">
                            <fieldset class="input">
                                <p id="register-form-username">
                                    <form:label path="username" for="modlgn_username">
                                        <spring:message code="label.username"/>*
                                    </form:label>
                                        <form:input path="username" id="modlgn_username" class="inputbox" size="18"
                                                    autocomplete="off" onblur="checkDuplicateUsername();"/>
                                        <%--<form:errors path="username" cssClass="error"/>--%>
                                <div id="user-name-error" class="error"></div>
                                </p>
                                <p id="register-form-password">
                                    <form:label path="password" for="modlgn_passwd">
                                        <spring:message code="label.password"/>*
                                    </form:label>
                                        <form:input path="password" id="modlgn_passwd" type="password" class="inputbox"
                                                    size="18" autocomplete="off"/>
                                        <%--<form:errors path="password" cssClass="error"/>--%>
                                <div id="password-error" class="error"></div>
                                </p>
                                <p id="register-form-re-password">
                                    <form:label path="confirmPassword"
                                                for="modlgn_passwd">
                                        <spring:message code="form.confirm.password.label"/>*
                                    </form:label>
                                        <form:input path="confirmPassword" id="modlgn_confirm_passwd" type="password"
                                                    class="inputbox" size="18" autocomplete="off"/>
                                        <%--<form:errors path="confirmPassword" cssClass="error"/>--%>
                                <div id="confirm-pass-error" class="error"></div>
                                </p>
                                <div class="remember">
                                    <input type="submit" name="Submit" class="button"
                                           value="<spring:message code="label.menu.register"/>"
                                           style="margin-right: 2px;"/>
                                    <div class="clear"></div>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
function checkDuplicateUsername() {
    let username = $('#modlgn_username').val();
    $.get('/check-username-duplicate', {username}, value => {
        if (value === 'duplicate') {
            $("#user-name-error").html('This username is already existed, please choose another name');
            $(':input[type="submit"]').prop('disabled', true);
        } else {
            $("#user-name-error").html('');
            $(':input[type="submit"]').prop('disabled', false);
        }
    });
}

function validateForm() {
    let isValid = false;
    let txtPassword = $("#modlgn_passwd");
    let txtConfirmPass = $("#modlgn_confirm_passwd");
    let passwordError = $("#password-error");
    let confirmPassError = $("#confirm-pass-error");

    if ($("#modlgn_username").val() === '') {
        $("#user-name-error").html('Username is required');
    } else {
        isValid = true;
    }

    if (txtPassword.val() === '') {
        passwordError.html('Password is required');
        isValid = false;
    } else {
        passwordError.html('');
        isValid = true;
    }

    if (txtConfirmPass.val() === '') {
        confirmPassError.html('Confirm password is required');
        isValid = false;
    } else {
        if (txtPassword.val() !== txtConfirmPass.val()) {
            confirmPassError.html('Confirm password is not matched');
            isValid = false;
        } else {
            confirmPassError.html('');
            isValid = true;
        }
    }

    return isValid;
}
</script>