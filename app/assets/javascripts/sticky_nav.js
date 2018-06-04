// When the user scrolls the page, execute myFunction
window.onscroll = function() {scroll()};

// Get the navbar
var navbar = document.getElementById("navbar");

var content = document.getElementById("content")

// Get the offset position of the navbar
var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function scroll() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
    content.classList.add("content-padding")
  } else {
    navbar.classList.remove("sticky")
    content.classList.remove("content-padding")
  }
}
