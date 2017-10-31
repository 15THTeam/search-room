<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <h3>ROOM INFORMATION</h3>
                            <p style="font-weight: bold; color: #de6507">${message}</p>
                            <div>
                                <span>Title<label>*</label></span>
                                <form:input path="title"/>
                            </div>
                            <div>
                                <span>Address<label>*</label></span>
                                <form:input path="address"/>
                            </div>
                            <div>
                                <span>Area<label>*</label> (m<sup>2</sup>)</span>
                                <form:input path="area"/>
                            </div>
                            <div>
                                <span>Price<label>*</label></span>
                                <form:input path="price"/>
                            </div>
                            <div>
                                <span>Room Type<label>*</label></span>
                                <form:select path="typeId">
                                    <c:forEach items="${roomTypeList}" var="roomType">
                                        <form:option value="${roomType.id}">${roomType.description}</form:option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div>
                                <span>Description<label>*</label></span>
                                <form:textarea path="description" style="width: 96%; resize: none"/>
                            </div>
                            <c:if test="${post.postId == 0}">
                                <div>
                                    <span>Images</span>
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