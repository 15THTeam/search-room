<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript"
        src="http://maps.google.com/maps/api/js?key=AIzaSyBzTslru94FNhjKFbamfBIDgbjFZmYPgxc&v=3&libraries=geometry"></script>
<div class="banner">
    <div id="googleMap" style="width:100%; height:100vh;"></div>
    <script type="text/javascript">
        let myCenter = new google.maps.LatLng(10.823099, 106.629664); // Sai Gon
        let map;
        let isDrawedCircle = false;
        let circle = new google.maps.Circle();
        let pickMarker = new google.maps.Marker();
        let roomMarkers = [];
        let locations = [];

        $(document).ready(() => {
            $.get('/get-markers', value => {
                for (let i = 0; i < value.length; ++i) {
                    locations.push([value[i].title, value[i].latitude, value[i].longitude, value[i].postId]);
                }
            });
        });

        function initialize() {
            let mapProp = {
                center: myCenter,
                zoom: 10,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            map = new google.maps.Map(document.getElementById('googleMap'), mapProp);

            google.maps.event.addListener(map, 'click', function (event) {
                if (isDrawedCircle) {
                    circle.setMap(null);
                    pickMarker.setMap(null);
                    for (let i = 0; i < roomMarkers.length; ++i) {
                        roomMarkers[i].setMap(null);
                    }
                }

                let rad = prompt('<spring:message code="enter.radius"/> ');
                if (isNaN(parseFloat(rad)))
                    return;

                circle = new google.maps.Circle({
                    center: event.latLng,
                    radius: parseFloat(rad),
                    strokeColor: '#0000FF',
                    strokeOpacity: 0.8,
                    strokeWeight: 1,
                    fillColor: '0000FF',
                    fillOpacity: 0.3
                });
                circle.setMap(map);

                pickMarker = new google.maps.Marker({
                    position: event.latLng,
                    map: map,
                    animation: google.maps.Animation.BOUNCE
                });
                pickMarker.setMap(map);

                isDrawedCircle = true;

                for (let i = 0; i < locations.length; i++) {
                    let distance = google.maps.geometry.spherical.computeDistanceBetween(
                        new google.maps.LatLng(event.latLng.lat(), event.latLng.lng()),
                        new google.maps.LatLng(locations[i][1], locations[i][2])
                    );

                    if (distance <= rad) {
                        let marker = new google.maps.Marker({
                            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                            map: map
                        });

                        let infowindow = new google.maps.InfoWindow();

                        google.maps.event.addListener(marker, 'mouseover', (function (marker, i) {
                            return function () {
                                infowindow.setContent(locations[i][0]);
                                infowindow.open(map, marker);
                            }
                        })(marker, i));

                        google.maps.event.addListener(marker, 'click', (function (marker, i) {
                            return function () {
                                window.open('/detail?post-id=' + locations[i][3], '_blank');
                            }
                        })(marker, i));

                        roomMarkers.push(marker);
                    }
                }
            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);
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
                            <c:choose>
                                <c:when test="${empty postNews.image}">
                                    <img src="<c:url value="/image/no-image"/>" class="img-responsive" style="height: 196px;"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="/image/${postNews.image}" class="img-responsive" style="height: 196px;"/>
                                </c:otherwise>
                            </c:choose>
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