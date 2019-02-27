const maleBtn = document.querySelector(".option-circle .male");
const femaleBtn = document.querySelector(".option-circle .female");

// function createButtonListener(love) {
//   return function(event) {
//     var cards = document.querySelectorAll(".tinder--card:not(.removed)");
//     var moveOutWidth = document.body.clientWidth * 1.5;

//     if (!cards.length) return false;

//     var card = cards[0];

//     card.classList.add("removed");

//     if (love) {
//       card.style.transform =
//         "translate(" + moveOutWidth + "px, -100px) rotate(-30deg)";
//         swipedRight(event.target.id);
//     } else {
//       card.style.transform =
//         "translate(-" + moveOutWidth + "px, -100px) rotate(30deg)";
//         swipedLeft(event.target.id);
//     }

//     initCards();

//     event.preventDefault();
//   };
// }
