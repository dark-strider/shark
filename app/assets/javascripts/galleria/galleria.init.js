Galleria.loadTheme('/assets/galleria/galleria.twelve.js');

Galleria.configure({
  preload: 4,
  // width: ($(window).width()-30),
  width: 600,
  height: 0.5625, // 16:9
  imageCrop: false,
  thumbCrop: false,
  maxScaleRatio: 1,
  transition: 'fade',
  fullscreenTransition: false, // pulse

  _showPopout: false,
  _locale: {
    show_thumbnails: 'Посмотреть все фото',
    hide_thumbnails: 'Вернуться к фото',
    play: 'Смотреть слайдшоу',
    pause: 'Остановить слайдшоу',
    enter_fullscreen: 'Полноэкранный режим',
    exit_fullscreen: 'Свернуть',
    // popout_image: 'В отдельном окне',
    showing_image: '%s-е фото из %s'
  }
});