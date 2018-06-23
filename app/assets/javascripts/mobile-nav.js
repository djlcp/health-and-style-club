$( document ).on('turbolinks:load', function() {
  $('.mobile-nav').on('click', function() {
    $('.mobile-nav__menu').addClass('mobile-nav__menu-active');
    $('.mobile-nav__close').show();
  });

  $('.mobile-nav__close').on('click', function(event) {
    $('.mobile-nav__menu').removeClass('mobile-nav__menu-active');
    $('.mobile-nav__close').hide();
    event.stopPropagation();
  });
})