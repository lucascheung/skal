window.onload = function() {
  document.body.className += ' loaded'
};

$(document).ready(function() {
  $('.pour') //Pour Me Another Drink, Bartender!
    .delay(500)
    .animate({
      height: '400px'
      }, 1500)
    .delay(1600)
    .slideUp(500);

  $('#liquid') // I Said Fill 'Er Up!
    .delay(500)
    .animate({
      height: '50vh'
    }, 2500);

  $('.beer-foam') // Keep that Foam Rollin' Toward the Top! Yahooo!
    .delay(500)
    .animate({
      bottom: '48vh'
      }, 2500);

  $('.skal_logo')
    .delay(2300)
    .fadeIn(600);
});
