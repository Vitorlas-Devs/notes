let num = 0

const text = document.getElementById('num')
const addBtn = document.getElementById('add')
const substractBtn = document.getElementById('substract')

const min = 0
const max = 500

const delay = 800
const rate = 100
let delayTimer
let rateTimer

addBtn.addEventListener('click', add)
substractBtn.addEventListener('click', substract)

function add() {
  num += 1
  text.value = num
  updateDisabled()
}

function substract() {
  num -= 1
  text.value = num
  updateDisabled()
}

updateDisabled()

function updateDisabled() {
  addBtn.disabled = num >= max
  substractBtn.disabled = num <= min

  if (num === max || num === min)
    killTimers()
}

function killTimers() {
  clearTimeout(delayTimer)
  clearTimeout(rateTimer)
}

addBtn.addEventListener('mouseover', () => {
  delayTimer = setTimeout(() => {
    rateTimer = setInterval(add, rate)
  }, delay)
})

addBtn.addEventListener('mouseout', killTimers)

substractBtn.addEventListener('mouseover', () => {
  delayTimer = setTimeout(() => {
    rateTimer = setInterval(substract, rate)
  }, delay)
})

substractBtn.addEventListener('mouseout', killTimers)
