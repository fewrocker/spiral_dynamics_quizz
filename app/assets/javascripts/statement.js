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

sliders = document.getElementsByClassName('statement-slider')

allMarkers = document.getElementsByClassName('statement-slider-placeholder')

allAnswers = document.getElementsByClassName('question-value-input')
//Default initial values for answers is Neutral
Array.prototype.forEach.call(allAnswers, answer => {
  answer.value = 2;
});

Array.prototype.forEach.call(sliders, slider => {
  slider.oninput = function() {
    //Get which slider has moved
    whichQuestion = (index(this.parentNode.parentNode) - 5)/2;
    whichAnswer = parseInt(this.value,10)

    //Get indexes of group
    groupIndex = []
    groupIndex.push(whichQuestion * 5)
    groupIndex.push(whichQuestion * 5 + 1)
    groupIndex.push(whichQuestion * 5 + 2)
    groupIndex.push(whichQuestion * 5 + 3)
    groupIndex.push(whichQuestion * 5 + 4)
    //Make selection bold
    Array.prototype.forEach.call(groupIndex, index => {
      allMarkers[index].style.fontWeight = 'normal'
      allMarkers[index].style.color = 'rgba(200,200,200,1)'
    });

    //Change color of slider
    if (whichAnswer === 0) {
      this.style.backgroundColor = 'rgba(255,30,30,1)'
    } else if (whichAnswer === 1) {
      this.style.backgroundColor = 'rgba(255,90,90,1)'
    } else if (whichAnswer === 2) {
      this.style.backgroundColor = 'rgba(200,200,200,1)'
    } else if (whichAnswer === 3) {
      this.style.backgroundColor = 'rgba(110,255,110,1)'
    } else {
      this.style.backgroundColor = 'rgba(10,255,10,1)'
    }

    allMarkers[whichAnswer + 5*whichQuestion].style.fontWeight = 'bold'
    allMarkers[whichAnswer + 5*whichQuestion].style.color = 'rgba(50,50,50,1)'

    //Change the answer input
    allAnswers[whichQuestion].value = whichAnswer
  }
});









});
