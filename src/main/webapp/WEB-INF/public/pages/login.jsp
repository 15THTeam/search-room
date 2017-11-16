<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="main">
    <div class="shop_top">
        <div class="container">
            <div class="col-md-6">
                <div class="login-page">
                    <h4 class="title"><spring:message code="new.customer.title"/></h4>
                    <p><spring:message code="new.customer.text"/></p>
                    <div class="button1">
                        <a href="<c:url value="/register"/>">
                            <input type="submit" name="Submit"
                                   value="<spring:message code="button.create.account"/>">
                        </a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="login-title">
                    <h4 class="title"><spring:message code="account.title"/></h4>
                    <p style="color: red;">${message}</p>
                    <div id="loginbox" class="loginbox">
                        <form:form commandName="account" name="login" id="login-form" onsubmit="return validateForm();">
                            <fieldset class="input">
                                <p id="login-form-username">
                                    <form:label path="username" for="modlgn_username">
                                        <spring:message code="label.username"/>
                                    </form:label>
                                    <form:input path="username" id="modlgn_username" class="inputbox" size="18"
                                                autocomplete="off"/>
                                    <div id="required-username" class="error">
                                        <spring:message code="required.username"/>
                                    </div>
                                </p>
                                <p id="login-form-password">
                                    <form:label path="password" for="modlgn_passwd">
                                        <spring:message code="label.password"/>
                                    </form:label>
                                    <form:input path="password" id="modlgn_passwd" type="password"
                                                class="inputbox" size="18" autocomplete="off"/>
                                    <div id="required-password" class="error">
                                        <spring:message code="required.password"/>
                                    </div>
                                </p>
                                <div class="remember">
                                    <p id="login-form-remember">
                                        <label for="modlgn_remember">
                                            <input type="checkbox" name="remember-me" value="Y"/>
                                            <spring:message code="label.remember.me"/>
                                        </label>
                                    </p>
                                    <input type="submit" name="Submit" class="button"
                                           value="<spring:message code="button.login"/>">
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
        $('#required-username').hide();
        $('#required-password').hide();
    });

    function validateForm() {
        let isValid;

        if ($("#modlgn_username").val() === '') {
            $("#required-username").show();
            isValid = false;
        } else {
            $("#required-username").hide();
            isValid = true;
        }

        if ($("#modlgn_passwd").val() === '') {
            $('#required-password').show();
            isValid = false;
        } else {
            $('#required-password').hide();
        }

        return isValid;
    }
</script>