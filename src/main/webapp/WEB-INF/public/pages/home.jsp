<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript"
        src="http://maps.google.com/maps/api/js?key=AIzaSyBzTslru94FNhjKFbamfBIDgbjFZmYPgxc"></script>
<div class="banner">
    <div id="map" style="width: 100%; height: 100vh;"></div>
    <script type="text/javascript">
        $(document).ready(() => {
            $.get('/get-markers', value => {
                let locations = [];
                console.log(value);

                for (let i = 0; i < value.length; ++i) {
                    locations.push([value[i].title, value[i].latitude, value[i].longitude, value[i].postId]);
                }

                let map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 10,
                    center: new google.maps.LatLng(10.8230989, 106.6296638),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                let infowindow = new google.maps.InfoWindow();

                let marker, i;

                for (i = 0; i < locations.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                        map: map
                    });

                    google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
                        return function() {
                            infowindow.setContent(locations[i][0]);
                            infowindow.open(map, marker);
                        }
                    })(marker, i));

                    google.maps.event.addListener(marker, 'click', (function(marker, i) {
                        return function() {
                            window.open('/detail?post-id=' + locations[i][3], '_blank');
                        }
                    })(marker, i));
                }
            });
        });
    </script>
</div>
<div class="features">
    <div class="container">
        <h3 class="m_3"><spring:message code="newest.title"/></h3>
        <div class="close_but"><i class="close1"> </i></div>
        <div class="row">
            <c:forEach items="${postNewsList}" var="postNews">
                <div class="col-md-3 top_box home-post">
                    <div class="view view-ninth">
                        <a href="<c:url value="/detail?post-id=${postNews.postId}"/>">
                            <img src="/image/${postNews.image}" class="img-responsive" style="height: 196px;"/>
                            <div class="mask mask-1"></div>
                            <div class="mask mask-2"></div>
                            <div class="content">
                                <h2>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${postNews.price}"/>
                                    VND
                                </h2>
                                <p>${postNews.address}</p>
                            </div>
                        </a>
                    </div>
                    <h4 class="m_4"><a href="<c:url value="/detail?post-id=${postNews.postId}"/>">${postNews.title}</a>
                    </h4>
                    <p class="m_5">${postNews.roomType}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>