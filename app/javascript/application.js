// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


document.addEventListener('DOMContentLoaded', function () {
  var myCarousel = document.querySelector('#carouselExampleIndicators')
  var carousel = new bootstrap.Carousel(myCarousel)
});


