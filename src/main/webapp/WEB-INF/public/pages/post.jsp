<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="main">
    <div class="shop_top">
        <div class="container">
            <c:choose>
                <c:when test="${not empty cusInfoMess}">
                    <h3 style="color: #de6507; text-align: center;">${cusInfoMess}<br/>
                        <spring:message code="label.click"/>
                        <a href="<c:url value="/customer-info"/>"><spring:message code="label.here"/> </a>
                        <spring:message code="label.complete.information"/></h3>
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
                                <div id="required-title" class="error">
                                    <spring:message code="required.title"/>
                                </div>
                                <div id="invalid-title-length" class="error">
                                    <spring:message code="invalid.title.length"/>
                                </div>
                            </div>
                            <div>
                                <span><spring:message code="label.address"/><label>*</label></span>
                                <form:input id="address" path="address"/>
                                <div id="required-address" class="error">
                                    <spring:message code="required.address"/>
                                </div>
                                <div id="invalid-address-length" class="error">
                                    <spring:message code="invalid.address.length"/>
                                </div>
                            </div>
                            <div>
                                <span><spring:message code="label.area"/><label>*</label> (m<sup>2</sup>)</span>
                                <form:input id="area" path="area"/>
                                <div id="invalid-area" class="error">
                                    <spring:message code="invalid.area"/>
                                </div>
                            </div>
                            <div>
                                <span><spring:message code="label.cost"/><label>*</label></span>
                                <form:input id="price" path="price"/>
                                <div id="required-price" class="error">
                                    <spring:message code="required.price"/>
                                </div>
                                <div id="invalid-price" class="error">
                                    <spring:message code="invalid.price"/>
                                </div>
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
                                <div id="required-description" class="error">
                                    <spring:message code="required.description"/>
                                </div>
                            </div>
                            <div>
                                <span><spring:message code="label.image"/></span>
                                <input type="file" name="files" id="upload"/>
                                <div id="valid-file-extension" class="error">
                                    <spring:message code="invalid.file.extension"/>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                        <input type="submit" value="submit"/>
                    </form:form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(() => {
        $('#required-title').hide();
        $('#required-address').hide();
        $('#required-price').hide();
        $('#required-description').hide();
        $('#invalid-title-length').hide();
        $('#invalid-address-length').hide();
        $('#invalid-area').hide();
        $('#invalid-price').hide();
        $('#valid-file-extension').hide();

        $('input[type=file]').change(function () {
            let val = $(this).val().toLowerCase(),
                regex = new RegExp("(.*?)\.(jpg|jpeg|png)$");

            if (!(regex.test(val))) {
                $(this).val('');
                $('#valid-file-extension').show();
            } else {
                $('#valid-file-extension').hide();
            }
        });
    });

    function validateForm() {
        let isValid;

        let txtTitle = $('#title');
        let txtAddress = $('#address');
        let txtPrice = $('#price');
        let txtDescription = $('#description');

        let errTitle = $('#required-title');
        let errAddress = $('#required-address');
        let errPrice = $('#required-price');
        let errDescription = $('#required-description');

        let invalidTitleLength = $('#invalid-title-length');
        let invalidAddressLength = $('#invalid-address-length');
        let invalidArea = $('#invalid-area');
        let invalidPrice = $('#invalid-price');

        if (txtTitle.val() === '') {
            errTitle.show();
            isValid = false;
        } else {
            errTitle.hide();
            if (txtTitle.length > 100) {
                invalidTitleLength.show();
                isValid = false;
            } else {
                invalidTitleLength.hide();
                isValid = true;
            }
        }

        if (txtAddress.val() === '') {
            errAddress.show();
            isValid = false;
        } else {
            errAddress.hide();
            if (txtAddress.length > 100) {
                invalidAddressLength.show();
                isValid = false;
            } else {
                invalidAddressLength.hide();
                isValid = true;
            }
        }

        if ($('#area').val() <= 0) {
            invalidArea.show();
            isValid = false;
        } else {
            invalidArea.hide();
            isValid = true;
        }

        if (txtPrice.val() === '') {
            errPrice.show();
            isValid = false;
        } else {
            errPrice.hide();
            if (txtPrice < 0) {
                invalidPrice.show();
                isValid = false;
            } else {
                invalidPrice.hide();
                isValid = true;
            }
        }

        if (txtDescription.val() === '') {
            errDescription.show();
            isValid = false;
        } else {
            errDescription.hide();
            isValid = true;
        }

        return isValid;
    }
</script>