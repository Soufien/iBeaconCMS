(($) ->
  $flashNotice = $(".flash-notice");
  animationTime = 300;
  $flashNotice.slideDown animationTime, ->
    setTimeout (->
      $flashNotice.slideUp animationTime
      return;
    ), 2000;
  return;

)(jQuery);