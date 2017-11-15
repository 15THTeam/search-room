<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="main">
    <div class="shop_top">
        <div class="container">
            <c:choose>
                <c:when test="${not empty cusInfoMess}">
                    <h3 style="color: #de6507; text-align: center;">${cusInfoMess}<br/>
                        Click <a href="<c:url value="/customer-info"/>">here</a> to complete your information</h3>
                </c:when>
                <c:otherwise>
                    <form:form commandName="post" action="update" enctype="multipart/form-data"
                               onsubmit="return validateForm();">
                        <form:hidden path="postId"/>
                        <div class="register-top-grid">
                            <h3><spring:message code="room.information.title"/></h3>
                            <p style="font-weight: bold; color: #de6507">${message}</p>
                            <div>
                                <span><spring:message code="room.info.title"/><label>*</label></span>
                                <form:input id="title" path="title"/>
                                <div id="error-title" class="error"></div>
                            </div>
                            <div>
                                <span><spring:message code="label.address"/><label>*</label></span>
                                <form:input id="address" path="address"/>
                                <div id="error-address" class="error"></div>
                            </div>
                            <div>
                                <span><spring:message code="label.area"/><label>*</label> (m<sup>2</sup>)</span>
                                <form:input id="area" path="area"/>
                                <div id="error-area" class="error"></div>
                            </div>
                            <div>
                                <span><spring:message code="label.cost"/><label>*</label></span>
                                <form:input id="price" path="price"/>
                                <div id="error-price" class="error"></div>
                            </div>
                            <div>
                                <span><spring:message code="label.room.type"/><label>*</label></span>
                                <form:select path="typeId">
                                    <c:forEach items="${roomTypeList}" var="roomType">
                                        <form:option value="${roomType.id}">
                                            ${roomType.description}
                                        </form:option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div>
                                <span><spring:message code="label.description"/><label>*</label></span>
                                <form:textarea id="description" path="description" style="width: 96%; resize: none"/>
                                <div id="error-description" class="error"></div>
                            </div>
                            <c:if test="${post.postId == 0}">
                                <div>
                                    <span><spring:message code="label.image"/></span>
                                    <input type="file" name="files"/>
                                </div>
                            </c:if>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                        <input type="submit" value="submit">
                    </form:form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script type="text/javascript">
    function validateForm() {
        let isValid = false;

        let txtTitle = $("#title");
        let txtAddress = $("#address");
        let txtArea = $("#area");
        let txtPrice = $("#price");
        let txtDescription = $("#description");

        let errTitle = $("#error-title");
        let errAddress = $("#error-address");
        let errArea = $("#error-area");
        let errPrice = $("#error-price");
        let errDescription = $("#error-description");

        if (txtTitle.val() === '') {
            errTitle.html('Title is required');
            isValid = false;
        } else {
            if (txtTitle.length() > 100) {
                errTitle.html('Title must has less than 100 characters');
                isValid = false;
            } else {
                errTitle.html('');
                isValid = true;
            }
        }

        if (txtAddress.val() === '') {
            errAddress.html('Address is required');
            isValid = false;
        } else {
            if (txtAddress.length() > 100) {
                errAddress.html('Address must has less than 100 characters');
                isValid = false;
            } else {
                errAddress.html('');
                isValid = true;
            }
        }

        if (txtArea.val() <= 0) {
            errArea.html('Area must be greater than zero (0)');
            isValid = false;
        } else {
            errArea.html('');
            isValid = true;
        }

        if (txtPrice.val() === '') {
            errPrice.html('Price is required');
            isValid = false;
        } else {
            if (txtPrice < 0) {
                errPrice.html('Price must be greater than zero (0)');
                isValid = false;
            } else {
                errPrice.html('');
                isValid = true;
            }
        }

        if (txtDescription.val() === '') {
            errDescription.html('Description is required');
            isValid = false;
        } else {
            errDescription.html('');
            isValid = true;
        }
        return isValid;
    }
</script>