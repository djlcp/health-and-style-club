document.addEventListener("turbolinks:load", function() {
  var slideIndex = 1;
  showSlides(slideIndex);

  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlidesTestimonial");
    var dots = document.getElementsByClassName("dotTestimonial");
    if (n > slides.length) {
      slideIndex = 1
    } 
    if (n < 1) {
      slideIndex = slides.length
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none"; 
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" activeTestimonial", "");
    }
    slides[slideIndex -1].style.display = "block"; 
    dots[slideIndex -1].className += " activeTestimonial";
  }

  $('.js-dotTestimonial').on('click', function() {
    var number = $(this).data('number')
    showSlides(slideIndex = number)
  });

  $('.js-nextTestimonial, .js-prevTestimonial').on('click', function() {
    var number = $(this).data('number')
    showSlides(slideIndex += number)
  })
});