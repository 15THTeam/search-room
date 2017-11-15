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
                                <spring:message code="label.username"/>
                            </form:label>
                        </span>
                        <form:input path="username" readonly="true"/>
                    </div>
                    <div>
                        <span>
                            <form:label path="fullName">
                                <spring:message code="label.full.name"/>*
                            </form:label>
                        </span>
                        <form:input id="full-name" path="fullName"/>
                        <div id="required-full-name" class="error">
                            <spring:message code="required.full.name"/>
                        </div>
                    </div>
                    <div>
                        <span>
                            <form:label path="email">
                                <spring:message code="label.email"/>
                            </form:label>
                        </span>
                        <form:input id="email" path="email"/>
                        <div id="invalid-email" class="error">
                            <spring:message code="invalid.email"/>
                        </div>
                    </div>
                    <div>
                        <span>
                            <form:label path="phoneNumber">
                                <spring:message code="label.phone"/>
                            </form:label>
                        </span>
                        <form:input id="phone-number" path="phoneNumber"/>
                        <div id="invalid-phone-number" class="error">
                            <spring:message code="invalid.phone.number"/>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <input type="submit" value="<spring:message code="button.update"/>"/>
            </form:form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(() => {
        $('#required-full-name').hide();
        $('#invalid-email').hide();
        $('#invalid-phone-number').hide();
    });

    function validateForm() {
        let isValid;

        let txtEmail = $('#email');
        let txtPhone = $('#phone-number');
        let requiredFullName = $('#required-full-name');

        if ($("#full-name").val() === '') {
            requiredFullName.show();
            isValid = false;
        } else {
            requiredFullName.hide();
            isValid = true;
        }

        if (txtEmail.val() !== '') {
            let emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (emailRegex.test(txtEmail.val())) {
                $("#invalid-email").hide();
                isValid = true;
            } else {
                $("#invalid-email").show();
                isValid = false;
            }
        }

        if (txtPhone.val() !== '') {
            let phoneRegex = /^0(1\d{9}|9\d{8})$/;
            if (phoneRegex.test(txtPhone.val())) {
                $("#invalid-phone-number").hide();
            } else {
                $("#invalid-phone-number").show();
                isValid = false;
            }
        }

        return isValid;
    }
</script>