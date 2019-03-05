// import hammertime from 'hammerjs';

const acceptBtn = document.querySelector('.match-accept.btn-respond.accept')
const declineBtn = document.querySelector('.match-decline.btn-respond.decline')

const hammerAccept = new Hammer(acceptBtn);
const hammerDecline = new Hammer(declineBtn);

hammerAccept.on("tap", function(event) {
  accept();

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
