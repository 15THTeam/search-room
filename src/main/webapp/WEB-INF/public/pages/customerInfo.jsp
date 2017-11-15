<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="main">
    <div class="shop_top">
        <div class="container">
            <form:form commandName="customer" onsubmit="return validateForm();">
                <div class="register-top-grid">
                    <h3><spring:message code="customer.info.title"/></h3>
                    <p style="font-weight: bold; color: #ff2723">${notification}</p>
                    <form:hidden path="id"/>
                    <div>
                        <span>
                            <form:label path="username">
                                <spring:message code="label.username"/>*
                            </form:label>
                        </span>
                        <form:input path="username" readonly="true"/>
                        <span class="error"><form:errors path="username"/></span>
                    </div>
                    <div>
                        <span>
                            <form:label path="fullName">
                                <spring:message code="label.full.name"/>*
                            </form:label>
                        </span>
                        <form:input id="full-name" path="fullName"/>
                        <%--<span class="error"><form:errors path="fullName"/></span>--%>
                        <div id="error-full-name" class="error"></div>
                    </div>
                    <div>
                        <span>
                            <form:label path="email">
                                <spring:message code="label.email"/>
                            </form:label>
                        </span>
                        <form:input id="email" path="email"/>
                        <%--<span class="error"><form:errors path="email"/></span>--%>
                        <div id="error-email" class="error"></div>
                    </div>
                    <div>
                        <span>
                            <form:label path="phoneNumber">
                                <spring:message code="label.phone"/>
                            </form:label>
                        </span>
                        <form:input id="phone" path="phoneNumber"/>
                        <%--<span class="error"><form:errors path="phoneNumber" cssClass="error"/></span>--%>
                        <div id="error-phone" class="error"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <input type="submit" value="Update"/>
            </form:form>
        </div>
    </div>
</div>

<script type="text/javascript">
    function validateForm() {
        let isValid = false;
        if ($("#full-name").val() === '') {
            $("#error-full-name").html('Full name is required');
        } else {
            $("#error-full-name").html('');
            isValid = true;
        }

        let emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (emailRegex.test($("#email").val())) {
            $("#error-email").html('');
            isValid = true;
        } else {
            $("#error-email").html("Email is invalid");
            isValid = false;
        }

        let phoneRegex = /^0(1\d{9}|9\d{8})$/;
        if (phoneRegex.test($("#phone").val())) {
            $("#error-phone").html('');
            isValid = true;
        } else {
            $("#error-phone").html('Phone number is invalid');
            isValid = false;
        }
        return isValid;
    }
</script>