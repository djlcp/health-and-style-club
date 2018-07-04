$( document ).on('turbolinks:load', function() {
  $('.js-masterclass-slider').slick({
    centerMode: true,
    dots: true,
    centerPadding: '60px',
    slidesToShow: 2,
    infinite: true,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 1
        }
      }
    ]
  });

  function getMasterclass(id) {
    $.ajax({
      url: 'masterclasses/' + id,
      dataType: 'JSON',
      success: function(response) {
        $('.js-masterclass-title').html(response.title);
        $('.js-masterclass-expert-name').html(response.expert_name);
        $('.js-masterclass-description').html(response.text);
        $('.js-masterclass-link').attr('href', response.path);
        $('.js-masterclass-image').css('background-image', 'linear-gradient(rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0.8)) url(' + response.image_path + ')');
      },
    });
  }

  $('.js-masterclass-slider').on('afterChange', function(event, slick, currentSlide){
    var masterclassId = $(event.target).data('ids')[currentSlide];
    getMasterclass(masterclassId)
  });
});