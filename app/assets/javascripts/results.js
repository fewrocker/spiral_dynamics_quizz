document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

function getMaxOfArray(numArray) {
    return Math.max.apply(null, numArray);
}

allPercentages = document.getElementsByClassName('result-resonance-result')
minSize = 20
maxSize = 50
pcts = []

Array.prototype.forEach.call(allPercentages, percentage => {
  // Transform the result element into a float
  pct = percentage.innerHTML
  pct = pct.trim()
  pct = pct.substr(0, pct.length - 1)
  pct = parseFloat(pct)
  pcts.push(pct)

  //Make negative resonances red and positive resonances green
  //Also, put the - and + signs into the element with a better style
  if (pct < 0) {
    percentage.style.color = 'red'
    percentage.innerHTML = '− ' + percentage.innerHTML.trim().substr(1, percentage.innerHTML.length)
  } else {
    percentage.innerHTML = '+' + percentage.innerHTML
    percentage.style.color = 'green'
  }

  // Font size of result varies with the result itself
  if (pct < 0) {
    size = minSize
  } else {
    size = minSize + (maxSize - minSize) * (pct/100)
  }

  percentage.style.fontSize = size.toString() + 'px'

});

// Make the center of gravity highlighted
allPercentages[pcts.indexOf(getMaxOfArray(pcts))].style.fontWeight = 'bold'


});
