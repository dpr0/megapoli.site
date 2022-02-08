// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "chartkick/chart.js"
import jquery from "jquery"
// require("./channels")

window.jQuery = jquery
window.$ = jquery
