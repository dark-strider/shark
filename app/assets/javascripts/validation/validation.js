// validation qr-code on checkin
//
function validate_code(thisform) {
  var code = $(thisform).find('#qrcode').val().length;
  if (code != 0) {
    return true;
  }
  else {
    $(thisform).find('#qrcode').attr('placeholder', 'Сначала введите код ...').blur();
    return false;
  }
}