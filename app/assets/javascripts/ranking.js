document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

//Save original order
originalOrder = document.getElementsByClassName('ranking-option')
originalOrderValues = []
Array.prototype.forEach.call(originalOrder, item => {
  originalOrderValues.push(item.innerHTML)
});

//Answer Input default
rankingOrderInput = document.getElementById("ranking-select")
if (originalOrder.length === 12) {
  rankingOrderInput.value = "000102030405060708091011"
} else if (originalOrder.length === 8) {
  rankingOrderInput.value = "0001020304050607"
}

//Colorize
function colorize() {
  colorizeItems = document.getElementsByClassName('ranking-option')

  if (colorizeItems.length === 12) {
    colorizeItems[0].style.backgroundColor = 'rgba(100,255,100,0.7)'
    colorizeItems[1].style.backgroundColor = 'rgba(130,255,100,0.7)'
    colorizeItems[2].style.backgroundColor = 'rgba(160,255,100,0.7)'
    colorizeItems[3].style.backgroundColor = 'rgba(190,255,100,0.7)'
    colorizeItems[4].style.backgroundColor = 'rgba(220,255,100,0.7)'
    colorizeItems[5].style.backgroundColor = 'rgba(255,255,100,0.7)'
    colorizeItems[6].style.backgroundColor = 'rgba(255,255,100,0.7)'
    colorizeItems[7].style.backgroundColor = 'rgba(255,220,100,0.7)'
    colorizeItems[8].style.backgroundColor = 'rgba(255,190,100,0.7)'
    colorizeItems[9].style.backgroundColor = 'rgba(255,160,100,0.7)'
    colorizeItems[10].style.backgroundColor = 'rgba(255,130,100,0.7)'
    colorizeItems[11].style.backgroundColor = 'rgba(255,100,100,0.7)'
  } else if (colorizeItems.length === 8) {
    colorizeItems[0].style.backgroundColor = 'rgba(100,255,100,0.7)'
    colorizeItems[1].style.backgroundColor = 'rgba(150,255,100,0.7)'
    colorizeItems[2].style.backgroundColor = 'rgba(200,255,100,0.7)'
    colorizeItems[3].style.backgroundColor = 'rgba(255,255,100,0.7)'
    colorizeItems[4].style.backgroundColor = 'rgba(255,255,100,0.7)'
    colorizeItems[5].style.backgroundColor = 'rgba(255,200,100,0.7)'
    colorizeItems[6].style.backgroundColor = 'rgba(255,150,100,0.7)'
    colorizeItems[7].style.backgroundColor = 'rgba(255,100,100,0.7)'
  }

}

colorize()

// Simple list
Sortable.create(simpleList, {
    onEnd: function (/**Event*/evt) {
    var itemEl = evt.item;  // dragged HTMLElement
    evt.oldIndex;  // element's old index within old parent
    evt.newIndex;  // element's new index within new parent

    //Get current order
    currentOrder = document.getElementsByClassName('ranking-option')
    currentOrderValues = []
    Array.prototype.forEach.call(currentOrder, item => {
      currentOrderValues.push(item.innerHTML)
    });

    currentOrderIndexes = []
    Array.prototype.forEach.call(currentOrder, item => {
      currentOrderIndexes.push(originalOrderValues.indexOf(item.innerHTML))
    });

    currentOrderString = ""
    Array.prototype.forEach.call(currentOrderIndexes, index => {
      if (index >= 0 && index < 10) {
        currentOrderString += "0"
        currentOrderString += index.toString()
      } else {
        currentOrderString += index.toString()
      }
    });

    rankingOrderInput.value = currentOrderString
    colorize()

  },
});















});
