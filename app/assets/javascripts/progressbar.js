document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

progressBarFill = document.getElementsByClassName('progress-bar-fill')[0]

percentProgress = document.getElementsByClassName('progress-percentage')[0]
percentProgress = parseFloat(percentProgress.innerHTML.trim().substr(0, percentProgress.innerHTML.trim().length - 1))

totalBarWidth = document.getElementsByClassName('progress-bar')[0].offsetWidth;

width = totalBarWidth * (percentProgress / 100)

progressBarFill.style.width = width + 'px'




});
