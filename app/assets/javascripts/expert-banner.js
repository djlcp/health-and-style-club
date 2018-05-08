document.addEventListener("turbolinks:load", function() {
  var slideIndex = 1;
  showSlides(slideIndex);

  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
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
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex -1].style.display = "block"; 
    dots[slideIndex -1].className += " active";
  }

  $('.js-dot').on('click', function() {
    var number = $(this).data('number')
    showSlides(slideIndex = number)
  });

  $('.js-next, .js-prev').on('click', function() {
    var number = $(this).data('number')
    showSlides(slideIndex += number)
  })
});