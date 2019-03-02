window.onload = function() {
  document.body.className += ' loaded'
};

$(document).ready(function() {
  $('.pour') //Pour Me Another Drink, Bartender!
    .delay(2000)
    .animate({
      height: '400px'
      }, 1500)
    .delay(1600)
    .slideUp(500);

  $('#liquid') // I Said Fill 'Er Up!
    .delay(2000)
    .animate({
      height: '280px'
    }, 2500);

  $('.beer-foam') // Keep that Foam Rollin' Toward the Top! Yahooo!
    .delay(2000)
    .animate({
      bottom: '280px'
      }, 2500);

  $('.tagline')
    .delay(2000)
    .animate({
      bottom: '50px'
      }, 2500);
});
