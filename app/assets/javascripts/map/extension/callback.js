$(function() {
  Gmaps.map.callback = function() {
    var this_map = Gmaps.map.serviceObject;

    // Center on Dnepropetrovsk if no markers set.
    var center = new google.maps.LatLng(48.464717, 35.04618299999993);
    this_map.setCenter(center);
    this_map.setZoom(12);

    // Common button.
    Fullscreen(this_map);

    // -- Callback type: HOME --
    if (typeof(form) === 'undefined') {
      // Mouse behavior.
      MouseHover(this_map);

      // Buttons.
      Hide(this_map);

      if (current_user_id != null) {
        //
      }
    }

    // -- Callback type: FORM_FOR --
    else {
      // Geocode new address on form changes  
      $('#country, #city, #street').change(function() {
        var country = $('#country').val();
        var city = $('#city').val();
        var street = $('#street').val();

        if (country == '' && city == '' && street == '') {
          $('#spot_location_attributes_coordinates').val(null);
        }
        else {
          var address = street + ', ' + city + ', ' + country;

          var geocoder = new google.maps.Geocoder();
          geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
              clearOverlays();
              placeMarker(results[0].geometry.location);
              updateFormLocation(results[0].geometry.location);
            }
          });
        }
      });

      // Listen to drag of existing @json's marker
      if (Gmaps.map.markers != '') {
        google.maps.event.addListener(Gmaps.map.markers[0].serviceObject, 'dragend', function() {
          updateFormLocation(this.getPosition());
        });
      }

      // On click, clear markers, place a new one, update coordinates in the form
      google.maps.event.addListener(Gmaps.map.serviceObject, 'click', function(event) {
        clearOverlays();
        placeMarker(event.latLng);
        updateFormLocation(event.latLng);
      });

      // Add a marker with an open infowindow
      var markersArray = [];
      function placeMarker(latLng) {
        var image = new google.maps.MarkerImage(
          '/assets/map/spot.png',
          new google.maps.Size(32,37)
        );
        var marker = new google.maps.Marker({
            position: latLng,
            icon: image,
            map: Gmaps.map.serviceObject,
            draggable: true
        });
        markersArray.push(marker);

        // Set and open infowindow
        var infowindow = new google.maps.InfoWindow({
          content: '<b>Перетащите маркер с помощью мыши<br>или кликните в нужном месте на карте,<br>если координаты определились не верно.</b>'
        });
        infowindow.open(Gmaps.map.serviceObject, marker);
        // Listen to drag & drop
        google.maps.event.addListener(marker, 'dragend', function() {
          updateFormLocation(this.getPosition());
        });
      }

      // Update form attributes with given coordinates
      function updateFormLocation(latLng) {
        var coordinates = [latLng.lng(), latLng.lat()];
        $('#spot_location_attributes_coordinates').val(coordinates);
      }

      // Removes the overlays from the map
      function clearOverlays() {
        if (Gmaps.map.markers != '') {
          Gmaps.map.clearMarker(Gmaps.map.markers[0]);
          Gmaps.map.hideMarker(Gmaps.map.markers[0]);
        }

        if (markersArray) {
          for (var i = 0; i < markersArray.length; i++ ) {
            markersArray[i].setMap(null);
          }
        }
        markersArray.length = 0;
      }
    }
  }
});