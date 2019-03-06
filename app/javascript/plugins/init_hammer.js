import hammertime from 'hammerjs';

var tinderContainer = document.querySelector(".tinder");
var allCards = document.querySelectorAll(".tinder--card");
var nope = document.getElementById("nope");
var love = document.getElementById("love");


function initCards(card, index) {
  var newCards = document.querySelectorAll(".tinder--card:not(.removed)");

  newCards.forEach(function(card, index) {
    card.style.zIndex = allCards.length - index;
    card.style.transform =
      "scale(" + (20 - index) / 20 + ") translateY(-" + 20.1 * index + "px)";
    card.style.opacity = (10 - index) / 10;
  });
  if (tinderContainer) {
    tinderContainer.classList.add("loaded");
  }
}

initCards();

allCards.forEach(function(el) {
  var hammertime = new Hammer(el);

  hammertime.on("pan", function(event) {
    el.classList.add("moving");
  });

  hammertime.on("pan", function(event) {
    if (event.deltaX === 0) return;
    if (event.center.x === 0 && event.center.y === 0) return;

    tinderContainer.classList.toggle("tinder_love", event.deltaX > 0);
    tinderContainer.classList.toggle("tinder_nope", event.deltaX < 0);

    var xMulti = event.deltaX * 0.03;
    var yMulti = event.deltaY / 80;
    var rotate = xMulti * yMulti;

    event.target.style.transform =
      "translate(" +
      event.deltaX +
      "px, " +
      event.deltaY +
      "px) rotate(" +
      rotate +
      "deg)";
  });

  hammertime.on("panend", function(event) {
    el.classList.remove("moving");
    tinderContainer.classList.remove("tinder_love");
    tinderContainer.classList.remove("tinder_nope");

    var moveOutWidth = document.body.clientWidth;
    var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

    event.target.classList.toggle("removed", !keep);

    if (keep) {
      event.target.style.transform = "";
    } else {
      var endX = Math.max(
        Math.abs(event.velocityX) * moveOutWidth,
        moveOutWidth
      );
      var toX = event.deltaX > 0 ? endX : -endX;
      var endY = Math.abs(event.velocityY) * moveOutWidth;
      var toY = event.deltaY > 0 ? endY : -endY;
      var xMulti = event.deltaX * 0.03;
      var yMulti = event.deltaY / 80;
      var rotate = xMulti * yMulti;

      event.target.style.transform =
        "translate(" +
        toX +
        "px, " +
        (toY + event.deltaY) +
        "px) rotate(" +
        rotate +
        "deg)";
      initCards();
      if (toX > 0) {
        swipedRight(event.target.id);
        checkMatch(event.target.id);
      } else {
        swipedLeft(event.target.id);
      }
    }
  });

  hammertime.on('tap', function(event) {
    let photos = JSON.parse(event.target.dataset.photos);
    let newIndex = photoIndex(photos, event);
    event.target.dataset.photoIdx = newIndex;
    let photo = photos[newIndex];
    let bgImage = `linear-gradient(rgba(0, 0, 0, 0) 80%, rgba(0, 0, 0, 0.8) 100%), url('${photo}')`;
    event.target.style.backgroundImage = bgImage;
  });
});


function photoIndex(photos, event) {
  if (parseInt(event.target.dataset.photoIdx, 10) + 1 >= photos.length) {
    return 0;
  } else {
    return parseInt(event.target.dataset.photoIdx, 10) + 1;
  }
}




function checkMatch(card_id) {
  console.log('checking match');
  const user_id = card_id.substring(4);
  let url = `users/${user_id}/check_match/`;
  fetch( url, {
    method: "GET"
  })
  .then(response => response.json())
  .then((data) => {
    console.log(data)
    if (data['match']) {
      matchAlert(data);
    }
  })
}

function swipedRight(card_id) {
  const user_id = card_id.substring(4);
  console.log("swiped right");
  let url = `users/${user_id}/swiped_right/`;
  fetch( url, {
    method: "POST"
  })
}

function swipedLeft(card_id) {
  const user_id = card_id.substring(4);
  console.log("swiped left");
  let url = `users/${user_id}/swiped_left/`;
  fetch( url, {
    method: "POST",
  })
}


function matchAlert(data) {
  console.log('show alert')
  var matchInsertModal = document.getElementById("match-modal-insert");
  var title = matchInsertModal.querySelector(".modal-title");
  var photo = matchInsertModal.querySelector(".match-modal-image");
  var link = matchInsertModal.querySelector(".checkout");
  title.innerHTML = `You've matched with ${data['name']}`;
  photo.src = data.photo;
  link.setAttribute('href', `users/${data['user']}/matches/${data['match']}`);

  $('#matchModal').modal('show');
}

