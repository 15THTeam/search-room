<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!----details-product-slider--->
<!-- Include the Etalage files -->
<link rel="stylesheet" href="<c:url value="/resources/public/css/etalage.css"/>"/>
<script src="<c:url value="/resources/public/js/jquery.etalage.min.js"/>"></script>
<!-- Include the Etalage files -->
<script>
    jQuery(document).ready(function ($) {
        $('#etalage').etalage({
            thumb_image_width: 300,
            thumb_image_height: 400,

            show_hint: true,
            click_callback: function (image_anchor, instance_id) {
                alert('Callback example:\nYou clicked on an image with the anchor: "'
                    + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
            }
        });
        // This is for the dropdown list example:
        $('.dropdownlist').change(function () {
            etalage_show($(this).find('option:selected').attr('class'));
        });

    });
</script>
<script type="text/javascript"
        src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBzTslru94FNhjKFbamfBIDgbjFZmYPgxc&sensor=false"></script>
<script type="text/javascript">
    var gmap = new google.maps.LatLng(${postDetail.latitude}, ${postDetail.longitude});
    var marker;

    function initialize() {
        var mapProp = {
            center: new google.maps.LatLng(${postDetail.latitude}, ${postDetail.longitude}),
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map"), mapProp);

        var styles = [{
            featureType: 'road.arterial',
            elementType: 'all',
            stylers: [
                {hue: '#fff'},
                {saturation: 100},
                {lightness: -48},
                {visibility: 'on'}
            ]
        }, {
            featureType: 'road',
            elementType: 'all',
            stylers: []
        }, {
            featureType: 'water',
            elementType: 'geometry.fill',
            stylers: [
                {color: '#adc9b8'}
            ]
        }, {
            featureType: 'landscape.natural',
            elementType: 'all',
            stylers: [
                {hue: '#809f80'},
                {lightness: -35}
            ]
        }
        ];

        var styledMapType = new google.maps.StyledMapType(styles);
        map.mapTypes.set('Styled', styledMapType);

        marker = new google.maps.Marker({
            map: map,
            draggable: true,
            animation: google.maps.Animation.DROP,
            position: gmap
        });
        google.maps.event.addListener(marker, 'click', toggleBounce);
    }

    function toggleBounce() {
        if (marker.getAnimation() !== null) {
            marker.setAnimation(null);
        } else {
            marker.setAnimation(google.maps.Animation.BOUNCE);
        }
    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!----//details-product-slider--->
<div class="main">
    <div class="shop_top">
        <div class="container">
            <h3 class="m_3">Room's Detail</h3>
            <div class="row">
                <div class="col-md-9 single_left">
                    <div class="single_image">
                        <ul id="etalage">
                            <li>
                                <a href="#">
                                    <img class="etalage_thumb_image" src="/image/${postDetail.image}"/>
                                    <img class="etalage_source_image" src="/image/${postDetail.image}"/>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- end product_slider -->
                    <div class="single_right">
                        <h3>${postDetail.title}</h3>
                        <p class="m_10">${postDetail.address}</p>
                        <ul class="options">
                            <h4 class="m_12">Area (m<sup>2</sup>)</h4>
                            <p class="m_10">${postDetail.area}</p>
                        </ul>
                        <ul class="options">
                            <h4 class="m_12">Room type</h4>
                            <p class="m_10">${postDetail.roomType}</p>
                        </ul>
                        <ul class="add-to-links">
                            <li>Updated at: <i>${postDetail.createdAt}</i></li>
                            <li>By: <i>${postDetail.fullName}</i></li>
                            <li>Email: <i>${postDetail.email}</i></li>
                            <li>Phone number: <i>${postDetail.phoneNumber}</i></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="col-md-3">
                    <div class="box-info-product">
                        <p class="price2">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${postDetail.price}"/>
                            VND per month
                        </p>
                    </div>
                </div>
            </div>
            <div class="desc">
                <h4>Description</h4>
                <p>${postDetail.description}</p>
            </div>
            <div class="row">
                <h4 class="m_11">Map</h4>
                <div id="map" style="width: 100%; height: 300px;">Google Map</div>
            </div>
        </div>
    </div>
</div>