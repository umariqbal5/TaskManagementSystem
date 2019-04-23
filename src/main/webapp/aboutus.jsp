<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Info Windows</title>
    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        #map {
            height: 100%;
        }

        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<div id="map"></div>
<script>

    // This example displays a marker at the center of Australia.
    // When the user clicks the marker, an info window opens.

    function initMap() {
        var address1 = {lat: 14.0583, lng: 108.2772};
        var address2 = {lat: 30.3753, lng: 69.3451};
        var address3 = {lat: 9.1450, lng: 40.4897};
        var address4 = {lat: 31.9522, lng: 35.2332};
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 4,
            center: address1
        });

        var contentString1 = '' +
            '<p>Name: Viet Anh Phan</p>' +
            '<p>Country: Vietnam</p>' +
            '<p>Email: phanvietanh90@gmail.com</p>'+
            '<img width="100" height="100" src="images/phanvietanh.jpg">';

        var contentString2 = '' +
            '<p>Name: Muhammad Omer</p>' +
            '<p>Country: Pakistan</p>' +
            '<p>Email: mu.iqbal@mum.edu</p>' +
            '<img width="100" height="100" src="images/omar.jpg">';

        var contentString3 = '' +
            '<p>Name: Abdu Endris</p>' +
            '<p>Country:Ethiopioa </p>' +
            '<p>Email: ab.mohammed@mum.edu</p>' +
            '<img width="100" height="100" src="images/abdu.jpg">';

        var contentString4 = '' +
            '<p>Name: Hisham Quandil</p>' +
            '<p>Country: Palestine</p>' +
            '<p>Email:hishma.qandil@mum.edu </p>'+
            '<img width="100" height="100" src="images/hisham.jpg">';

        var infowindow1 = new google.maps.InfoWindow({
            content: contentString1
        });

        var infowindow2 = new google.maps.InfoWindow({
            content: contentString2
        });

        var infowindow3 = new google.maps.InfoWindow({
            content: contentString3
        });

        var infowindow4 = new google.maps.InfoWindow({
            content: contentString4
        });

        var marker1 = new google.maps.Marker({
            position: address1,
            map: map,
            title: 'Viet Anh Phan'
        });

        var marker2 = new google.maps.Marker({
            position: address2,
            map: map,
            title: 'Muhammad Omer'
        });

        var marker3 = new google.maps.Marker({
            position: address3,
            map: map,
            title: 'Abdu Endris'
        });

        var marker4 = new google.maps.Marker({
            position: address4,
            map: map,
            title: 'Hisham Quandil'
        });

        marker1.addListener('click', function () {
            infowindow1.open(map, marker1);
        });
        marker2.addListener('click', function () {
            infowindow2.open(map, marker2);
        });
        marker3.addListener('click', function () {
            infowindow3.open(map, marker3);
        });
        marker4.addListener('click', function () {
            infowindow4.open(map, marker4);
        });
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAev-Qq01-YRgRcTLgd-cCSUnOu5qiQrFg&callback=initMap">
</script>
</body>
</html>
