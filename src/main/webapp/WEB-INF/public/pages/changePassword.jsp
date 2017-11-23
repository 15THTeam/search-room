<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main">
    <div class="shop_top">
        <div class="container">
            <div class="col-md-6">
                <div class="login-title">
                    <h4 class="title">${LOGGED_IN_USER.username}</h4>
                    <c:if test="${not empty success}">
                        <p style="color: #28ff75"><spring:message code="change.password.success"/></p>
                    </c:if>
                    <c:if test="${not empty fail}">
                        <p style="color: #ff0c1b"><spring:message code="invalid.old.password"/></p>
                    </c:if>
                    <div id="loginbox" class="loginbox">
                        <form name="register" action="<c:url value="/change-password"/>" method="post"
                              id="login-form" onsubmit="return validateForm();">
                            <input type="hidden" name="username" value="${LOGGED_IN_USER.username}"/>
                            <fieldset class="input">
                                <p id="register-form-old-password">
                                    <label for="modlgn_passwd">
                                        <spring:message code="label.old.password"/>*
                                    </label>
                                    <input id="modlgn_old_passwd" type="password" name="old-pass"
                                           class="inputbox" size="18" autocomplete="off"/>
                                <div id="required-old-password" class="error">
                                    <spring:message code="required.old.password"/>
                                </div>
                                </p>
                                <p id="register-form-password">
                                    <label for="modlgn_passwd">
                                        <spring:message code="label.new.password"/>*
                                    </label>
                                        <input id="modlgn_passwd" type="password" name="new-pass"
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
                                           value="<spring:message code="button.submit"/>"
                                           style="margin-right: 2px;"/>
                                    <div class="clear"></div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(() => {
        $('#required-old-password').hide();
        $('#required-password').hide();
        $('#required-confirm-pass').hide();
        $('#not-matched-confirm-pass').hide();
    });

    function validateForm() {
        let txtOldPassword = $('#modlgn_old_passwd');
        let txtNewPassword = $('#modlgn_passwd');
        let txtConfirmPass = $('#modlgn_confirm_passwd');

        let requiredOldPassword = $('#required-old-password');
        let requiredPassword = $('#required-password');
        let requiredConfirmPass = $('#required-confirm-pass');
        let notMatchedConfirmPass = $('#not-matched-confirm-pass');

        if (txtOldPassword.val() !== '') {
            requiredOldPassword.hide();
        } else {
            requiredOldPassword.show();
            return false;
        }

        if (txtNewPassword.val() !== '') {
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
            if (txtNewPassword.val() !== txtConfirmPass.val()) {
                notMatchedConfirmPass.show();
                return false;
            } else {
                notMatchedConfirmPass.hide();
            }
        }

        return true;
    }
</script>