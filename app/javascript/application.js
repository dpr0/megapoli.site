// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "chartkick/chart.js"
import jquery from "jquery"
import bulmaCarousel from "bulma-carousel"
// require("./channels")

window.jQuery = jquery
window.$ = jquery

bulmaCarousel.attach('#carousel-demo', { slidesToScroll: 1, slidesToShow: 4 });
