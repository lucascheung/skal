
const acceptBtn = document.querySelector('.match-accept.btn-respond.accept')
const declineBtn = document.querySelector('.match-decline.btn-respond.decline')

const hammerAccept = new Hammer(acceptBtn);
const hammerDecline = new Hammer(declineBtn);



hammerAccept.on("tap", function(event) {
  accept();
});



hammerDecline.on("tap", function(event) {
  decline();
});

function accept() {
  console.log("running accept")
  const user_id = acceptBtn.dataset.user;
  const match_id = acceptBtn.dataset.match;
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
  let url = `/users/${user_id}/matches/${match_id}/decline`
  fetch( url, {
    method: "POST"
  })
  .then(response => response.json())
  .then((data) => {
    meet_time.innerHTML = data['new_time'];
  })
}
