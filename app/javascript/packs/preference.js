const maleBtn = document.querySelector('.option-circle.male');
const femaleBtn = document.querySelector('.option-circle.female');


function toggleGender(gender) {
  return function(event) {
    if (gender === 'male') {
      console.log('changed to swipe males');
      maleBtn.classList.add('on');
      femaleBtn.classList.remove('on');
    } else {
      console.log('changed to swipe females');
      femaleBtn.classList.add('on');
      maleBtn.classList.remove('on');
    }
  }
}

maleBtn.addEventListener("click", toggleGender('male'))
femaleBtn.addEventListener("click", toggleGender('female'))

