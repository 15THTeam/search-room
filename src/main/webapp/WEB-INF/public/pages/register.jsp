<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                    <p style="color: #28ff75">${notification}</p>
                    <div id="loginbox" class="loginbox">
                        <form:form commandName="account" name="register" id="login-form" onsubmit="return validateForm();">
                            <fieldset class="input">
                                <p id="register-form-username">
                                    <form:label path="username" for="modlgn_username">
                                        <spring:message code="label.username"/>*
                                    </form:label>
                                        <form:input path="username" id="modlgn_username" class="inputbox" size="18"
                                                    autocomplete="off" onblur="checkDuplicateUsername()"/>
                                    <div id="duplicate-user-name" class="error">
                                        <spring:message code="duplicate.username"/>
                                    </div>
                                    <div id="required-user-name" class="error">
                                        <spring:message code="required.username"/>
                                    </div>
                                </p>
                                <p id="register-form-password">
                                    <form:label path="password" for="modlgn_passwd">
                                        <spring:message code="label.password"/>*
                                    </form:label>
                                        <form:input path="password" id="modlgn_passwd" type="password"
                                                    class="inputbox" size="18" autocomplete="off"/>
                                    <div id="required-password" class="error">
                                        <spring:message code="required.password"/>
                                    </div>
                                </p>
                                <p id="register-form-re-password">
                                    <label for="modlgn_passwd">
                                        <spring:message code="form.confirm.password.label"/>*
                                    </label>
                                        <input id="modlgn_confirm_passwd" type="password"
                                                    class="inputbox" size="18" autocomplete="off"/>
                                    <div id="required-confirm-pass" class="error">
                                        <spring:message code="required.confirm.password"/>
                                    </div>
                                    <div id="not-matched-confirm-pass" class="error">
                                        <spring:message code="confirm.pass.not.matched"/>
                                    </div>
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
    $(document).ready(() => {
        $('#duplicate-user-name').hide();
        $('#required-user-name').hide();
        $('#required-password').hide();
        $('#required-confirm-pass').hide();
        $('#not-matched-confirm-pass').hide();
    });

    function checkDuplicateUsername() {
        let username = $('#modlgn_username').val();
        let duplicateUsername = $('#duplicate-user-name');
        let errUsername = $('#required-user-name');
        let inputSubmit = $(':input[type="submit"]');

        $.get('/check-username-duplicate', {username}, value => {
            if (value === 'true') {
                errUsername.hide();
                duplicateUsername.show();
                inputSubmit.prop('disabled', true);
            } else {
                duplicateUsername.hide();
                inputSubmit.prop('disabled', false);
            }
        });
    }

    function validateForm() {
        let txtUsername = $('#modlgn_username');
        let txtPassword = $('#modlgn_passwd');
        let txtConfirmPass = $('#modlgn_confirm_passwd');

        let requiredUsername = $('#required-user-name');
        let requiredPassword = $('#required-password');
        let requiredConfirmPass = $('#required-confirm-pass');
        let notMatchedConfirmPass = $('#not-matched-confirm-pass');

        if (txtUsername.val() === '') {
            requiredUsername.show();
            return false;
        } else {
            requiredUsername.hide();
        }

        if (txtPassword.val() !== '') {
            requiredPassword.hide();
        } else {
            requiredPassword.show();
            return false;
        }

        if (txtConfirmPass.val() === '') {
            requiredConfirmPass.show();
            return false;
        } else {
            requiredConfirmPass.hide();
            if (txtPassword.val() !== txtConfirmPass.val()) {
                notMatchedConfirmPass.show();
                return false;
            } else {
                notMatchedConfirmPass.hide();
            }
        }

        return true;
    }
</script>