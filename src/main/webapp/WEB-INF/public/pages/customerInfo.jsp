<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main">
    <div class="shop_top">
        <div class="container">
            <form:form commandName="customer">
                <div class="register-top-grid">
                    <h3>PERSONAL INFORMATION</h3>
                    <p style="font-weight: bold; color: #ff2723">${notification}</p>
                    <form:hidden path="id"/>
                    <div>
                        <span><form:label path="username">Username*</form:label></span>
                        <form:input path="username" readonly="true"/>
                        <span class="error"><form:errors path="username"/></span>
                    </div>
                    <div>
                        <span><form:label path="fullName">Full Name*</form:label></span>
                        <form:input path="fullName"/>
                        <span class="error"><form:errors path="fullName"/></span>
                    </div>
                    <div>
                        <span><form:label path="email">Email Address</form:label></span>
                        <form:input path="email"/>
                        <span class="error"><form:errors path="email"/></span>
                    </div>
                    <div>
                        <span><label>Phone number</label></span>
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