<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="main">
    <div class="shop_top">
        <div class="container">
            <form:form commandName="customer">
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
                        <form:input path="fullName"/>
                        <span class="error"><form:errors path="fullName"/></span>
                    </div>
                    <div>
                        <span>
                            <form:label path="email">
                                <spring:message code="label.email"/>
                            </form:label>
                        </span>
                        <form:input path="email"/>
                        <span class="error"><form:errors path="email"/></span>
                    </div>
                    <div>
                        <span>
                            <form:label path="phoneNumber">
                                <spring:message code="label.phone"/>
                            </form:label>
                        </span>
                        <form:input path="phoneNumber"/>
                        <span class="error"><form:errors path="phoneNumber" cssClass="error"/></span>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <input type="submit" value="Update"/>
            </form:form>
        </div>
    </div>
</div>