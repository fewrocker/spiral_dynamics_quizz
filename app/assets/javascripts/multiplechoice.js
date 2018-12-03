document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

function index(el) {
    var children = el.parentNode.childNodes,
        i = 0;
    for (; i < children.length; i++) {
        if (children[i] == el) {
            return i;
        }
    }
    return -1;
}

mChoiceOptions = document.getElementsByClassName("mchoice-option")
mChoiceSquares = document.getElementsByClassName("check-icon")

mChoiceOptionInput = document.getElementById("opt-select")

//Start with fake button
proceedButtonTrue = document.getElementsByClassName("proceed-btn-mchoice")[0]
proceedButtonFake = document.getElementsByClassName("fake-proceed-button")[0]
proceedButtonTrue.style.display = "none"

Array.prototype.forEach.call(mChoiceOptions, option => {
  option.addEventListener('click', function() {
    proceedButtonTrue.style.display = ""
    proceedButtonFake.style.display = "none"

    optionClicked = (index(option) - 5)/2

    //Unselect all options: square + text decoration
    Array.prototype.forEach.call(mChoiceSquares, square => {
      square.classList.remove('fa-check-square')
      square.classList.remove('fa-square')
    });
    Array.prototype.forEach.call(mChoiceOptions, option => {
      option.classList.remove('mchoice-highlight-text')
    });

    //Select clicked option
    mChoiceSquares[optionClicked].classList.add('fa-check-square')

    Array.prototype.forEach.call(mChoiceSquares, square => {
      if (square.classList.contains('fa-check-square') === false) {
        square.classList.add('fa-square')
      }
    });

    mChoiceOptions[optionClicked].classList.add('mchoice-highlight-text')

    //Update hidden form input field

    mChoiceOptionInput.value = optionClicked.toString();

  });
});









});
