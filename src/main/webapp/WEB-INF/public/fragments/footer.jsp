<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <ul class="footer_box">
                    <h4><spring:message code="author.text"/></h4>
                    <li><a href="#"><spring:message code="author.name1.text"/></a></li>
                    <li><a href="#"><spring:message code="author.name2.text"/></a></li>
                    <li><a href="#"><spring:message code="author.name3.text"/></a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul class="footer_box">
                    <h4><spring:message code="about.text"/></h4>
                    <li><a href="#"><spring:message code="about.team.text"/></a></li>
                    <li><a href="#"><spring:message code="about.faculty.text"/></a></li>
                    <li><a href="#"><spring:message code="about.school.text"/></a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul class="footer_box">
                    <ul class="social">
                        <li class="facebook"><a href="#"><span> </span></a></li>
                        <li class="twitter"><a href="#"><span> </span></a></li>
                        <li class="instagram"><a href="#"><span> </span></a></li>
                        <li class="pinterest"><a href="#"><span> </span></a></li>
                        <li class="youtube"><a href="#"><span> </span></a></li>
                    </ul>

                </ul>
            </div>
        </div>
        <div class="row footer_bottom">
            <div class="copy">
                <p>Copyright &copy; <%= Calendar.getInstance().get(Calendar.YEAR)%></p>
            </div>
        </div>
    </div>
</div>