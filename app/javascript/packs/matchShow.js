const acceptBtn = document.querySelector('.match-accept.btn-respond.accept')
const declineBtn = document.querySelector('.match-decline.btn-respond.decline')

const hammerAccept = new Hammer(acceptBtn);
const hammerDecline = new Hammer(declineBtn);

window.onload = function() {
  confirmed();
};

setInterval(function() {
  confirmed();
}, 5000);


hammerAccept.on("tap", function(event) {
  accept();
  confirmed();
});



hammerDecline.on("tap", function(event) {
  decline();
});

function accept() {
  console.log("running accept")
  const user_id = acceptBtn.dataset.user;
  const match_id = acceptBtn.dataset.match;
  acceptBtn.classList.remove('inactive')
  declineBtn.classList.remove('active')
  acceptBtn.classList.add('active')
  declineBtn.classList.add('inactive')
  let url = `/users/${user_id}/matches/${match_id}/accept`
  fetch( url, {
    method: "POST"
  })

}

function decline() {
  console.log("running decline")
  const meet_time = document.querySelector('.match-ask-time h3');
  const user_id = acceptBtn.dataset.user;
  const match_id = acceptBtn.dataset.match;
  const match_both_accept = document.querySelector('.match-both-accept');
  const match_accept_waiting = document.querySelector('.match-accept-waiting');
  const match_opposite_responded = document.querySelector('.match-opposite-responded');
  acceptBtn.classList.remove('active')
  declineBtn.classList.remove('inactive')
  match_both_accept.style.display = 'none';
  match_accept_waiting.style.display = 'none'
  let url = `/users/${user_id}/matches/${match_id}/decline`
  fetch( url, {
    method: "POST"
  })
  .then(response => response.json())
  .then((data) => {
    meet_time.innerHTML = data['new_time'];
  })
}

function confirmed() {
  console.log('running confirmed')
  const match_both_accept = document.querySelector('.match-both-accept');
  const match_accept_waiting = document.querySelector('.match-accept-waiting');
  const match_opposite_responded = document.querySelector('.match-opposite-responded');
  const user_id = acceptBtn.dataset.user;
  const match_id = acceptBtn.dataset.match;
  let url = `/users/${user_id}/matches/${match_id}/confirmed`
  fetch( url, {
    method: "POST"
  })
  .then(response => response.json())
  .then((data) => {
    console.log(data);
    if (data['confirmed'] === 'confirmed') {
      console.log('they have both accepted');
      acceptBtn.classList.add('active')
      declineBtn.classList.add('inactive')
      match_both_accept.style.display = 'block';
      match_accept_waiting.style.display = 'none';
      match_opposite_responded.style.display = 'none';
    } else if (data['confirmed'] === 'current_accepted') {
      console.log('waiting for match to respond')
      acceptBtn.classList.add('active')
      declineBtn.classList.add('inactive')
      match_accept_waiting.style.display = 'block';
      match_both_accept.style.display = 'none';
      match_opposite_responded.style.display = 'none';
    } else if (data['confirmed'] === 'match_accepted') {
      console.log('waiting for you to respond')
      acceptBtn.classList.remove('active')
      declineBtn.classList.remove('inactive')
      match_accept_waiting.style.display = 'none';
      match_both_accept.style.display = 'none'
      match_opposite_responded.style.display = 'block';
    } else {
      console.log('no one accepted')
      acceptBtn.classList.remove('active')
      declineBtn.classList.remove('inactive')
      match_accept_waiting.style.display = 'none';
      match_both_accept.style.display = 'none';
      match_opposite_responded.style.display = 'none';
    }
  })
}
