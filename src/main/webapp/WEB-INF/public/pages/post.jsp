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
                    <form:form commandName="post" action="update" enctype="multipart/form-data">
                        <form:hidden path="postId"/>
                        <div class="register-top-grid">
                            <h3><spring:message code="room.information.title"/></h3>
                            <p style="font-weight: bold; color: #de6507">${message}</p>
                            <div>
                                <span><spring:message code="room.info.title"/><label>*</label></span>
                                <form:input path="title"/>
                            </div>
                            <div>
                                <span><spring:message code="label.address"/><label>*</label></span>
                                <form:input path="address"/>
                            </div>
                            <div>
                                <span><spring:message code="label.area"/><label>*</label> (m<sup>2</sup>)</span>
                                <form:input path="area"/>
                            </div>
                            <div>
                                <span><spring:message code="label.cost"/><label>*</label></span>
                                <form:input path="price"/>
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
                                <form:textarea path="description" style="width: 96%; resize: none"/>
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