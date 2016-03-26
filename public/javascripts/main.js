$(function() {

  $('input').on('keyup', function(e) {
    if (e.which !== 13) return;

    var zip = $('.zip').val();
    var $body = $('body');
    var $result = $('.result-wrapper');

    $('.input-wrapper').removeClass('first-time');

    e.preventDefault();
    $.ajax({
      url: "/search",
      type: 'POST',
      data: { zip: zip },
      dataType: 'json',
      success: function(data) {
        var $image = $result.find('img');
        var $temp = $result.find('h2');
        $body.removeClass();
        $body.addClass(data.weather_class);
        $result.show();
        $image.attr('src', 'images/' + data.weather_class + '.png');
        $temp.html(data.weather + '&deg; F');
      }
    })
  })

});