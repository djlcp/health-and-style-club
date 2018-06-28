$(document).on('turbolinks:load', function() {
  $('.js-slick-carousel').slick({
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 1,
    autoplay: true,
    autoplaySpeed: 4000,
    infinite: true,
  })
});