function Fullscreen(map) {
  var button = document.createElement('fullscreen');
  var width = $('#map').css('width');
  var height = $('#map').css('height');
  var new_width = width;
  var full_title = 'Развернуть на весь экран';
  var full_html = 'Развернуть';
  // var center = new google.maps.LatLng(48.464717, 35.04618299999993);
  button.index = 1;
  button.title = full_title;
  button.innerHTML = full_html;
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(button);

  google.maps.event.addDomListener(button, 'click', function() {
    if (width == new_width) {
      button.title = 'Свернуть до исходного размера';
      button.innerHTML = 'Свернуть';

      $('#map').css('position', 'fixed').
        css('top', 0).
        css('left', 0).
        css('width', '100%').
        css('height', '100%');
      google.maps.event.trigger(map, 'resize');
      new_width = $('#map').css('width');
      // map.setCenter(center);
      return false;
    }
    else {
      button.title = full_title;
      button.innerHTML = full_html;

      $('#map').css('position', 'relative').
        css('top', 0).
        css('width', width).
        css('height', height);
      google.maps.event.trigger(map, 'resize');
      new_width = $('#map').css('width');
      // map.setCenter(center);
      return false;
    }
  });
}

function Hide(map) {
  var button = document.createElement('hide');
  var full_title = 'Скрыть всё кроме открытого окна';
  var full_html = 'Скрыть';
  button.index = 1;
  button.title = full_title;
  button.innerHTML = full_html;
  map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(button);
  
  google.maps.event.addDomListener(button, 'click', function() {
    if (button.innerHTML == full_html) {
      button.title = 'Показать все маркеры';
      button.innerHTML = 'Показать';
      Gmaps.map.hideMarkers();
    }
    else {
      button.title = full_title;
      button.innerHTML = full_html;
      Gmaps.map.showMarkers();
    }
  });
}